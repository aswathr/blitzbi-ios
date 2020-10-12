//
//  BlitzBiEventSendHandler.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//
#import "BlitzBiEventSendHandler.h"
#import "BlitzBiConfig.h"
#import "BlitzFileHelper.h"

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
@property id <IBlitzBIEventRepository> eventRepository;

@property CLongLong *currentTimestamp;

@end

@implementation BlitzBiEventSendHandler

#define FLUSH_AFTER_APP_PARAM_KEY @"bi_flush_after_secs"
#define MAX_BATCH_SIZE_APP_PARAM_KEY @"bi_max_batch_size"

static NSInteger maxPendingCount = 200;
static NSInteger forceSendAfterSeconds = 30;
static NSString *const EVENTS_FILE_PATH = @"blitzbi-events.plist";

- (instancetype)init:(int*) batchSize withBaseUrl:(NSString*) baseUrl withEventRepository:(id <IBlitzBIEventRepository>)eventRepository {
    self = [super init];
    if (self) {
        self.eventRepository = eventRepository;
        
        [self setBatchSize:batchSize];
        self.biConfig = [BlitzBiConfig new];
        
        self.biConfig.base_URL = baseUrl
        self.blitzSessionId = [BlitzDeviceUtils getSessionId]
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
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
}

+(void) onPause {
    print("BlitzBiEventSendHandler::onPause")
    [self fireSessionLengthEvent];
    [self fireSessionPauseEvent];
    [self startRepeatedTimerToAttemptFlush];
}

+(void) onResume {
    print("BlitzBiEventSendHandler::onResume")
    self.currentTimestamp = [self getCurrentEpochTime];
    [self fireSessionStartEvent];
    [self invalidateTimer];
}

+(void) onDestroy {
    NSLog(@"BlitzBiEventSendHandler::onDestroy");
    [self flushEmergency];
    [self fireSessionLengthEvent];
    [self fireSessionPauseEvent];
}

+(CLongLong) getCurrentEpochTime{
    return [CLongLong init: [[NSDate date] timeIntervalSince1970]];
}

+(void) fireSessionLengthEvent {
    var event: [String : Any] = [String : Any]()
    event["eventName"] = "session_length"
    event["session_length"] = getCurrentEpochTime() - currentTimestamp;
    sendEvent(event)
}

+(void) fireSessionStartEvent {
    var event: [String : Any] = [String : Any]()
    event["eventName"] = "session_start"
    sendEvent(event)
}

+(void) fireSessionPauseEvent {
    var event: [String : Any] = [String : Any]()
    event["eventName"] = "session_pause"
    sendEvent(event)
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
    [self flush:YES];
}

- (void)flushEmergency {
    NSLog(@"[BI] flushing all the events immediately without any response tracking");
    if (eventDict != nil) {
        eventDict = [eventDict copy];
    }
    NSMutableArray *eventsCopy;
    @synchronized (self) {
        if (eventDict != nil) {
            [self.pendingEvents addObject:eventDict];
        }
        eventsCopy = [self.pendingEvents mutableCopy];
    }
    while (eventsCopy.count > 0) {
        NSUInteger batchSize = MIN(eventsCopy.count, maxPendingCount);
        NSArray *batch = [eventsCopy subarrayWithRange:NSMakeRange(0, batchSize)];
        
        NSData *jsonData = [self getJSONDataForBatch:batch];
        NSString *url = [[BiEventManager biEventManager] getEventsUrl];
                    
        [eventRepository processJsonRequestWithoutResponse:url body:jsonData isEmergency:true]
        [eventsCopy removeObjectsInArray:batch];
    }
}

- (void)sendEvent:(NSDictionary *)eventDict {
    [self sendEvents:@[eventDict]];
}

- (void)sendEvents:(NSArray *)events {
    NSMutableArray *eventsCopy = [NSMutableArray new];
    for (NSDictionary *event in events) {
        NSString *eventName = [event objectForKey:EVENT_NAME_TAG];
        if (eventName == nil || eventName.length == 0) {
            if (config.isDebugEnabled) {
                NSAssert(NO, @"Event name is absent.");
            }
        }
        else {
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
        BOOL shouldArchive = [self checkAndFlushWithIsForced];
        if (shouldArchive) {
            [self archiveEvents];
        }
    };
}

- (void)flushWithIsForced {
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

- (BOOL)checkAndFlushWithIsForced:(BOOL)isForced {
    @try {
        if (![self shouldFlushEvents]; && [self isAppIdAvailable]) {
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
                NSString *url = [[BiEventManager biEventManager] getEventsUrl];
                
                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                
                [eventRepository processJsonRequest:url withPostData:jsonData requestType:BI_REQUEST withCompletionHandler:^(NSObject *response, NSError *err) {
                    if err != nil {
                        didFail = true
                        //Send error to crashlytics
                        NSLog(@"Error in getting response from server for jsondata %@ with error %@", jsonData, err);
                        BlitzBiEventSendHandler.sendCrashlyticsError(withCode: BI_SERVER_ERROR_CODE, withDescription: BI_SERVER_ERROR, withUserInfo: (err as NSError?)?.userInfo)
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
                
                if (config.isDebugEnabled) {
                    NSAssert(NO, @"JSON object for server call is not valid.");
                }
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
    return [FileHelper fullFilePathInDocumentsDirectoryForFileName:EVENTS_FILE_PATH];
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
    NSArray<NSString *> *defectiveEventsNames = [defectiveEvents valueForKeyPath:EVENT_NAME_TAG];
    NSString *commaSeparatedNames = [defectiveEventsNames componentsJoinedByString:@", "];
    NSLog(@"[BI] defective events with names: %@, and total defective count: %lu, removed from pending events.", commaSeparatedNames, defectiveEvents.count);
    [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_JSON_DATA_ERROR_CODE
                       withDescription:BI_JSON_DATA_ERROR
                          withUserInfo:@{
                                         BAD_EVENTS_NAMES:commaSeparatedNames,
                                         BAD_EVENTS_COUNT:[NSString stringWithFormat:@"%lu", defectiveEvents.count]
                                         }];
    
    //as now defective events has been filetered, we can force flush.
    [self flushWithIsForced:YES];
}

- (BOOL)archiveObject:(id)object withFilePath:(NSString *)filePath {
    @try {
        if (![NSKeyedArchiver archiveRootObject:object toFile:filePath]) {
            [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_ARCHIVE_DATA_FAILURE_CODE withDescription:BI_ARCHIVE_DATA_FAILURE withUserInfo:nil];
            return NO;
        }
    } @catch (NSException* exception) {
        [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_ARCHIVE_DATA_EXCEPTION_CODE
                           withDescription:BI_ARCHIVE_DATA_EXCEPTION
                              withUserInfo:@{
                                             EXCEPTION_NAME:exception.name,
                                             EXCEPTION_REASON:exception.reason
                                             }];
        return NO;
    }
    
    [self addSkipBackupAttributeToItemAtPath:filePath];
    return YES;
}

- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString {
    NSURL *url = [NSURL fileURLWithPath:filePathString];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[url path]];
    if (config.isDebugEnabled) {
        NSAssert(fileExists, @"events file does not exist at filepath");
    }
    NSError *error = nil;
    if (fileExists) {
        BOOL success = [url setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey error:&error];
        if (!success) {
            NSLog(@"[BI] Error in excluding %@ from backup %@", [url lastPathComponent], error);
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
            [userInfo setObject:[url lastPathComponent] forKey:FILE_NAME];
            [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_EXCLUDING_FROM_BACKUP_ERROR_CODE withDescription:BI_EXCLUDING_FROM_BACKUP_ERROR withUserInfo:userInfo];
        }
        return success;
    }
    [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_FILE_NOT_EXISTS_ERROR_CODE withDescription:BI_FILE_NOT_EXISTS_ERROR withUserInfo:@{FILE_NAME:[url lastPathComponent]}];
    return NO;
}

- (void)unarchiveEvents {
    self.pendingEvents = (NSMutableArray *)[BiEventSendHandler unarchiveOrDefaultFromFile:[self eventsFilePath] asClass:[NSMutableArray class]];
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
        [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_UNARCHIVE_DATA_ERROR_CODE
                                         withDescription:BI_UNARCHIVE_DATA_ERROR
                                            withUserInfo:@{
                                                           FILE_NAME:filePath,
                                                           EXCEPTION_NAME:exception.name,
                                                           EXCEPTION_REASON:exception.reason
                                                           }];
        unarchivedData = nil;
        
        NSError *error;
        BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (!removed) {
            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
            [userInfo setObject:filePath forKey:FILE_NAME];
            [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_FILE_REMOVAL_FAILURE_CODE withDescription:BI_FILE_REMOVAL_FAILURE withUserInfo:userInfo];
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

-(BOOL) isAppIdAvailable {
    return [self isAppIdValidated] && [self blitzDeviceId] != nil;
}

-(void) setBlitzdeviceId:(int*)appId: withDeviceId:(NSString*)deviceId {
    self.blitzDeviceId = deviceId
    self.blitzAppId = appId
    self.isAppIdValidated = true
}

- (void)updateNextFlushTime {
    NSDate *nextDate = [NSDate dateWithTimeIntervalSinceNow:forceSendAfterSeconds];
    self.nextFlushTime = [nextDate timeIntervalSince1970];
}

- (void)setBatchSize:(int)size {
    maxPendingCount = size;
}

-(NSMutableDictionary*) getCommonParams {
    NSMutableDictionary *biCommonParams = [[NSMutableDictionary alloc] init];
    [biCommonParams setValue:[self blitzAppId] forKey:"blitzAppId"];
    [biCommonParams setValue:[self blitzDeviceId]  forKey:"blitzDeviceId"];
    [biCommonParams setValue:[BlitzDeviceUtils getPlatformCode] forKey:"platformCode"];
    [biCommonParams setValue:[self blitzSessionId] forKey:"blitzSessionId"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppVersion] forKey:"appVersion"];
    [biCommonParams setValue:[BlitzDeviceUtils getTimeZone] forKey:"timezone"];
    [biCommonParams setValue:[BlitzDeviceUtils getIDFA] forKey:"ifa"];
    [biCommonParams setValue:[BlitzDeviceUtils getIFV] forKey:"ifv"];
    [biCommonParams setValue:[BlitzDeviceUtils getOSId] forKey:"osId"];
    [biCommonParams setValue:[BlitzDeviceUtils getConnDetails] forKey:"connDetails"];
    [biCommonParams setValue:[BlitzDeviceUtils getManufacturer] forKey:"manufacturer"];
    [biCommonParams setValue:[BlitzDeviceUtils getDeviceModel] forKey:"deviceModel"];
    [biCommonParams setValue:[BlitzDeviceUtils getCarrierName] forKey:"carrierName"];
    [biCommonParams setValue:[BlitzDeviceUtils getAdTrackingEnabled] forKey:"adTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getAppTrackingEnabled] forKey:"appTrackingEnabled"];
    [biCommonParams setValue:[BlitzDeviceUtils getUserAgent] forKey:"userAgent"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    [biCommonParams setValue:_appId forKey:"blitzAppId"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    [biCommonParams setValue:_appId forKey:"blitzAppId"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    [biCommonParams setValue:_appId forKey:"blitzAppId"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    [biCommonParams setValue:_appId forKey:"blitzAppId"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    [biCommonParams setValue:_appId forKey:"blitzAppId"];
    [biCommonParams setValue:_appToken forKey:"blitzAppToken"];
    return biCommonParams;
}

- (NSData *)getJSONDataForBatch:(NSArray *)batch {
    NSError *error;
    NSMutableDictionary *biDictionary = [[NSMutableDictionary alloc] init];
    [biDictionary setObject:[[BiEventManager biEventManager] addGenericDataInBIBatch] forKey:@"common_fields"];
    [biDictionary setObject:batch forKey:@"events"];
    [biDictionary setObject:[self getCommonParams] forKey:@"commonParams"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:biDictionary options:0 error:&error];

    if (jsonData == nil || error) {
        NSLog(@"Error in getting json data for batch %@ with error %@", batch, error);
        [BiEventSendHandler sendCrashlyticsErrorWithCode:BI_JSON_DATA_ERROR_CODE withDescription:BI_JSON_DATA_ERROR withUserInfo:error.userInfo];
    }
    return jsonData;
}

+ (void)sendCrashlyticsErrorWithCode:(NSInteger)code withDescription:(NSString *)description withUserInfo:(NSDictionary *)userInfo {
    [Utility sendCrashlyticsErrorWithDomain:BUNDLE_IDENTIFIER withCode:code withDescription:description withUserInfo:userInfo];
}

@end
