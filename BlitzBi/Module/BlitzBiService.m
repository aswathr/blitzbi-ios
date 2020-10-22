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
- (void)updateDeviceIdentifier;
- (void)initialize:(NSString*)appId
                  :(NSString*)appToken;
- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken
                        :(NSData*)data
                        :(void(^)(NSObject *, NSError *))completionBlock;
@end

@implementation BlitzBiService

- (void)setUp:(NSString*)appId
             :(NSString*)appToken {
    self->appId = appId;
    self->appToken = appToken;
    
    self->baseUrl = @"https://prod-blitzbi.useblitz.com/";
    self->baseUrls = [[BaseUrls alloc] init:baseUrl];
    
    BlitzNetworkModuleBuilder *networkBuilder = [[BlitzNetworkModuleBuilder alloc] init];
    [networkBuilder setParams:baseUrls serverHandler:[[BlitzServerHandler alloc] init]];
    self->biNetworkService = [networkBuilder build];
    
    BlitzBiEventHandlerBuilder *handlerBuilder = [[BlitzBiEventHandlerBuilder alloc] init];
    [handlerBuilder setParams:[NSNumber numberWithInt:60] withUrl:baseUrl withAppId:appId withAppToken:appToken withService:biNetworkService];
    self->biBuilder = [handlerBuilder build];
    
    [self checkForDeviceId:appId :appToken];
}

- (void)setAppDeviceIdentifier:(NSString*)identifier {
    self->appSpecificDeviceId = identifier;
    [self updateDeviceIdentifier];
}

- (void)checkForDeviceId:(NSString*)appId
                        :(NSString*)appToken {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId :deviceId];
    }  else {
        [self initialize:appId :appToken];
    }
}

- (void)initialize:(NSString*)appId
                  :(NSString*)appToken {
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    BiDeviceRequest *deviceRequest = [[BiDeviceRequest alloc] init:appId :deviceId :nil];
    NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return;
    }
    
    NSLog(@"initialize -> %@", jsonData);
    [self checkForDeviceId:appId :appToken :jsonData :^(NSObject *response, NSError *err){
        if (err == nil) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
            if (err == nil) {
                NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                NSString *blitzDeviceId = [jsonDataDictionary objectForKey:@"blitzDeviceId"];
                if (blitzDeviceId != nil) {
                    [BlitzDeviceUtils setBlitzDeviceId:blitzDeviceId];
                    [self->biBuilder setBlitzdeviceId:appId :deviceId];
                    [self updateDeviceIdentifier];
                }
            }
        }
    }];
}

- (void)updateDeviceIdentifier {
    NSString *deviceId = [BlitzDeviceUtils getBlitzDeviceId];
    if (deviceId && appSpecificDeviceId) {
        BiDeviceRequest *deviceRequest = [[BiDeviceRequest alloc] init:appId :deviceId :appSpecificDeviceId];
        NSMutableDictionary *deviceRequestDict = [deviceRequest dictionary];
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:deviceRequestDict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            return;
        }
        
        NSLog(@"updateDeviceIdentifier -> %@", jsonData);
        [self checkForDeviceId:appId :appToken :jsonData :^(__attribute__((unused)) NSObject *response,__attribute__((unused)) NSError *err){
            
        }];
    }
}

- (void) checkForDeviceId:(NSString*)appId
                         :(NSString*)appToken
                         :(NSData*) data
                         :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:@"app/device/update"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
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
@end
