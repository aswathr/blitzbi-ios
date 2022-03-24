//
//  BlitzBiDataHandler.m
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import "BlitzBiDataHandler.h"
#import "BlitzRequestBuilder.h"

@implementation BlitzBiDataHandler
- (instancetype)initWithBaseUrl:(NSString*)baseUrl
              andNetworkService:(id <PBlitzDataTransferService>)networkService {
    if (self = [super init]) {
        self->baseUrl = baseUrl;
        self->biNetworkService = networkService;
    }
    return self;
}

- (void)updateBlitzDevice:(NSString*)appId
                         :(NSString*)appToken
                         :(NSData*) data
                         :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/device/update" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}


- (void)savePurchaseWithAppId:(NSString*)appId withToken:(NSString *)appToken withData:(NSData*)data andCallback:(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/ios/purchase" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)updateAppSpecificDeviceIdentifier:(NSString*)appId
                                         :(NSString*)appToken
                                         :(NSData*) data
                                         :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/device/update" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)updateBlitzUser:(NSString*)appId
                       :(NSString*)appToken
                       :(NSData*) data
                       :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/user/update" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)updateBlitzPayerData:(NSString*)appId
                            :(NSString*)appToken
                            :(NSData*) data
                            :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/user/updatePayerData" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)updateDeviceId:(NSString*)appId
                      :(NSString*)appToken
                      :(NSData*) data
                      :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:[@"app/{appId}/device/updateDeviceId" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)getAllParams:(NSString*)appId
                    :(NSString*)appToken
                    :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_GET_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:@"params"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)getTimeStamp:(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_GET_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:@"timeStamp"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}
@end
