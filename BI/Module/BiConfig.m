//
//  BiConfig.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BiConfig.h"
//#import "DeviceUtils.h"

#define UNKNOWN_MACRO @"unknown"
#define ORGANIC_MACRO @"organic"
#define UNIDENTIFIED_MACRO @"unidentified"

GAME_CLOSE_MODE GAME_CLOSE_MODE_ValueOf(NSString *text) {
    if (text) {
        if ([text isEqualToString:@"PAUSE"]) {
            return GAME_CLOSE_MODE_PAUSE;
        }
        else if ([text isEqualToString:@"EXIT"]) {
            return GAME_CLOSE_MODE_EXIT;
        }
        else if ([text isEqualToString:@"CRASH"]) {
            return GAME_CLOSE_MODE_CRASH;
        }
    }
    return -1;
}

NSString *GAME_CLOSE_MODE_Description(GAME_CLOSE_MODE value) {
    switch (value) {
        case GAME_CLOSE_MODE_PAUSE: {
            return @"PAUSE";
        }
        case GAME_CLOSE_MODE_EXIT: {
            return @"EXIT";
        }
        case GAME_CLOSE_MODE_CRASH:
            return @"CRASH";
    }
    return nil;
}

@implementation BiConfig

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

static NSString *TAG = @"BiConfig_Class";

- (void)initImmediateWithEnv:(NSString *)env {
    _BUILD_ENV = env;
    _PAYER_FLAG = @"0";
//    _KIWI_DEVICE_ID = [[DeviceUtils getKiwiDeviceIdAsNumber] stringValue];
//    _APP_ID = [DeviceUtils getAppId];
//    _APP_VERSION = [DeviceUtils getAppVersion];
//    _PLATFORM_CODE = [DeviceUtils getPlatformCode];
//    _LOCALE_CODE = [DeviceUtils getLocaleCode];
//    _OS_ID = [[DeviceUtils getOSId] stringValue];
//    _CONN_DETAILS = [DeviceUtils getConnDetails];
//    _MANUFACTURER = [DeviceUtils getManufacturer];
//    _DEVICE_MODEL = [DeviceUtils getDeviceModel];
//    _CARRIER_NAME = [DeviceUtils getCarrierName];
//    _IFV = [DeviceUtils getIFV] != nil ? [DeviceUtils getIFV] : @"";
//    _IFA = [DeviceUtils getIDFA] != nil ? [DeviceUtils getIDFA] : @"";
//    _IS_IFA_ENABLED = [DeviceUtils isIDFAEnabled];

    _EXTERNAL_STORAGE_PATH = @"/mnt/storage";// Dummy
    _LOG_FILE_PATH = @"/mnt/storage";// Dummy

    _SESSION_EXPIRE_THRESHOLD = 120;// default value, in seconds
    _USER_ENGAGED_TIME_THRESHOLD = 10;// default value, in seconds
}

- (void)initImmediateAfterDiff:(BOOL)isFirstLaunch {
    _IS_FIRST_TIME_LAUNCH = isFirstLaunch;
    _INIT_COMPLETE = true;
  //  _SESSION_EXPIRE_THRESHOLD = [[AppParamModel getSharedInstance] getAppSessionInterval];//120;// default value, in seconds
    _USER_ENGAGED_TIME_THRESHOLD = 10;// default value, in seconds
}

- (NSString *)getDeviceManufacturerDetails {
    return @"Apple";
}

- (NSString *)encodeForURL:(NSString *)url {
    if (url == nil || [url isEqualToString:@""]) {
        return @"";
    }
    NSMutableCharacterSet *charset = [[NSMutableCharacterSet alloc] init];
    [charset addCharactersInRange:NSMakeRange('A', 26)];
    [charset addCharactersInRange:NSMakeRange('a', 26)];
    [charset addCharactersInRange:NSMakeRange('0', 10)];
    NSCharacterSet *charset2 = [charset invertedSet];
    url = [[url componentsSeparatedByCharactersInSet:charset2] componentsJoinedByString:@"_"];

    return url;
}

- (NSString *)getAppVersion {
    return @"1.0.0";
}

- (NSString *)getDeviceId {
    return @"abcedef";
}

- (NSString *)getSdkVersionAsInt {
    return @"isitneeded";
}

- (NSString *)getDeviceModel {
    return @"iphone6";
}

- (NSString *)getAndroidID {
    return @"whatandoridid";
}

@end
