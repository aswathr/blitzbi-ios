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
#import <BlitzDeviceRequest.h>
#import <BlitzUserRequest.h>
#import <PBlitzDataTransferService.h>
#import <BlitzBiEventSendHandler.h>
#import <BlitzNetworkModuleBuilder.h>
#import <BlitzConstants.h>
#import <BlitzBIEventHandlerBuilder.h>
#import <BlitzDeviceUtils.h>
#import <BlitzBiDataHandler.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiService : NSObject {
    NSString* appId;
    NSString* appToken;
    NSString* baseUrl;
    NSString* appSpecificDeviceIdentifier;
    NSString* appSpecificUserIdentifier;
    BaseUrls* baseUrls;
    id <PBlitzDataTransferService> biNetworkService;
    BlitzBiEventSendHandler* biBuilder;
    BlitzBiDataHandler* dataHandler;
}

- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking;
- (void)setAppSpecificDeviceIdentifier:(NSString*)deviceIdentifier;
- (void)setAppSpecificUserIdentifier:(NSString*)userIdentifier;
- (void)sendEvent:(NSDictionary*)eventDict;
- (void)sendEvents:(NSArray*)events;
@end

NS_ASSUME_NONNULL_END
