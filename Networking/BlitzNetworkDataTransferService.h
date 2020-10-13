//
//  BlitzNetworkDataTransferService.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzNetworkDataTransferService : NSObject<PBlitzDataTransferService>
@property id <PBlitzServerConfig> serverConfig;
@property id <PServerHandler> serverHandler;

- (instancetype)initWithConfig:(id <PBlitzServerConfig>)serverConfig withhandler:(id <PServerHandler>)serverHandler;
@end

NS_ASSUME_NONNULL_END
