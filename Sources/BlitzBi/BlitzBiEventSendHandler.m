//
//  BlitzBiEventSendHandler.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzBiEventSendHandler.h"
#import "BlitzBiConfig.h"
#import "BlitzFileHelper.h"
#import "BlitzDeviceUtils.h"
#import "BlitzBiService.h"
#import "BlitzBiEventRepository.h"
#import "BlitzRequestBuilder.h"
#import "BlitzConstants.h"
#import "BlitzTime.h"
#import "BlitzLogger.h"

#define COMMON_FIELD_3 @"common_field_3"
#define FILE_NAME @"filename"

@interface BlitzBiEventSendHandler()
- (void)addNotification;
- (void)onPause;
- (void)onResume;
- (void)onDestroy;
- (long long)getCurrentEpochTime;
- (void)fireSessionLengthEvent;
- (void)fireSessionStartEvent;
- (void)fireSessionPauseEvent;
- (void)fireAppCrashEvent;
- (void)startRepeatedTimerToAttemptFlush;
- (void)invalidateTimer;
- (void)timerTicked;
- (void)onSessionTimedOut;
- (void (^)(void))checkAndFlushAndArchiveBlock:(BOOL)isForced;
- (void)flushWithIsForced:(BOOL)isForced;
- (BOOL)checkAndFlushWithIsForced:(BOOL)isForced;
- (BOOL)handleNetworkResponse:(NSObject *)response withError:(NSError *)error;
- (void)archiveEvents;
- (NSString*)eventsFilePath;
- (void)removeDefectiveEvents;
- (BOOL)archiveObject:(id)object withFilePath:(NSString *)filePath;
- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString;
- (void)unarchiveEvents;
+ (nonnull id)unarchiveOrDefaultFromFile:(NSString *)filePath asClass:(Class)class;
+ (id)unarchiveFromFile:(NSString *)filePath asClass:(Class)class;
- (BOOL)shouldFlushEvents;
- (BOOL)isAppIdAvailable;
- (void)updateNextFlushTime;
- (void)setBatchSize:(NSNumber*)size;
- (NSMutableDictionary*) getCommonParams;
- (void)addClientEventTime:(NSDictionary *)biCommonParams;
- (NSData*)getJSONDataForBatch:(NSArray *)batch;
@end

@implementation BlitzBiEventSendHandler

static NSInteger maxPendingCount = 20;
static NSInteger forceSendAfterSeconds = 15;
static NSString *const EVENTS_FILE_PATH = @"blitzbi-events.plist";

- (instancetype)init:(NSNumber*)batchSize
                    :(NSString*)baseUrl
                    :(BlitzBiEventRepository*)eventRepository
                    :(BOOL)adTracking {
    self = [super init];
    if (self) {
        [self setBatchSize:batchSize];
        
        self->eventRepository = eventRepository;
        self->biConfig = [[BlitzBiConfig alloc] initWithBaseUrl:baseUrl];
        self->blitzSessionId = [BlitzDeviceUtils getSessionId];
        self->isBlockSubmittedToNetworkQueue = NO;
        self->sessionStartTimeStamp = [self getCurrentEpochTime];
        self->sessionPauseTimeStamp = 0;
        self->adTracking = adTracking;
        
        self->functionQueue = dispatch_queue_create([@"bi_functions_sender_serial" UTF8String], DISPATCH_QUEUE_SERIAL);
        self->serialQueue = dispatch_queue_create([@"bi_events_sender_serial" UTF8String], DISPATCH_QUEUE_SERIAL);
        
        self->networkQueue = dispatch_queue_create([@"bi_events_sender_network" UTF8String], DISPATCH_QUEUE_SERIAL);
        self->isAppIdValidated = NO;
        
        self->pendingEvents = [NSMutableArray new];
        self->nextFlushTime = [[NSDate dateWithTimeIntervalSinceNow:forceSendAfterSeconds] timeIntervalSince1970];
        
        [self unarchiveEvents];
        [self addNotification];
    }
    return self;
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPause)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onResume)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPause)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
}



- (void)onPause {
    dispatch_async(self->functionQueue, ^{
        [BlitzLogger logMessage:@"[BlitzBi] On Pause"];
        self->sessionPauseTimeStamp = [self getCurrentEpochTime];
        [self fireSessionLengthEvent];
        [self fireSessionPauseEvent];
        [self flushWithIsForced:YES];
        [[BlitzBiService sharedService] disconnectBlitzTime];
    });
   
}

- (void)onResume {
    dispatch_async(self->functionQueue, ^{
        [BlitzLogger logMessage:@"[BlitzBi] On Resume"];
        self->sessionStartTimeStamp = [self getCurrentEpochTime];
        
        NSString *receipt = [BlitzDeviceUtils getBlitzAppReceipt];
        if (receipt) {
            NSTimer *purchaseTimer = [NSTimer timerWithTimeInterval:30 target:self selector:@selector(savePurchase) userInfo:nil repeats:NO];
            [[NSRunLoop mainRunLoop] addTimer:purchaseTimer forMode:NSRunLoopCommonModes];
        }
        
        NSInteger timeoutInSeconds = [[[BlitzBiService sharedService] getParamForKey:@"sessionTimeoutInSeconds" withDefaultValue:@"240"] intValue];
        if (self->sessionPauseTimeStamp != 0 && (self->sessionStartTimeStamp - self->sessionPauseTimeStamp) > timeoutInSeconds) {
            [self onSessionTimedOut];
        }
        [self fireSessionStartEvent];
        [self startRepeatedTimerToAttemptFlush];
    });
}


- (void)savePurchase {
    dispatch_async(self->functionQueue, ^{
        [[BlitzBiService sharedService] savePurchase:@"ALL_PRODUCT_ID"];
    });
}

- (void)onAppCrash {
    [self onDestroy];
}

- (void)onDestroy {
    [BlitzLogger logMessage:@"[BlitzBi] On Destroy"];
    [self fireAppCrashEvent];
    [self fireSessionLengthEvent];
    [self fireSessionPauseEvent];
    [self flushWithIsForced:YES];
}

- (long long)getCurrentEpochTime{
    return (long long)[[NSDate date] timeIntervalSince1970];
}

- (void)fireSessionLengthEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"blitz_session_length" forKey:@"eventName"];
    NSString *sessionLengthStr = [NSString stringWithFormat:@"%lld", [self getCurrentEpochTime] - self->sessionStartTimeStamp];
    [eventDict setValue:sessionLengthStr forKey:@"session_length"];
    [self sendEvent:eventDict];
}

- (void)fireSessionStartEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"blitz_session_start" forKey:@"eventName"];
    [self sendEvent:eventDict];
}

- (void)fireAppCrashEvent {
    @try {
        NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
        [eventDict setValue:@"blitz_app_crash" forKey:@"eventName"];
        [self addClientEventTime:eventDict];
        [self->pendingEvents addObject:eventDict];
        [self archiveEvents];
    } @catch (NSException *exception) {
        [BlitzLogger logMessage:@"[BlitzBi] Error in fireAppCrashEvent."];
        
    }
}

- (void)fireSessionPauseEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"blitz_session_pause" forKey:@"eventName"];
    [self sendEvent:eventDict];
}

- (void)startRepeatedTimerToAttemptFlush {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self->biEventFireTimer invalidate];
        
        self->biEventFireTimer = [NSTimer timerWithTimeInterval:forceSendAfterSeconds target:self selector:@selector(timerTicked) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self->biEventFireTimer forMode:NSRunLoopCommonModes];
    });
}

- (void)invalidateTimer {
    if (biEventFireTimer) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self->biEventFireTimer invalidate];
        });
    }
}


- (void)onSessionTimedOut {
    [BlitzLogger logMessage:@"[BlitzBi] Session timeout out. Setting new value for session Id."];
    self->blitzSessionId = [BlitzDeviceUtils getSessionId];
}

- (void)timerTicked {
    [BlitzLogger logMessage:@"[BlitzBi] Timer Ticked"];
    [self flushWithIsForced:YES];
}

- (void)setBlitzdeviceId :(NSString*)appId
                         :(NSString*)deviceId {
    self->blitzAppId = appId;
    self->blitzDeviceId = deviceId;
    self->isAppIdValidated = YES;
}

- (void)sendEvent:(NSDictionary *)eventDict {
    [self sendEvent:eventDict withForcedFlush:NO];
}

- (void)sendEvent:(NSDictionary *)eventDict withForcedFlush:(BOOL)isForced {
    [self sendEvents:@[eventDict] withForcedFlush:isForced];
}

- (void)sendEvents:(NSArray *)events {
    [self sendEvents:events withForcedFlush:NO];
}

- (void)sendEvents:(NSArray *)events withForcedFlush:(BOOL)isForced  {
    NSMutableArray *eventsCopy = [NSMutableArray new];
    for (NSDictionary *event in events) {
        NSString *eventName = [event objectForKey:BLITZ_EVENT_NAME_TAG];
        if (eventName && eventName.length > 0) {
            [eventsCopy addObject:[event mutableCopy]];
        }
    }
    
    dispatch_async(self->serialQueue, ^{
        @synchronized (self) {
            for (NSDictionary *event in eventsCopy) {
                [self addClientEventTime:event];
            }
            [self->pendingEvents addObjectsFromArray:eventsCopy];
        }
        [self archiveEvents];
        BOOL shouldFlush = [self shouldFlushEvents] || isForced;
        if (shouldFlush) {
            if (!self->isBlockSubmittedToNetworkQueue) {
                self->isBlockSubmittedToNetworkQueue = YES;
                dispatch_async(self->networkQueue, [self checkAndFlushAndArchiveBlock:isForced]);
            }
        }
    });
}

- (void (^)(void))checkAndFlushAndArchiveBlock:(BOOL)isForced {
    return ^{
        BOOL shouldArchive = [self checkAndFlushWithIsForced:isForced];
        if (shouldArchive) {
            [self archiveEvents];
        }
    };
}

- (void)flushWithIsForced:(BOOL)isForced  {
    dispatch_async(self->serialQueue, ^{
        BOOL shouldFlush = [self shouldFlushEvents] || isForced;
        if (shouldFlush) {
            if (!self->isBlockSubmittedToNetworkQueue) {
                self->isBlockSubmittedToNetworkQueue = YES;
                dispatch_async(self->networkQueue, [self checkAndFlushAndArchiveBlock: isForced]);
            }
        }
    });
}

- (BOOL)checkAndFlushWithIsForced:(BOOL)isForced {
    @try {
        if (![self isAppIdAvailable]) {
            return NO;
        }
        BOOL shouldFlush = [self shouldFlushEvents];
        if (!isForced && !shouldFlush) {
            return NO;
        }
        
        [self updateNextFlushTime];
        NSMutableArray *eventsCopy;
        
        @synchronized (self) {
            eventsCopy = [self->pendingEvents mutableCopy];
        }
        
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Sending all the events with count %lu with blocking response tracking", (unsigned long)eventsCopy.count]];
        while (eventsCopy.count > 0) {
            NSUInteger batchSize = MIN(eventsCopy.count, maxPendingCount);
            NSArray *batch = [eventsCopy subarrayWithRange:NSMakeRange(0, batchSize)];
            
            __block BOOL didFail = NO;
            
            if ([NSJSONSerialization isValidJSONObject:batch]) {
                NSData *jsonData = [self getJSONDataForBatch:batch];
                NSString *url = [biConfig base_URL];;
                
                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                
                [eventRepository processJsonRequest:url :jsonData :^(__attribute__((unused)) NSObject *response, NSError *err) {
                    if(err) {
                        didFail = YES;
                        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error in getting response from server for jsondata %@ with error %@", jsonData, err]];
                    }
                    dispatch_semaphore_signal(semaphore);
                }];
                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
                
                if (didFail) {
                    break;
                }
                
                [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] The batch containing %lu events sent successfully, going to remove it from pending events", (unsigned long)batch.count]];
                [eventsCopy removeObjectsInArray:batch];
                @synchronized (self) {
                    [self->pendingEvents removeObjectsInArray:batch];
                }
            }
            else {
                //remove the defective events from our pending events
                [self removeDefectiveEvents];
                break;
            }
        }
    }
    @finally {
        self->isBlockSubmittedToNetworkQueue = NO;
    }
    return YES;
}

- (BOOL)handleNetworkResponse:(NSObject *)response withError:(NSError *)error {
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *respDict = (NSDictionary *)response;
        if ([[respDict objectForKey:@"status"] isEqualToString:@"SUCCESS"]) {
            return YES;
        }
    }
    return NO;
}

- (void)archiveEvents {
    @synchronized (self) {
        NSString *filePath = [self eventsFilePath];
        if (![self archiveObject:self->pendingEvents withFilePath:filePath]) {
            [BlitzLogger logMessage:@"[BlitzBi] Could not archive pending events"];
        }
    }
}

- (NSString *)eventsFilePath {
    return [BlitzFileHelper fullFilePathInDocumentsDirectoryForFileName:EVENTS_FILE_PATH];
}

- (void)removeDefectiveEvents {
    NSArray *eventsCopy;
    @synchronized (self) {
        eventsCopy = [self->pendingEvents copy];
    }
    
    NSMutableArray *defectiveEvents = [NSMutableArray new];
    for (NSDictionary *event in eventsCopy) {
        if (![NSJSONSerialization isValidJSONObject:event]) {
            [defectiveEvents addObject:event];
        }
    }
    
    @synchronized (self) {
        [self->pendingEvents removeObjectsInArray:defectiveEvents];
    }
    
    [self flushWithIsForced:YES];
}

- (BOOL)archiveObject:(id)object withFilePath:(NSString *)filePath {
    @try {
        if (![NSKeyedArchiver archiveRootObject:object toFile:filePath]) {
            return NO;
        }
    } @catch (NSException* exception) {
        return NO;
    }
    
    [self addSkipBackupAttributeToItemAtPath:filePath];
    return YES;
}

- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString {
    NSURL *url = [NSURL fileURLWithPath:filePathString];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[url path]];
    NSError *error = nil;
    if (fileExists) {
        BOOL success = [url setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey error:&error];
        if (!success) {
            [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error in excluding %@ from backup %@", [url lastPathComponent], error]];
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
            [userInfo setObject:[url lastPathComponent] forKey:FILE_NAME];
        }
        return success;
    }
    return NO;
}

- (void)unarchiveEvents {
    self->pendingEvents = (NSMutableArray *)[BlitzBiEventSendHandler unarchiveOrDefaultFromFile:[self eventsFilePath] asClass:[NSMutableArray class]];
    NSMutableArray *newPendingEvents = [[NSMutableArray alloc] init];
    for (NSDictionary *event in self->pendingEvents) {
        NSMutableDictionary *eventDict = [event mutableCopy];
        [eventDict setValue:@"1" forKey:COMMON_FIELD_3];
        [newPendingEvents addObject:eventDict];
    }
    self->pendingEvents = newPendingEvents;
}

+ (nonnull id)unarchiveOrDefaultFromFile:(NSString *)filePath asClass:(Class)class {
    return [self unarchiveFromFile:filePath asClass:class] ?: [class new];
}

+ (id)unarchiveFromFile:(NSString *)filePath asClass:(Class)class {
    id unarchivedData = nil;
    @try {
        unarchivedData = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        if (![unarchivedData isKindOfClass:class]) {
            unarchivedData = nil;
        }
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Unarchived data from %@: %@", filePath, unarchivedData]];
    }
    @catch (NSException *exception) {
        unarchivedData = nil;
        
        NSError *error;
        BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (!removed) {
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
            [userInfo setObject:filePath forKey:FILE_NAME];
        }
    }
    return unarchivedData;
}

- (BOOL)shouldFlushEvents {
    NSUInteger pendingEventsCount = 0;
    @synchronized (self) {
        pendingEventsCount =[self->pendingEvents count];
    }
    BOOL isPendingEventsCrossedMaxLimit = pendingEventsCount >= maxPendingCount;
    BOOL hasTimeCrossedCooldown = [[NSDate date] timeIntervalSince1970]  > nextFlushTime;
    return isPendingEventsCrossedMaxLimit || hasTimeCrossedCooldown;
}

- (BOOL)isAppIdAvailable {
    return isAppIdValidated && blitzDeviceId;
}

- (void)updateNextFlushTime {
    self->nextFlushTime = [[NSDate dateWithTimeIntervalSinceNow:forceSendAfterSeconds] timeIntervalSince1970];
}

- (void)setBatchSize:(NSNumber*)size {
    maxPendingCount = [size longValue];
}

- (NSMutableDictionary*) getCommonParams {
    NSMutableDictionary *biCommonParams = [[NSMutableDictionary alloc] init];
    [biCommonParams setValue:blitzDeviceId  forKey:@"blitzDeviceId"];
    [biCommonParams setValue:[BlitzDeviceUtils getPlatformCode] forKey:@"platformCode"];
    [biCommonParams setValue:blitzSessionId forKey:@"blitzSessionId"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppVersion] forKey:@"appVersion"];
    [biCommonParams setValue:[BlitzDeviceUtils getTimeZone] forKey:@"timeZone"];
    [biCommonParams setValue:[BlitzDeviceUtils getOSId] forKey:@"osId"];
    [biCommonParams setValue:[BlitzDeviceUtils getConnDetails] forKey:@"connDetails"];
    [biCommonParams setValue:[BlitzDeviceUtils getManufacturer] forKey:@"manufacturer"];
    [biCommonParams setValue:[BlitzDeviceUtils getDeviceModel] forKey:@"deviceModel"];
    [biCommonParams setValue:[BlitzDeviceUtils getCarrierName] forKey:@"carrierName"];
    [biCommonParams setValue:[BlitzDeviceUtils getAdTrackingEnabled] forKey:@"adTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppTrackingEnabled] forKey:@"appTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getUserAgent] forKey:@"userAgent"];
    [biCommonParams addEntriesFromDictionary:[BlitzDeviceUtils getBlitzCommonParams]];
    
    NSString *blitzUserId = [BlitzDeviceUtils getBlitzUserId];
    if (blitzUserId) {
        [biCommonParams setValue:blitzUserId forKey:@"blitzUserId"];
    } else {
        [biCommonParams setValue:@"" forKey:@"blitzUserId"];
    }
    
    if (adTracking)
        [biCommonParams setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
    [biCommonParams setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
    return biCommonParams;
}

- (void)addClientEventTime:(NSDictionary *)event{
    NSString *isBlitzTime = [[BlitzBiService sharedService] getParamForKey:@"isBlitzTime" withDefaultValue:@"YES"];
    if (isBlitzTime && [isBlitzTime boolValue]) {
        long currentTime = [[BlitzBiService sharedService] getCurrentTimeInternal];
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi][Time] Client event time is %ld", currentTime]];
        [event setValue:[NSNumber numberWithLong:currentTime] forKey:@"client_event_time"];
    }
}

- (NSData *)getJSONDataForBatch:(NSArray *)batch {
    NSError *error;
    NSMutableDictionary *biDictionary = [[NSMutableDictionary alloc] init];
    [biDictionary setObject:batch forKey:@"events"];
    [biDictionary setObject:[self getCommonParams] forKey:@"commonParams"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:biDictionary options:0 error:&error];
    
    if (jsonData == nil || error) {
        [BlitzLogger logMessage:[NSString stringWithFormat:@"[BlitzBi] Error in getting json data for batch %@ with error %@", batch, error]];
    }
    return jsonData;
}
@end
