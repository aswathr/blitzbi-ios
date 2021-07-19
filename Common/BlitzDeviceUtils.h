//
//  BlitzDeviceUtils.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzDeviceUtils : NSObject
+ (nonnull NSString*)getPlatformCode;
+ (nonnull NSString*)getDeviceType;
+ (nonnull NSString*)getSessionId;
+ (nullable NSString*)getBlitzDeviceId;
+ (nullable NSString *)getAppDeviceId;
+ (nullable NSString *)getBlitzPartnerDeviceId;
+ (nullable NSString *)getBlitzUserId;
+ (nonnull NSDictionary *)getBlitzCommonParams;
+ (void)setBlitzDeviceId:(nonnull NSString*) deviceId;
+ (void)setBlitzPartnerDeviceId:(nonnull NSString *) deviceId;
+ (void)setAppDeviceId:(nonnull NSString *) appSpecificDeviceId;
+ (void)setBlitzUserId:(nonnull NSString *) appSpecificUserId;
+ (void)setBlitzCommonParam:(nonnull NSDictionary *) commonParams;
+ (void)setBlitzAppReceipt:(nonnull NSString *)receipt;
+ (nonnull NSString*)getAppVersion;
+ (nonnull NSString*)getTimeZone;
+ (nonnull NSString*)getIDFA;
+ (nonnull NSString*)getIFV;
+ (nonnull NSNumber*)getOSId;
+ (nonnull NSString*)getConnDetails;
+ (nonnull NSString*)getManufacturer;
+ (nonnull NSString*)getDeviceModel;
+ (nonnull NSString*)getCarrierName;
+ (nonnull NSString*)getAdTrackingEnabled;
+ (nonnull NSString*)getAppTrackingEnabled;
+ (nonnull NSString*)getUserAgent;
+ (nonnull NSString*)getNotificationId;
+ (nullable NSString *)getBlitzAppReceipt;
@end
