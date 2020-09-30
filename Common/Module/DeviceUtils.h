//
//  DeviceUtils.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface DeviceUtils : NSObject

+ (NSString *)getDeviceNameUnderScored;

// Used for BI Data

+ (NSString *)getAppVersion;

+ (NSString *)getAppId;

+ (NSString *)getPlatformCode;

+ (NSString *)getLocaleCode;

+ (NSString *)getConnDetails;

+ (NSString *)getManufacturer;

+ (NSString *)getCountryCode;

+ (NSString *)getCurrentLanguage;

+ (NSString *)getCarrierName;

+ (NSString *)getIFV;

+ (NSString *)getDeviceModel;

+ (NSNumber *)getOSId;

+ (nullable NSString *)getIDFA;

+ (BOOL)isIDFAEnabled;

//+ (void)EmptySandbox;

+ (NSString *)getKiwiDeviceId;

+ (NSNumber *)getKiwiDeviceIdAsNumber;

+ (void)setKiwiDeviceId:(NSNumber *)kiwiDeviceId;

+ (NSString *)getFormattedDetails;


//check for deviceCheckId, if not present, get and continue
//+ (void)continueDiffOnSettingDeviceCheckId:(dispatch_block_t)continueDiffCallBlock;
//
//+ (void)setDeviceCheckIdAndUpdateServer:(BOOL)updateServer withNewState:(NSString *)newState withContinueDiffBlock:(dispatch_block_t)continueDiffCallBlock;

@end
