//
//  BlitzDeviceUtils.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface BlitzDeviceUtils : NSObject
+ (NSString*)getPlatformCode;
+ (NSString*)getDeviceType;
+ (NSString*)getSessionId;
+ (NSString*)getBlitzDeviceId;
+ (NSString *)getAppDeviceId;
+ (NSString *)getBlitzUserId;
+ (NSDictionary *)getBlitzCommonParams;
+ (void)setBlitzDeviceId:(NSString*) deviceId;
+ (void)setAppDeviceId:(NSString *) appSpecificDeviceId;
+ (void)setBlitzUserId:(NSString *) appSpecificUserId;
+ (void)setBlitzCommonParam:(NSDictionary *) commonParams;
+ (NSString*)getAppVersion;
+ (NSString*)getTimeZone;
+ (NSString*)getIDFA;
+ (NSString*)getIFV;
+ (NSNumber*)getOSId;
+ (NSString*)getConnDetails;
+ (NSString*)getManufacturer;
+ (NSString*)getDeviceModel;
+ (NSString*)getCarrierName;
+ (NSString*)getAdTrackingEnabled;
+ (NSString*)getAppTrackingEnabled;
+ (NSString*)getUserAgent;
+ (NSString*)getNotificationId;
@end
