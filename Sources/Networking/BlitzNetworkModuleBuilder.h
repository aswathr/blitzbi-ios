//
//  BlitzNetworkModuleBuilder.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBlitzDataTransferService.h"

@class BaseUrls;
@class BlitzServerHandler;
@class BlitzNetworkDataTransferService;

NS_ASSUME_NONNULL_BEGIN

@interface BlitzNetworkModuleBuilder : NSObject
@property (strong) BaseUrls* baseUrls;
@property (strong) id <PBlitzServerHandler> serverHandler;

- (void)setParams:(BaseUrls*)baseUrls serverHandler: (id <PBlitzServerHandler>)serverHandler;
- (id <PBlitzDataTransferService>) build;
@end

NS_ASSUME_NONNULL_END
