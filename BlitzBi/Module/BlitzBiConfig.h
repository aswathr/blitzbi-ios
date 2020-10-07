//
//  BiConfig.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzBiConfig : NSObject

+ (void)initialize;
- (void)initImmediateWithEnv:(NSString *)env;
- (void)initImmediateAfterDiff:(BOOL)isFirstLaunch;

// General Stuff..
@property (nonatomic, strong) NSString *BASE_URL;
@property (nonatomic, strong) NSString *BUILD_ENV;
@property (nonatomic, strong) NSString *KIWI_DEVICE_ID;

// BI Related Data...
@property (nonatomic, assign) BOOL INIT_COMPLETE;
@property (nonatomic, assign) BOOL IS_FIRST_TIME_LAUNCH;

@property (nonatomic, strong) NSString *SERVER_REQUEST_LOGGING;
@property (nonatomic, strong) NSString *LOG_FILE_PATH;
@property (nonatomic, strong) NSString *EXTERNAL_STORAGE_PATH;
@property (nonatomic, assign) NSUInteger SESSION_EXPIRE_THRESHOLD;
@property (nonatomic, assign) NSUInteger USER_ENGAGED_TIME_THRESHOLD;

// BI Related Methods..Need to be Moved to some other Class
- (NSString *)getDeviceManufacturerDetails;
- (NSString *)encodeForURL:(NSString *)url;
- (NSString *)getAppVersion;
- (NSString *)getDeviceId;
- (NSString *)getSdkVersionAsInt;
- (NSString *)getDeviceModel;
- (NSString *)getAndroidID;
@end
