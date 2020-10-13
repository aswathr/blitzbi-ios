//
//  BlitzNetworkDataTransferService.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BlitzNetworkDataTransferService.h>
#import <PBlitzServerConfig.h>
#import <BlitzServerConfig.h>
#import <BlitzServerHandler.h>

@implementation BlitzNetworkDataTransferService
- (instancetype)init:(id <PBlitzServerConfig>)serverConfig
                              :(id <PServerHandler>)serverHandler {
    if (self = [super init]) {
        self.serverConfig = serverConfig;
        self.serverHandler = serverHandler;
    }
    return self;
}

- (void) executeServerCallWithNoCallBack:(BlitzRequestBuilder *)requestBuilder {
    [self.serverHandler serverCall:requestBuilder withCompletionBlock:^(NSObject *response, NSError *err){
        
    }];
}

- (void) executeServerCall:(BlitzRequestBuilder *)requestBuilder withCompletion:(void(^)(NSObject *, NSError *))completion {
    [self.serverHandler serverCall:requestBuilder withCompletionBlock:completion];
}
@end
