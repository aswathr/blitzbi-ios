//
//  BlitzNetworkModuleBuilder.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <BaseUrls.h>
#import <BlitzServerHandler.h>
#import <PBlitzDataTransferService.h>
#import <BlitzNetworkDataTransferService.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzNetworkModuleBuilder : NSObject
@property (strong) BaseUrls* baseUrls;
@property (strong) id <PServerHandler> serverHandler;

- (void)setParams:(BaseUrls*)baseUrls serverHandler: (id <PServerHandler>)serverHandler;
- (id <PBlitzDataTransferService>) build;
@end

NS_ASSUME_NONNULL_END