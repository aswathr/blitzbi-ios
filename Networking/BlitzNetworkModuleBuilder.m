//
//  BlitzNetworkModuleBuilder.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzNetworkModuleBuilder.h>

@implementation BlitzNetworkModuleBuilder
- (void)setParams:(BaseUrls*)baseUrls serverHandler: (id <PServerHandler>)serverHandler {
    self.baseUrls = baseUrls;
    self.serverHandler = serverHandler;
}

- (id <PBlitzDataTransferService>) build {
    BlitzServerConfig *config = [[BlitzServerConfig alloc] init:self.baseUrls];
    
    BlitzNetworkDataTransferService *service = [[BlitzNetworkDataTransferService alloc] init:config
                                                                                            :self.serverHandler];
    return service;
}
@end
