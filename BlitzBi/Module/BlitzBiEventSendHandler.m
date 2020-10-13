//
//  BlitzBiEventSendHandler.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//
#import "BlitzBiEventSendHandler.h"
#import "BlitzBiConfig.h"
#import "BlitzFileHelper.h"
#import "BlitzDeviceUtils.h"

#define COMMON_FIELD_3 @"common_field_3"
#define FILE_NAME @"filename"

@interface BlitzBiEventSendHandler()

@property (nonatomic) dispatch_queue_t serialQueue;
@property (nonatomic) dispatch_queue_t networkQueue;
@property (nonatomic) NSMutableArray<NSDictionary *> *pendingEvents;
@property (nonatomic) NSTimer *biEventFireTimer;

@property NSTimeInterval nextFlushTime;

@property BOOL isBlockSubmittedToNetworkQueue;
@property BOOL isAppIdValidated;

@property NSString *blitzDeviceId;
@property NSString *blitzAppId;
@property NSString *blitzSessionId;

@property BlitzBiConfig *biConfig;
@property BlitzBIEventRepository *eventRepository;

@property long long currentTimestamp;

@end

@implementation BlitzBiEventSendHandler

#define FLUSH_AFTER_APP_PARAM_KEY @"bi_flush_after_secs"
#define MAX_BATCH_SIZE_APP_PARAM_KEY @"bi_max_batch_size"

static NSInteger maxPendingCount = 200;
static NSInteger forceSendAfterSeconds = 30;
static NSString *const EVENTS_FILE_PATH = @"blitzbi-events.plist";

- (instancetype)init:(NSNumber*) batchSize withBaseUrl:(NSString*) baseUrl withEventRepository:(BlitzBIEventRepository*)eventRepository {
    self = [super init];
    if (self) {
        self.eventRepository = eventRepository;
        
        [self setBatchSize:batchSize];
        self.biConfig = [[BlitzBiConfig alloc] initWithUrl:baseUrl];
        self.blitzSessionId = [BlitzDeviceUtils getSessionId];
        self.isBlockSubmittedToNetworkQueue = NO;
        self.currentTimestamp = 0;
        
        self.serialQueue = dispatch_queue_create([@"bi_events_sender_serial" UTF8String], DISPATCH_QUEUE_SERIAL);
        
        self.networkQueue = dispatch_queue_create([@"bi_events_sender_network" UTF8String], DISPATCH_QUEUE_SERIAL);
        self.isAppIdValidated = NO;
        
        self.pendingEvents = [NSMutableArray new];
        self.nextFlushTime = [[NSDate dateWithTimeIntervalSinceNow:forceSendAfterSeconds] timeIntervalSince1970];

        [self unarchiveEvents];
        [self addNotification];
    }
    return self;
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPause)
name:NSExtensionHostDidEnterBackgroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onResume)
name:NSExtensionHostWillEnterForegroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onDestroy)
                                                 name:NSExtensionHostWillResignActiveNotification
                                               object:nil];
}

-(void) onPause {
    NSLog(@"BlitzBiEventSendHandler::onPause");
    [self fireSessionLengthEvent];
    [self fireSessionPauseEvent];
    [self startRepeatedTimerToAttemptFlush];
}

-(void) onResume {
    NSLog(@"BlitzBiEventSendHandler::onResume");
    self.currentTimestamp = [self getCurrentEpochTime];
    [self fireSessionStartEvent];
    [self invalidateTimer];
}

-(void) onDestroy {
    NSLog(@"BlitzBiEventSendHandler::onDestroy");
    [self flushEmergency];
    [self fireSessionLengthEvent];
    [self fireSessionPauseEvent];
}

-(long long) getCurrentEpochTime{
    return (long long)[[NSDate date] timeIntervalSince1970];
}

// TODO: @kash
-(void) fireSessionLengthEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"session_length" forKey:@"eventName"];
    //[eventDict setValue:([self getCurrentEpochTime] - _currentTimestamp) forKey:@"session_length"];
    [self sendEvent:eventDict];
}

-(void) fireSessionStartEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"session_start" forKey:@"eventName"];
    [self sendEvent:eventDict];
}

-(void) fireSessionPauseEvent {
    NSMutableDictionary *eventDict = [[NSMutableDictionary alloc] init];
    [eventDict setValue:@"session_pause" forKey:@"eventName"];
    [self sendEvent:eventDict];
}

- (void)startRepeatedTimerToAttemptFlush {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.biEventFireTimer invalidate];
        self.biEventFireTimer = [NSTimer scheduledTimerWithTimeInterval:forceSendAfterSeconds target:self selector:@selector(timerTicked) userInfo:nil repeats:YES];
    });
}

- (void)invalidateTimer {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.biEventFireTimer invalidate];
    });
}

- (void)timerTicked {
    NSLog(@"[BI] timer ticked");
    [self flush];
}

- (void)setBlitzdeviceId:(NSNumber*)appId withDeviceId: (NSString*) deviceId {
    self.blitzAppId = [appId stringValue];
    self.blitzDeviceId = deviceId;
}

- (void)flushEmergency {
    NSLog(@"[BI] flushing all the events immediately without any response tracking");
    NSMutableArray *eventsCopy;
    @synchronized (self) {
        eventsCopy = [self.pendingEvents mutableCopy];
    }
    while (eventsCopy.count > 0) {
        NSUInteger batchSize = MIN(eventsCopy.count, maxPendingCount);
        NSArray *batch = [eventsCopy subarrayWithRange:NSMakeRange(0, batchSize)];
        
        NSData *jsonData = [self getJSONDataForBatch:batch];
        NSString *url = [_biConfig base_URL];
                    
        [self.eventRepository processJsonRequestWithoutResponse:url withData:jsonData withIsEmergency:YES];
        [eventsCopy removeObjectsInArray:batch];
    }
}

- (void)sendEvent:(NSDictionary *)eventDict {
    [self sendEvents:@[eventDict]];
}

- (void)sendEvents:(NSArray *)events {
    NSMutableArray *eventsCopy = [NSMutableArray new];
    for (NSDictionary *event in events) {
        NSString *eventName = [event objectForKey:BLITZ_EVENT_NAME_TAG];
        if (eventName != nil && eventName.length > 0) {
            [eventsCopy addObject:[event copy]];
        }
    }
    
    dispatch_async(self.serialQueue, ^{
        @synchronized (self) {
            [self.pendingEvents addObjectsFromArray:eventsCopy];
        }
        [self archiveEvents];
        BOOL shouldFlush = [self shouldFlushEvents] && [self isAppIdAvailable];
        if (shouldFlush) {
            if (!self.isBlockSubmittedToNetworkQueue) {
                self.isBlockSubmittedToNetworkQueue = YES;
                dispatch_async(self.networkQueue, [self checkAndFlushAndArchiveBlock]);
            }
        }
    });
}

- (void (^)(void))checkAndFlushAndArchiveBlock{
    return ^{
        BOOL shouldArchive = [self checkAndFlush];
        if (shouldArchive) {
            [self archiveEvents];
        }
    };
}

- (void)flush {
    dispatch_async(self.serialQueue, ^{
        BOOL shouldFlush = [self shouldFlushEvents] && [self isAppIdAvailable];
        if (shouldFlush) {
            if (!self.isBlockSubmittedToNetworkQueue) {
                self.isBlockSubmittedToNetworkQueue = YES;
                dispatch_async(self.networkQueue, [self checkAndFlushAndArchiveBlock]);
            }
        }
    });
}

- (BOOL)checkAndFlush {
    @try {
        if (![self shouldFlushEvents] && [self isAppIdAvailable]) {
            return NO;
        }
        
        [self updateNextFlushTime];
        NSMutableArray *eventsCopy;
        
        @synchronized (self) {
            eventsCopy = [self.pendingEvents mutableCopy];
        }
        NSLog(@"[BI] sending all the events with count %lu with blocking response tracking", eventsCopy.count);
        while (eventsCopy.count > 0) {
            NSUInteger batchSize = MIN(eventsCopy.count, maxPendingCount);
            NSArray *batch = [eventsCopy subarrayWithRange:NSMakeRange(0, batchSize)];
            
            __block BOOL didFail = NO;
            
            if ([NSJSONSerialization isValidJSONObject:batch]) {
                NSData *jsonData = [self getJSONDataForBatch:batch];
                NSString *url = [_biConfig base_URL];;
                
                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

                [_eventRepository processJsonRequest:url withData:jsonData withCompletion:^(NSObject *response, NSError *err) {
                    if(err != nil) {
                        didFail = true;
                        //Send error to crashlytics
                        NSLog(@"Error in getting response from server for jsondata %@ with error %@", jsonData, err);
                    }
                    dispatch_semaphore_signal(semaphore);
                }];
                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
                
                if (didFail) {
                    break;
                }
                
                NSLog(@"[BI] the batch containing %lu events sent successfully, going to remove it from pending events", batch.count);
                [eventsCopy removeObjectsInArray:batch];
                @synchronized (self) {
                    [self.pendingEvents removeObjectsInArray:batch];
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
        self.isBlockSubmittedToNetworkQueue = NO;
    }
    return YES;
}

- (BOOL)handleNetworkResponse:(NSObject *)response withError:(NSError *)error {
    //No need to retry in case of failure as bi events are sent every minute forcefully
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
        if (![self archiveObject:self.pendingEvents withFilePath:filePath]) {
            NSLog(@"[BI] could not archive pending events");
        }
    }
}

- (NSString *)eventsFilePath {
    return [BlitzFileHelper fullFilePathInDocumentsDirectoryForFileName:EVENTS_FILE_PATH];
}

- (void)removeDefectiveEvents {
    NSArray *eventsCopy;
    @synchronized (self) {
        eventsCopy = [self.pendingEvents copy];
    }
    
    NSMutableArray *defectiveEvents = [NSMutableArray new];
    for (NSDictionary *event in eventsCopy) {
        if (![NSJSONSerialization isValidJSONObject:event]) {
            [defectiveEvents addObject:event];
        }
    }
    
    @synchronized (self) {
        [self.pendingEvents removeObjectsInArray:defectiveEvents];
    }
    
    //Recording crashlytics error
    NSArray<NSString *> *defectiveEventsNames = [defectiveEvents valueForKeyPath:BLITZ_EVENT_NAME_TAG];
    NSString *commaSeparatedNames = [defectiveEventsNames componentsJoinedByString:@", "];
    NSLog(@"[BI] defective events with names: %@, and total defective count: %lu, removed from pending events.", commaSeparatedNames, defectiveEvents.count);
    
    //as now defective events has been filetered, we can force flush.
    [self flush];
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
            NSLog(@"[BI] Error in excluding %@ from backup %@", [url lastPathComponent], error);
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
            [userInfo setObject:[url lastPathComponent] forKey:FILE_NAME];
        }
        return success;
    }
    return NO;
}

- (void)unarchiveEvents {
    self.pendingEvents = (NSMutableArray *)[BlitzBiEventSendHandler unarchiveOrDefaultFromFile:[self eventsFilePath] asClass:[NSMutableArray class]];
    NSMutableArray *newPendingEvents = [[NSMutableArray alloc] init];
    for (NSDictionary *event in self.pendingEvents) {
        NSMutableDictionary *eventDict = [event mutableCopy];
        [eventDict setValue:@"1" forKey:COMMON_FIELD_3];
        [newPendingEvents addObject:eventDict];
    }
    self.pendingEvents = newPendingEvents;
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
        NSLog(@"[BI] unarchived data from %@: %@", filePath, unarchivedData);
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

- (void)dispatchOnNetworkQueue:(void (^)(void))dispatchBlock {
    /* The reason behind this logic is that we want to make sure
     * that flush happens after the event has been added to the pending events list
     * event comes -> event added to pending list -> list is flushed */
    dispatch_async(self.serialQueue, ^{
        dispatch_async(self.networkQueue, dispatchBlock);
    });
}

- (BOOL)shouldFlushEvents {
    NSUInteger pendingEventsCount = 0;
    @synchronized (self) {
        pendingEventsCount = [self.pendingEvents count];
    }
    BOOL isPendingEventsCrossedMaxLimit = pendingEventsCount >= maxPendingCount;
    BOOL hasTimeCrossedCooldown = [[NSDate date] timeIntervalSince1970] > self.nextFlushTime;
    return isPendingEventsCrossedMaxLimit || hasTimeCrossedCooldown;
}

- (BOOL)isAppIdAvailable {
    return [self isAppIdValidated] && [self blitzDeviceId] != nil;
}

- (void)setBlitzdeviceId :(NSNumber*)appId
                         :(NSString*)deviceId {
    self.blitzAppId = [appId stringValue];
    self.blitzDeviceId = deviceId;
    self.isAppIdValidated = true;
}

- (void)updateNextFlushTime {
    NSDate *nextDate = [NSDate dateWithTimeIntervalSinceNow:forceSendAfterSeconds];
    self.nextFlushTime = [nextDate timeIntervalSince1970];
}

- (void)setBatchSize:(NSNumber*)size {
    maxPendingCount = [size longValue];
}

-(NSMutableDictionary*) getCommonParams {
    NSMutableDictionary *biCommonParams = [[NSMutableDictionary alloc] init];
    [biCommonParams setValue:[self blitzAppId] forKey:@"blitzAppId"];
    [biCommonParams setValue:[self blitzDeviceId]  forKey:@"blitzDeviceId"];
    [biCommonParams setValue:[BlitzDeviceUtils getPlatformCode] forKey:@"platformCode"];
    [biCommonParams setValue:[self blitzSessionId] forKey:@"blitzSessionId"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppVersion] forKey:@"appVersion"];
    [biCommonParams setValue:[BlitzDeviceUtils getTimeZone] forKey:@"timezone"];
    [biCommonParams setValue:[BlitzDeviceUtils getIDFA] forKey:@"ifa"];
    [biCommonParams setValue:[BlitzDeviceUtils getIFV] forKey:@"ifv"];
    [biCommonParams setValue:[BlitzDeviceUtils getOSId] forKey:@"osId"];
    [biCommonParams setValue:[BlitzDeviceUtils getConnDetails] forKey:@"connDetails"];
    [biCommonParams setValue:[BlitzDeviceUtils getManufacturer] forKey:@"manufacturer"];
    [biCommonParams setValue:[BlitzDeviceUtils getDeviceModel] forKey:@"deviceModel"];
    [biCommonParams setValue:[BlitzDeviceUtils getCarrierName] forKey:@"carrierName"];
    [biCommonParams setValue:[BlitzDeviceUtils getAdTrackingEnabled] forKey:@"adTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppTrackingEnabled] forKey:@"appTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getUserAgent] forKey:@"userAgent"];
    return biCommonParams;
}

- (NSData *)getJSONDataForBatch:(NSArray *)batch {
    NSError *error;
    NSMutableDictionary *biDictionary = [[NSMutableDictionary alloc] init];
    [biDictionary setObject:batch forKey:@"events"];
    [biDictionary setObject:[self getCommonParams] forKey:@"commonParams"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:biDictionary options:0 error:&error];

    if (jsonData == nil || error) {
        NSLog(@"Error in getting json data for batch %@ with error %@", batch, error);
    }
    return jsonData;
}
@end
