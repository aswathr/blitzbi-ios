//
//  BlitzNetworkDataTransferService.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzNetworkDataTransferService.h>
#import <PBlitzServerConfig.h>
#import <BlitzServerConfig.h>
#import <BlitzServerHandler.h>

@implementation BlitzNetworkDataTransferService
- (instancetype)init:(id <PBlitzServerConfig>)serverConfig
                    :(id <PBlitzServerHandler>)serverHandler {
    if (self = [super init]) {
        self.serverConfig = serverConfig;
        self.serverHandler = serverHandler;
    }
    return self;
}

- (void) executeServerCallWithNoCallBack:(BlitzRequestBuilder *)requestBuilder {
    [self.serverHandler serverCall:requestBuilder withCompletionBlock:^(__attribute__((unused)) NSObject *_response, __attribute__((unused)) NSError *err){
        
    }];
}

- (void) executeServerCall:(BlitzRequestBuilder *)requestBuilder withCompletion:(void(^)(NSObject *, NSError *))completion {
    [self.serverHandler serverCall:requestBuilder withCompletionBlock:completion];
}
@end
