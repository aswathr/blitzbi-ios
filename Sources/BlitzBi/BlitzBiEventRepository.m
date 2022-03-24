//
//  BlitzBiEventRepository.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzBiEventRepository.h"
#import "BlitzRequestBuilder.h"

@interface BlitzBiEventRepository()
- (NSMutableDictionary*) getRequestHeaders;
@end

@implementation BlitzBiEventRepository
- (instancetype)init:(NSString*)appId
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
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:[@"app/{appId}/events" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
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
    [requestBuilder setMethod:BLITZ_POST_METHOD];
    [requestBuilder setBaseUrl:url];
    [requestBuilder setPath:[@"app/{appId}/events" stringByReplacingOccurrencesOfString:@"{appId}" withString:appId]];
    [requestBuilder setHeaders:[self getRequestHeaders]];
    [requestBuilder setHttpBody:data];
    [requestBuilder setReqType:BI_REQUEST];
    [requestBuilder setContentType:@"application/json"];
    
    if (isEmergency && ![NSThread isMainThread]) {
        [[[NSURLSession sharedSession] dataTaskWithRequest:[requestBuilder generateRequest] completionHandler:^(__attribute__((unused)) NSData *data,__attribute__((unused)) NSURLResponse *response, __attribute__((unused)) NSError *error){
            
        }] resume];
    } else {
        [networkService executeServerCallWithNoCallBack:requestBuilder];
    }
}

- (NSMutableDictionary*) getRequestHeaders {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:appId forKey:@"blitzAppId"];
    [headers setValue:appToken forKey:@"blitzAppToken"];
    return headers;
}
@end
