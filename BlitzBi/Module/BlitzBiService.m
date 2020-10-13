//
//  BlitzBiService.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzBiService.h"

@implementation BlitzBiService

NSString* baseUrl;
BaseUrls* baseUrls;
id <PBlitzDataTransferService> biNetworkService;
BlitzBiEventSendHandler* biBuilder;

- (void)setUp:(NSNumber*)appId withAppToken:(NSString*)appToken {
    baseUrl = @"https://blitzbi-dev.useblitz.com/";
    baseUrls = [[BaseUrls alloc] initWithBaseUrl:baseUrl];
    
    BlitzNetworkModuleBuilder *networkBuilder = [[BlitzNetworkModuleBuilder alloc] init];
    [networkBuilder setParams:baseUrls serverHandler:[[BlitzServerHandler alloc] init]];
    biNetworkService = [networkBuilder build];
    
    BlitzBiEventHandlerBuilder *handlerBuilder = [[BlitzBiEventHandlerBuilder alloc] init];
    [handlerBuilder setParams:[NSNumber numberWithInt:60] withUrl:baseUrl withAppId:appId withAppToken:appToken withService:biNetworkService];
    biBuilder = [handlerBuilder build];
    
    [self checkForDeviceId:appId withAppToken:appToken];
}

-(void)checkForDeviceId:(NSNumber*)appId withAppToken:(NSString*)appToken {
    NSString *deviceId = [[NSUserDefaults standardUserDefaults] stringForKey:BLITZ_DEVICE_ID_KEY];
    if(deviceId) {
        [biBuilder setBlitzdeviceId:appId withDeviceId:deviceId];
    }  else {
        [self initialize:appId withAppToken:appToken];
    }
}

-(void)initialize:(NSNumber*)appId withAppToken:(NSString*)appToken {
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    BiDeviceRequest *deviceRequest = [[BiDeviceRequest alloc] initWithAppId:appId withDeviceId:deviceId];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:deviceRequest options:0 error:&error];
    if (error) {
        return;
    }
    
    NSLog(@"%@", data);
    [self checkForDeviceId:appId withAppToken:appToken withData:data withCompletionBlock:^(NSObject *response, NSError *err){
        if (err == nil) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:&err];
            if (err == nil) {
                NSDictionary *jsonDataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&err];
                NSString *blitzDeviceId = [jsonDataDictionary objectForKey:@"blitzDeviceId"];
                if (blitzDeviceId != nil) {
                    [[NSUserDefaults standardUserDefaults] setObject:blitzDeviceId forKey:BLITZ_DEVICE_ID_KEY];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    [biBuilder setBlitzdeviceId:appId withDeviceId:deviceId];
                }
            }
        }
    }];
}

-(void) checkForDeviceId:(NSNumber*)appId withAppToken:(NSString*)appToken withData:(NSData*) data withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:[appId stringValue] forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:@"POST"];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:@"app/device/update"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)sendEvents:(NSArray *)events{
    if (events != nil) {
        [biBuilder sendEvents:events];
    }
}

- (void)sendEvent:(NSDictionary *)eventDict {
    if (eventDict != nil) {
        [biBuilder sendEvent:eventDict];
    }
}
@end
