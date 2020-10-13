//
//  BlitzBiEventRepository.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BlitzBiEventRepository.h>

@implementation BlitzBiEventRepository
- (instancetype)init:(NSNumber*)appId
                    :(NSString*)appToken
                    :(id <PBlitzDataTransferService>)networkService {
    if (self = [super init]) {
        self->appId = appId;
        self->appToken = appToken;
        self->networkService = networkService;
    }
    return self;
}
- (void)processJsonRequest:(NSString*)url
                          :(NSData*)data
                          :(void(^)(NSObject *, NSError *))completion{
    BlitzRequestBuilder *requestBuilder = [[BlitzRequestBuilder alloc] init];
    [requestBuilder setMethod:POST_METHOD];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:@"events"];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    [networkService executeServerCall:requestBuilder withCompletion: completion];
}

- (void)processJsonRequestWithoutResponse:(NSString*)url
                                         :(NSData*)data
                                         :(BOOL)isEmergency {
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
        [networkService executeServerCallWithNoCallBack:requestBuilder];
    }
}

- (NSMutableDictionary*) getRequestHeaders {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:[appId stringValue] forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    return headers;
}
@end
