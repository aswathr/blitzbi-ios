//
//  BlitzBiService.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzBiService.h"

@implementation BlitzBiService

- (void)setUp:(Int*)appId withAppToken:(NSString*)appToken {
    _baseUrls = [[BaseUrls alloc] init]
    [[self _baseUrls] base_URL] = baseUrl
    _biNetworkService = [[BlitzNetworkModuleBuilder setParams:baseUrls] build]
    _biBuilder = [[BlitzBIEventHandlerBuilder setParams:60 baseUrl:baseUrl networkService:(biNetworkService as! PBlitzDataTransferService) appId: appId appToken:appToken] build]
    
    [self checkForDeviceId:appId appToken:appToken]
}

-(void)checkForDeviceId:(Int*)appId withAppToken:(NSString*)appToken {
    NSString *deviceId = [[UserDefaultsUtil sharedInstance] stringForKey:BLITZ_DEVICE_ID_KEY];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId withDeviceId:deviceId]
    }  else {
        [self initialize:appId withAppToken:appToken]
    }
}

-(void)initialize:(Int*)appId withAppToken:(NSString*)appToken {
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    BiDeviceRequest *deviceRequest = [[BiDeviceRequest alloc] initWithAppId:appId blitzDeviceId:deviceId]
    
    NSError *error;
    NSData *json = [NSJSONSerialization dataWithJSONObject:deviceRequest options:0 error:&error];
    if (error) {
        return;
    }
    
    if let data = try? encoder.encode(deviceRequest) {
        print(data)
        [self checkForDeviceId:appId withAppToken:appToken withData:data withCompletionBlock:^(NSObject *output, NSError *error){
            if (err == nil && [response blitzDeviceId] != nil) {
                [[UserDefaultsUtil sharedInstance] setValue:[response blitzDeviceId] forKey:BLITZ_DEVICE_ID_KEY];
                [biBuilder setBlitzdeviceId:appId withDeviceId:deviceId];
            }
        }]
    }
}

-(void) checkForDeviceId:(Int*)appId withAppToken:(NSString*)appToken withData:(Data*) data withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:"blitzAppId"];
    [headers setValue:appToken forKey:"blitzAppToken"];
    
    RequestBuilder *requestBuilder = [[RequestBuilder alloc] init];
    [requestBuilder setMethod:@"POST"];
    [requestBuilder setBaseUrl:[self baseUrl]];
    [requestBuilder setPath:@"app/device/update"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self.networkService executeServerCall:requestBuilder withCompletion: completion]
}

- (void)sendEvents:(NSArray *)events{
    if (events != nil) {
        [biBuilder sendEvent:events]
    }
}

- (void)sendEvent:(NSDictionary *)eventDict {
    if (events != nil) {
        [biBuilder sendEvents:eventDict]
    }
}

@end
