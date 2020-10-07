//
//  BiConstants.h
//  ArVideoDemo
//
//  Created by Faizan on 12/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#ifndef BiConstants_h
#define BiConstants_h

static NSString *const BLITZ_EVENT_NAME_TAG = @"eventName";
static NSString *const EXCEPTION_NAME = @"exceptionName";
static NSString *const EXCEPTION_REASON = @"exceptionReason";

static NSString *const FILE_NAME_TAG = @"filename";

static NSString *const BI_JSON_DATA_ERROR = @"bi_json_data_error";
static NSString *const BI_SERVER_ERROR = @"bi_server_error";
static NSString *const BI_ARCHIVE_DATA_FAILURE = @"bi_archive_data_failure";
static NSString *const BI_ARCHIVE_DATA_EXCEPTION = @"bi_archive_data_exception";
static NSString *const BI_UNARCHIVE_DATA_ERROR = @"bi_unarchive_data_error";
static NSString *const BI_EXCLUDING_FROM_BACKUP_ERROR = @"bi_excluding_from_backup_error";
static NSString *const BI_FILE_NOT_EXISTS_ERROR = @"bi_file_not_exists_error";
static NSString *const BI_FILE_REMOVAL_FAILURE = @"bi_file_removal_failure";

static NSString *const BAD_EVENTS_NAMES = @"bad_events_names";
static NSString *const BAD_EVENTS_COUNT = @"bad_events_count";

//Crashlytics error custom codes
static NSInteger const BI_JSON_DATA_ERROR_CODE = 10001;
static NSInteger const BI_SERVER_ERROR_CODE = 10002;
static NSInteger const BI_ARCHIVE_DATA_FAILURE_CODE = 10003;
static NSInteger const BI_ARCHIVE_DATA_EXCEPTION_CODE = 10004;
static NSInteger const BI_EXCLUDING_FROM_BACKUP_ERROR_CODE = 10005;
static NSInteger const BI_FILE_NOT_EXISTS_ERROR_CODE = 10006;
static NSInteger const BI_UNARCHIVE_DATA_ERROR_CODE = 10007;
static NSInteger const BI_FILE_REMOVAL_FAILURE_CODE = 10008;

#endif /* BiConstants_h */
