//
//  BlitzNetworkDataTransferService.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzNetworkDataTransferService : NSObject<PBlitzDataTransferService>
@property id <PBlitzServerConfig> serverConfig;
@property id <PServerHandler> serverHandler;

- (instancetype)init:(id <PBlitzServerConfig>)serverConfig
                    :(id <PServerHandler>)serverHandler;
@end

NS_ASSUME_NONNULL_END
