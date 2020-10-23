//
//  BlitzBiService.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaseUrls.h>
#import <BlitzRequestBuilder.h>
#import <BiDeviceRequest.h>
#import <PBlitzDataTransferService.h>
#import <BlitzBiEventSendHandler.h>
#import <BlitzNetworkModuleBuilder.h>
#import <BlitzConstants.h>
#import <BlitzBIEventHandlerBuilder.h>
#import <BlitzDeviceUtils.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiService : NSObject {
    NSString* appId;
    NSString* appToken;
    NSString* baseUrl;
    NSString* appSpecificDeviceId;
    BaseUrls* baseUrls;
    id <PBlitzDataTransferService> biNetworkService;
    BlitzBiEventSendHandler* biBuilder;
}

- (void)setUp:(NSString*)appId
             :(NSString*)appToken;
- (void)setAppIdentifier:(NSString*)identifier;
- (void)sendEvent:(NSDictionary*)eventDict;
- (void)sendEvents:(NSArray*)events;
@end

NS_ASSUME_NONNULL_END
