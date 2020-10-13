//
//  BlitzBIEventRepository.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzBIEventRepository.h"

@implementation BlitzBIEventRepository
- (instancetype)init:(NSNumber*) appId withToken: (NSString*)appToken withService:(id <PBlitzDataTransferService>) networkService{
    if (self = [super init]) {
        _appId = appId;
        _appToken = appToken;
        _networkService = networkService;
    }
    return self;
}
- (void)processJsonRequest:(NSString*)url withData: (NSData*)data withCompletion:(void(^)(NSObject *, NSError *))completion{
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:POST_METHOD];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:@"events"];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [self.networkService executeServerCall:requestBuilder withCompletion: completion];
}

- (void)processJsonRequestWithoutResponse:(NSString*)url withData:(NSData*)data withIsEmergency:(BOOL)isEmergency {
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:POST_METHOD];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:@"events"];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    if (isEmergency && ![NSThread isMainThread]) {
        [[[NSURLSession sharedSession] dataTaskWithRequest:[requestBuilder generateRequest] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            
        }] resume];
    } else {
        [self.networkService executeServerCallWithNoCallBack:requestBuilder];
    }
}

- (NSMutableDictionary*) getRequestHeaders {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:[_appId stringValue] forKey:@"blitzAppId"];
    [headers setValue:_appToken forKey:@"blitzAppToken"];
    return headers;
}
@end
