//
//  BlitzNetworkModuleBuilder.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BlitzNetworkModuleBuilder.h"

@implementation BlitzNetworkModuleBuilder
- (void)setParams:(BaseUrls*)baseUrls serverHandler: (id <PServerHandler>)serverHandler {
    self.baseUrls = baseUrls;
    self.serverHandler = serverHandler;
}

- (id <PBlitzDataTransferService>) build {
    BlitzServerConfig *config = [[BlitzServerConfig alloc] init];
    [config initWithBaseUrl:self.baseUrls];
    
    BlitzNetworkDataTransferService *service = [[BlitzNetworkDataTransferService alloc] init];
    [service initWithConfig:config withhandler:self.serverHandler];
    return service;
}
@end
