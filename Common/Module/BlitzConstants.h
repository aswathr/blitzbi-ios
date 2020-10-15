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

#define TICK(XXX) NSDate * XXX = [NSDate date]
#define TOCK(XXX)                                                             \
NSLog(@"[MethodTime] <%@>  %s: %f",                                       \
[[NSString stringWithUTF8String:__FILE__] lastPathComponent], #XXX, \
-[XXX timeIntervalSinceNow])
#define USERIDASSTRING \
[[[UserService sharedInstance] retrieveUser] getUserIdAsString]
#define SPAM_CONTACT_LIST [NSArray arrayWithObjects:@"spam", @"identified as spam", @"identified by eyecon", @"", nil]

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
static NSString * _Nonnull const BLITZ_SERVER_CALL_SENT_NOTIFICATION = @"SERVER_CALL_SENT_NOTIFICATION";
static NSString * _Nonnull const BLITZ_EVENT_NAME_TAG = @"eventName";

static NSString * _Nonnull const BLITZ_POST_METHOD = @"POST";
static NSString * _Nonnull const BLITZ_GET_METHOD = @"GET";

static NSString * _Nonnull const BLITZ_FORBIDDED_ERROR_CODE = @"403";

static NSInteger const BLITZ_DOWN_TIME_STATUS_CODE = 459;
static NSInteger const BLITZ_MAX_RETRY = 2;
static NSInteger const BLITZ_DELAY_PER_RETRY = NSEC_PER_SEC;

#endif
