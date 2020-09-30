//
//  BiConfig.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GAME_CLOSE_MODE) {
    GAME_CLOSE_MODE_PAUSE = 0,
    GAME_CLOSE_MODE_EXIT,
    GAME_CLOSE_MODE_CRASH
};

GAME_CLOSE_MODE GAME_CLOSE_MODE_ValueOf(NSString *text);
NSString *GAME_CLOSE_MODE_Description(GAME_CLOSE_MODE value);

@interface BiConfig : NSObject

+ (void)initialize;
- (void)initImmediateWithEnv:(NSString *)env;
- (void)initImmediateAfterDiff:(BOOL)isFirstLaunch;

// General Stuff..
@property (nonatomic, strong) NSString *BASE_URL;
@property (nonatomic, strong) NSString *EVENTS_SERVER_URL;
@property (nonatomic, strong) NSString *BI_EVENTS_SERVER_DIRECT_URL;
@property (nonatomic, strong) NSString *BUILD_ENV;
@property (nonatomic, strong) NSString *KIWI_DEVICE_ID;

// BI Related Data...
@property (nonatomic, strong) NSString *PAYER_FLAG;

@property (nonatomic, strong) NSString *APP_ID;
@property (nonatomic, strong) NSString *APP_VERSION;
@property (nonatomic, strong) NSString *PLATFORM_CODE;
@property (nonatomic, strong) NSString *LOCALE_CODE;
@property (nonatomic, strong) NSString *COUNTRY_CODE;
@property (nonatomic, strong) NSString *OS_ID;
@property (nonatomic, strong) NSString *CONN_DETAILS;
@property (nonatomic, strong) NSString *MANUFACTURER;
@property (nonatomic, strong) NSString *DEVICE_MODEL;
@property (nonatomic, strong) NSString *CARRIER_NAME;
@property (nonatomic, strong) NSString *IFV;
@property (nonatomic, strong) NSString *IFA;
@property (nonatomic, assign) BOOL IS_IFA_ENABLED;

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
