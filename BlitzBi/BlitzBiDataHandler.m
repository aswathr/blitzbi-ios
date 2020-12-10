//
//  BlitzBiDataHandler.m
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import <BlitzBiDataHandler.h>

@implementation BlitzBiDataHandler
- (instancetype)initWithBaseUrl:(NSString*)baseUrl
              andNetworkService:(id <PBlitzDataTransferService>)networkService {
    if (self = [super init]) {
        self->baseUrl = baseUrl;
        self->biNetworkService = networkService;
    }
    return self;
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
    [requestBuilder setPath:@"app/device/update"];
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
    [requestBuilder setPath:@"app/device/update"];
    [requestBuilder setHeaders:headers];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:APP_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self->biNetworkService executeServerCall:requestBuilder withCompletion:completionBlock];
}

- (void)updateBlitzUserId:(NSString*)appId
                         :(NSString*)appToken
                         :(NSData*) data
                         :(void(^)(NSObject *, NSError *))completionBlock {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:baseUrl];
    [requestBuilder setPath:@"app/user/update"];
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
@end
