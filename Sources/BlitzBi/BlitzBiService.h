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
    dispatch_queue_t serviceQueue;
    NSString* appId;
    NSString* appToken;
    BOOL adTracking;
    NSString* baseUrl;
    NSString* appSpecificDeviceIdentifier;
    NSString* blitzUserId;
    NSString* blitzPayerData;
    NSString* deviceId;
    BaseUrls* baseUrls;
    id <PBlitzDataTransferService> biNetworkService;
    BlitzBiEventSendHandler* biBuilder;
    BlitzBiDataHandler* dataHandler;
    
    BlitzTime *server;
    NSDictionary *paramsDictionary;
}
+ (BlitzBiService*)sharedService;
- (void)enableLogs;
- (void)disableLogs;
- (void)setUp:(NSString*)appId
             :(NSString*)appToken
             :(BOOL)adTracking
             :(BOOL)debugEnabled;
- (void)setAppSpecificIdentifier:(NSString*)deviceIdentifier;
- (void)setBlitzUserId:(NSString*)userIdentifier;
- (void)setBlitzPayerData:(NSString*)payerData;
- (void)setDeviceId:(NSString*)deviceId;
- (void)savePurchase:(NSString *)productId;
- (void)savePurchaseAsync:(NSString *)produtcId;
- (void)sendEvent:(NSDictionary*)eventDict;
- (void)sendEvents:(NSArray*)events;
- (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value;
- (void)handleException:(NSException *)exception;
- (long)getCurrentTime;
- (long)getCurrentTimeInternal;
- (void)getTimeStamp;
- (nullable NSString*) getParamForKey:(NSString*)key
                     withDefaultValue:(NSString*)defaultValue;

- (void)disconnectBlitzTime;
@end

NS_ASSUME_NONNULL_END
