//
//  BlitzBiService.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBiService.h>

@interface BlitzBiService()
- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken;
- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken;
- (void)initializeDeviceId:(NSString*)appId
                          :(NSString*)appToken;
- (void)updateAppSpecificDeviceIdentifier;
- (void)updateBlitzUserId;
- (void)initializeBlitzTime;
@end

@implementation BlitzBiService

+ (BlitzBiService*)sharedService {
    static BlitzBiService *sharedInstance = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[BlitzBiService alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->paramsDictionary = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking {
    self->appId = appId;
    self->appToken = appToken;
    
    #ifdef DEBUG
        self->baseUrl = @"https://blitzbi-dev.useblitz.com/";
    #else
        self->baseUrl = @"https://prod-blitzbi.useblitz.com/";
    #endif
    
    self->baseUrls = [[BaseUrls alloc] init:baseUrl];
    
    BlitzNetworkModuleBuilder *networkBuilder = [[BlitzNetworkModuleBuilder alloc] init];
    [networkBuilder setParams:baseUrls serverHandler:[[BlitzServerHandler alloc] init]];
    self->biNetworkService = [networkBuilder build];
    
    BlitzBiEventHandlerBuilder *handlerBuilder = [[BlitzBiEventHandlerBuilder alloc] init];
    [handlerBuilder setParams:[NSNumber numberWithInt:60] withUrl:baseUrl withAppId:appId withAppToken:appToken withService:biNetworkService withAdTracking:adTracking];
    self->biBuilder = [handlerBuilder build];
    
    self->dataHandler = [[BlitzBiDataHandler alloc] init:baseUrl :biNetworkService ];
    
    [self checkForDeviceId:appId :appToken];
    [self initializeBlitzTime];
}

- (void)setAppSpecificIdentifier:(NSString*)identifier {
    self->appSpecificDeviceIdentifier = identifier;
    [self updateAppSpecificDeviceIdentifier];
}

- (void)setBlitzUserId:(NSString*)userId {
    self->blitzUserId = userId;
    [self updateBlitzUserId];
}

- (void)sendEvents:(NSArray*)events{
    if (events != nil) {
        [biBuilder sendEvents:events];
    }
}

- (void)sendEvent:(NSDictionary*)eventDict {
    if (eventDict != nil) {
        [biBuilder sendEvent:eventDict];
    }
}

- (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value {
    NSMutableDictionary *commonParams = [[BlitzDeviceUtils getBlitzCommonParams]mutableCopy];
    [commonParams setValue:value forKey:key];
    [BlitzDeviceUtils setBlitzCommonParam:commonParams];
}

- (long)getCurrentTime {
    @try {
        return [[server dateWithError:nil] timeIntervalSince1970];
    } @catch (NSException *exception) {
        NSLog(@"BlitzBiEventSendHandler::getFormattedDate Error whlle getting formatted date.");
        return 0;
    }
}

- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId :deviceId];
        [self getAllParams:appId :appToken];
    }  else {
        [self initializeDeviceId:appId :appToken];
    }
}

- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken {
    [self->dataHandler getAllParams:appId :appToken :^(NSObject *response, NSError *err){
        if (err == nil && response) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
            if (err == nil) {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                if (dictionary) {
                    self->paramsDictionary = dictionary;
                }
            }
        }
    }];
}

- (nullable NSString*) getParamForKey:(NSString*)key
                     withDefaultValue:(NSString*)defaultValue {
    @try {
        if (paramsDictionary && [paramsDictionary valueForKey:key]) {
            return [paramsDictionary valueForKey:key];
        } else {
            return defaultValue;
        }
    } @catch (NSException *exception) {
        NSLog(@"Error while getting Param for key %@", key);
        return defaultValue;
    }
}

- (void)initializeDeviceId:(NSString*)appId
                          :(NSString*)appToken {
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    BlitzDeviceRequest *deviceRequest = [[BlitzDeviceRequest alloc] init:appId :deviceId :nil];
    NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return;
    }
    
    NSLog(@"initialize -> %@", jsonData);
    [self->dataHandler updateDeviceId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
        if (err == nil) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
            if (err == nil) {
                NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                NSString *blitzDeviceId = [jsonDataDictionary objectForKey:@"blitzDeviceId"];
                if (blitzDeviceId != nil) {
                    [BlitzDeviceUtils setBlitzDeviceId:blitzDeviceId];
                    [self->biBuilder setBlitzdeviceId:appId :deviceId];
                    [self updateAppSpecificDeviceIdentifier];
                    [self updateBlitzUserId];
                    [self getAllParams:appId :appToken];
                }
            }
        }
    }];
}

- (void)initializeBlitzTime {
    @try {
        self->server = [[BlitzTime alloc] initWithHostname:@"time.google.com" port:123];
    } @catch (NSException *exception) {
        NSLog(@"BlitzBiEventSendHandler::initializeBlitzTime Error whlle initialixing blitz time.");
    }
}


- (long)disconnectBlitzTime {
    @try {
        if (self->server) {
            [self->server disconnect];
        }
    } @catch (NSException *exception) {
        NSLog(@"BlitzBiEventSendHandler::disconnectBlitzTime Error whlle disconnecting blitz time.");
    }
}

- (void)updateAppSpecificDeviceIdentifier {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (deviceId && appSpecificDeviceIdentifier) {
        BlitzDeviceRequest *deviceRequest = [[BlitzDeviceRequest alloc] init:appId :deviceId :appSpecificDeviceIdentifier];
        NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateAppSpecificDeviceIdentifier:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            if (err == nil) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil) {
                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    NSString *appSpecificDeviceId = [jsonDataDictionary objectForKey:@"appSpecificDeviceId"];
                    if (appSpecificDeviceId != nil) {
                        [BlitzDeviceUtils setAppDeviceId:appSpecificDeviceId];
                    }
                }
            }
        }];
    }
}

- (void)updateBlitzUserId {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (deviceId && blitzUserId) {
        BlitzUserRequest *userRequest = [[BlitzUserRequest alloc] init:appId :deviceId :blitzUserId];
        NSMutableDictionary *userRequestDict = [userRequest dictionary];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateBlitzUserId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            if (err == nil) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil) {
                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    NSString *blitzUserId = [jsonDataDictionary objectForKey:@"blitzUserId"];
                    if (blitzUserId != nil) {
                        [BlitzDeviceUtils setBlitzUserId:blitzUserId];
                    }
                }
            }
        }];
    }
}
@end
