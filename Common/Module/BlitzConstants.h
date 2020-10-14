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

static NSString * _Nonnull const CACHE_PREFIX_MACRO = @"cache_prefix_";
static NSString * _Nonnull const BLITZ_P_D1_C1 = @"NuW9";
static NSString * _Nonnull const BLITZ_P_D2_C1 = @"6N";
static NSString * _Nonnull const K_PARSER_D1_C2= @"cG5C";
static NSString * _Nonnull const K_PARSER_D2_C2= @"uz";
static NSString * _Nonnull const K_P_DETAILS1_C3= @"dd7c";
static NSString * _Nonnull const K_P_DETAILS2_C3= @"rf";
static NSString * _Nonnull const K_P_D1_CHUNK4= @"lBlg";
static NSString * _Nonnull const K_P_D2_CHUNK4= @"tr";
static NSString * _Nonnull const USER_DEFAULTS_APPENDER = @",";
static NSString * _Nonnull const BLITZ_DEVICE_ID_KEY  = @"BLITZ_DEVICE_ID_KEY";
static NSString * _Nonnull const SERVER_CALL_SENT_NOTIFICATION = @"SERVER_CALL_SENT_NOTIFICATION";

static NSString * _Nonnull const BLITZ_EVENT_NAME_TAG = @"eventName";
static NSString * _Nonnull const EXCEPTION_NAME = @"exceptionName";
static NSString * _Nonnull const EXCEPTION_REASON = @"exceptionReason";

static NSString * _Nonnull const FILE_NAME_TAG = @"filename";

static NSString * _Nonnull const BI_JSON_DATA_ERROR = @"bi_json_data_error";
static NSString * _Nonnull const BI_SERVER_ERROR = @"bi_server_error";
static NSString * _Nonnull const BI_ARCHIVE_DATA_FAILURE = @"bi_archive_data_failure";
static NSString * _Nonnull const BI_ARCHIVE_DATA_EXCEPTION = @"bi_archive_data_exception";
static NSString * _Nonnull const BI_UNARCHIVE_DATA_ERROR = @"bi_unarchive_data_error";
static NSString * _Nonnull const BI_EXCLUDING_FROM_BACKUP_ERROR = @"bi_excluding_from_backup_error";
static NSString * _Nonnull const BI_FILE_NOT_EXISTS_ERROR = @"bi_file_not_exists_error";
static NSString * _Nonnull const BI_FILE_REMOVAL_FAILURE = @"bi_file_removal_failure";

static NSString * _Nonnull const BAD_EVENTS_NAMES = @"bad_events_names";
static NSString * _Nonnull const BAD_EVENTS_COUNT = @"bad_events_count";

//Crashlytics error custom codes
static NSInteger const BI_JSON_DATA_ERROR_CODE = 10001;
static NSInteger const BI_SERVER_ERROR_CODE = 10002;
static NSInteger const BI_ARCHIVE_DATA_FAILURE_CODE = 10003;
static NSInteger const BI_ARCHIVE_DATA_EXCEPTION_CODE = 10004;
static NSInteger const BI_EXCLUDING_FROM_BACKUP_ERROR_CODE = 10005;
static NSInteger const BI_FILE_NOT_EXISTS_ERROR_CODE = 10006;
static NSInteger const BI_UNARCHIVE_DATA_ERROR_CODE = 10007;
static NSInteger const BI_FILE_REMOVAL_FAILURE_CODE = 10008;

static NSInteger const BLITZ_DOWN_TIME_STATUS_CODE = 459;
#endif /* CommonConstant_h */
