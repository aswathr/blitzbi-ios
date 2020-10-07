//
//  BlitzDeviceUtils.h
//  BlitzDemo
//
//  Created by Admin on 07/10/20.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface BlitzDeviceUtils : NSObject

+ (NSString *)getPlatformCode;

+ (NSString *)getSessionId;

+ (NSString *)getBlitzDeviceId;

+ (void)setBlitzDeviceId:(NSString *) deviceId;

+ (NSString *)getAppVersion;

+ (NSString *)getTimeZone;

+ (NSString *)getIDFA;

+ (NSString *)getIFV;

+ (NSNumber *)getOSId;

+ (NSString *)getConnDetails;

+ (NSString *)getManufacturer;

+ (NSString *)getDeviceModel;

+ (NSString *)getCarrierName;

+ (NSString *)getAdTrackingEnabled;

+ (NSString *)getAppTrackingEnabled;

+ (NSString *)getUserAgent;

+ (NSString *)getNotificationId;
@end
