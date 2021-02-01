//
//  BlitzBiService.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBlitzDataTransferService.h"

@class BaseUrls;
@class BlitzRequestBuilder;
@class BlitzDeviceRequest;
@class BlitzUserRequest;
@class BlitzBiEventSendHandler;
@class BlitzNetworkModuleBuilder;
@class BlitzConstants;
@class BlitzBiEventHandlerBuilder;
@class BlitzDeviceUtils;
@class BlitzBiDataHandler;
@class BlitzPayerRequest;
@class BlitzTime;

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiService : NSObject {
    NSString* appId;
    NSString* appToken;
    NSString* baseUrl;
    NSString* appSpecificDeviceIdentifier;
    NSString* blitzUserId;
    NSString* blitzPayerData;
    BaseUrls* baseUrls;
    id <PBlitzDataTransferService> biNetworkService;
    BlitzBiEventSendHandler* biBuilder;
    BlitzBiDataHandler* dataHandler;
    
    BlitzTime *server;
    NSDictionary *paramsDictionary;
}
+ (BlitzBiService*)sharedService;
- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking
             :(BOOL)debugEnabled;
- (void)setAppSpecificIdentifier:(NSString*)deviceIdentifier;
- (void)setBlitzUserId:(NSString*)userIdentifier;
- (void)setBlitzPayerData:(NSString*)payerData;
- (void)sendEvent:(NSDictionary*)eventDict;
- (void)sendEvents:(NSArray*)events;
- (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value;
- (long)getCurrentTime;
- (nullable NSString*) getParamForKey:(NSString*)key
                     withDefaultValue:(NSString*)defaultValue;

- (void)disconnectBlitzTime;
@end

NS_ASSUME_NONNULL_END
