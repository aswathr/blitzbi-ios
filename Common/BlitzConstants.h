//
//  BlitzConstants.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#ifndef CommonConstant_h
#define CommonConstant_h


#import <UIKit/UIKit.h>

static NSString * _Nonnull const BLITZ_CACHE_PREFIX_MACRO = @"cache_prefix_";
static NSString * _Nonnull const BLITZ_P_D1_C1 = @"NuW9";
static NSString * _Nonnull const BLITZ_P_D2_C1 = @"6N";
static NSString * _Nonnull const BLITZ_K_PARSER_D1_C2= @"cG5C";
static NSString * _Nonnull const BLITZ_K_PARSER_D2_C2= @"uz";
static NSString * _Nonnull const BLITZ_K_P_DETAILS1_C3= @"dd7c";
static NSString * _Nonnull const BLITZ_K_P_DETAILS2_C3= @"rf";
static NSString * _Nonnull const BLITZ_K_P_D1_CHUNK4= @"lBlg";
static NSString * _Nonnull const BLITZ_K_P_D2_CHUNK4= @"tr";
static NSString * _Nonnull const BLITZ_USER_DEFAULTS_APPENDER = @",";
static NSString * _Nonnull const BLITZ_DEVICE_ID_KEY  = @"BLITZ_DEVICE_ID_KEY";
static NSString * _Nonnull const BLITZ_PARTNER_DEVICE_ID_KEY  = @"BLITZ_PARTNER_DEVICE_ID_KEY";
static NSString * _Nonnull const BLITZ_COMMON_PARAM_KEY  = @"BLITZ_COMMON_PARAM_KEY";
static NSString * _Nonnull const BLITZ_APP_DEVICE_ID_KEY  = @"BLITZ_APP_DEVICE_ID_KEY";
static NSString * _Nonnull const BLITZ_BLITZ_USER_ID_KEY  = @"BLITZ_BLITZ_USER_ID_KEY";
static NSString * _Nonnull const BLITZ_EVENT_NAME_TAG = @"eventName";

static NSString * _Nonnull const BLITZ_POST_METHOD = @"POST";
static NSString * _Nonnull const BLITZ_GET_METHOD = @"GET";

static NSString * _Nonnull const BLITZ_FORBIDDED_ERROR_CODE = @"403";

static NSInteger const BLITZ_DOWN_TIME_STATUS_CODE = 459;
static NSInteger const BLITZ_MAX_RETRY = 2;
static NSInteger const BLITZ_DELAY_PER_RETRY = NSEC_PER_SEC;

static NSString * _Nonnull const BLITZ_KEY_CACHED_BOOT_TIME = @"com.blitz.bi.time.cached_boot_time";
static NSString * _Nonnull const BLITZ_KEY_CACHED_DEVICE_UPTIME = @"com.blitz.bi.time.cached_device_uptime";
static NSString * _Nonnull const BLITZ_KEY_CACHED_SNTP_TIME = @"com.blitz.bi.time.cached_sntp_time";

// Blitz Time Constants
static NSString * _Nonnull const BLITZ_NTP_HOST = @"time.google.com";

static NSInteger const BLITZ_ROOT_DELAY_MAX = 100;
static NSInteger const BLITZ_ROOT_DISPERSION_MAX = 100;
static NSInteger const BLITZ_SERVER_RESPONSE_DELAY_MAX = 750;
static NSInteger const BLITZ_UDP_SOCKET_TIMEOUT_IN_MILLIS = 30000;

// Default constants
static NSString * _Nonnull const BLITZ_DEFAULT_VERSION = @"0.0.0";
static NSString * _Nonnull const BLITZ_DEFAULT_TIMEZONE = @"tz";
static NSString * _Nonnull const BLITZ_DEFAULT_IDFA = @"";
static NSString * _Nonnull const BLITZ_DEFAULT_IDFV = @"";
static NSString * _Nonnull const BLITZ_DEFAULT_CONN_DETAILS = @"unknown";
static NSString * _Nonnull const BLITZ_DEFAULT_CARRIER_NAME = @"unknown";
static NSString * _Nonnull const BLITZ_DEFAULT_AD_TRACKING_ENABLED = @"false";
static NSString * _Nonnull const BLITZ_DEFAULT_APP_TRACKING_ENABLED = @"false";
static NSString * _Nonnull const BLITZ_DEFAULT_DEVICE_NAME = @"";
static NSString * _Nonnull const BLITZ_DEFAULT_DEVICE_VERSION = @"";
static NSString * _Nonnull const BLITZ_DEFAULT_NETWORK_VERSION= @"";
static NSString * _Nonnull const BLITZ_DEFAULT_DARWIN_VERSION= @"";
static NSString * _Nonnull const BLITZ_DEFAULT_APP_NAME_AND_VERSION= @"BlitzBi/0.0.0";
static NSString * _Nonnull const BLITZ_DEFAULT_USER_AGENT     = @"BlitzBi/0.0.0";
static NSNumber * _Nonnull const BLITZ_DEFAULT_OSID = 0;
#endif
