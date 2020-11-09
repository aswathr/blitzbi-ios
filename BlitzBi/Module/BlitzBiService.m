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
- (void)initializeDeviceId:(NSString*)appId
                          :(NSString*)appToken;
- (void)updateAppSpecificDeviceIdentifier;
- (void)updateAppSpecificUserIdentifier;
@end

@implementation BlitzBiService

- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking {
    self->appId = appId;
    self->appToken = appToken;
    
    self->baseUrl = @"https://prod-blitzbi.useblitz.com/";
    self->baseUrls = [[BaseUrls alloc] init:baseUrl];
    
    BlitzNetworkModuleBuilder *networkBuilder = [[BlitzNetworkModuleBuilder alloc] init];
    [networkBuilder setParams:baseUrls serverHandler:[[BlitzServerHandler alloc] init]];
    self->biNetworkService = [networkBuilder build];
    
    BlitzBiEventHandlerBuilder *handlerBuilder = [[BlitzBiEventHandlerBuilder alloc] init];
    [handlerBuilder setParams:[NSNumber numberWithInt:60] withUrl:baseUrl withAppId:appId withAppToken:appToken withService:biNetworkService withAdTracking:adTracking];
    self->biBuilder = [handlerBuilder build];
    
    self->dataHandler = [[BlitzBiDataHandler alloc] init:baseUrl :biNetworkService ];
    
    [self checkForDeviceId:appId :appToken];
}

- (void)setAppSpecificDeviceIdentifier:(NSString*)deviceIdentifier {
    self->appSpecificDeviceIdentifier = deviceIdentifier;
    [self updateAppSpecificDeviceIdentifier];
}

- (void)setAppSpecificUserIdentifier:(NSString*)userIdentifier {
    self->appSpecificUserIdentifier = userIdentifier;
    [self updateAppSpecificUserIdentifier];
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

- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId :deviceId];
    }  else {
        [self initializeDeviceId:appId :appToken];
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
                    [self updateAppSpecificUserIdentifier];
                }
            }
        }
    }];
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
        
        [self->dataHandler updateAppSpecificDeviceId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            if (err == nil) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil) {
                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    NSString *appSpecificDeviceId = [jsonDataDictionary objectForKey:@"appSpecificDeviceId"];
                    if (appSpecificDeviceId != nil) {
                        [BlitzDeviceUtils setAppSpecificDeviceId:appSpecificDeviceId];
                    }
                }
            }
        }];
    }
}

- (void)updateAppSpecificUserIdentifier {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (deviceId && appSpecificUserIdentifier) {
        BlitzUserRequest *userRequest = [[BlitzUserRequest alloc] init:appId :deviceId :appSpecificUserIdentifier];
        NSMutableDictionary *userRequestDict = [userRequest dictionary];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        [self->dataHandler updateAppSpecificUserId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
            if (err == nil) {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
                if (err == nil) {
                    NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                    NSString *appSpecificUserId = [jsonDataDictionary objectForKey:@"blitzUserId"];
                    if (appSpecificUserId != nil) {
                        [BlitzDeviceUtils setAppSpecificUserId:appSpecificUserId];
                    }
                }
            }
        }];
    }
}
@end
