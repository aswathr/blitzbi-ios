//
//  BiConfig.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzBiConfig.h"
//#import "DeviceUtils.h"

#define UNKNOWN_MACRO @"unknown"
#define ORGANIC_MACRO @"organic"
#define UNIDENTIFIED_MACRO @"unidentified"

@implementation BlitzBiConfig

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

static NSString *TAG = @"BiConfig_Class";

- (void)initImmediateWithEnv:(NSString *)env {
    _BUILD_ENV = env;
    _EXTERNAL_STORAGE_PATH = @"/mnt/storage";// Dummy
    _LOG_FILE_PATH = @"/mnt/storage";// Dummy

    _SESSION_EXPIRE_THRESHOLD = 120;// default value, in seconds
    _USER_ENGAGED_TIME_THRESHOLD = 10;// default value, in seconds
}

- (void)initImmediateAfterDiff:(BOOL)isFirstLaunch {
    _IS_FIRST_TIME_LAUNCH = isFirstLaunch;
    _INIT_COMPLETE = true;
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
