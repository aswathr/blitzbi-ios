//
//  NetworkConstant.h
//  Networking
//
//  Created by Saurabh on 29/08/20.
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

static NSString *const C_DEBUG_LOG_STRING = @"LP-Optimization";

typedef void (^BasicBlock)(void) DEPRECATED_ATTRIBUTE;//use dispatch_block_t instead
typedef void (^BasicBlockWithBool)(BOOL);
typedef void (^BasicBlockWithString)(NSString *str);
typedef void (^PickerSelectionBlock)(NSInteger);
typedef void (^ImageFetchingBlock)(UIImage *image);
typedef void (^TableCellBlock)(UITableViewCell *cell);

typedef void (^TapHandlerBlock)(UIView *view);
typedef void (^TimerCallback)(NSInteger);

typedef void (^HttpSuccessCallback)(NSObject *_Nullable data);
typedef void (^HttpFailureCallback)(NSError *_Nullable error, NSString *extraInfo);

static unsigned short const USER_ACTIVE_CALL_TIMER = 12;

static NSString *const CACHE_PREFIX_MACRO = @"cache_prefix_";

static NSString *const IS_ADMIN_MODE_DISABLED = @"isAdminModeDisabled";

static NSString *const HASH_KEY = @"hashKey";
static NSString *const JWT = @"jwt";

static NSString *const KIWI_DEVICE_ID_KEY = @"kiwiDeviceId";

////Will Add up these details
static NSString *const KIWI_P_D1_C1 = @"NuW9";
static NSString *const KIWI_P_D2_C1 = @"6N";
static NSString *const K_PARSER_D1_C2= @"cG5C";
static NSString *const K_PARSER_D2_C2= @"uz";
static NSString *const K_P_DETAILS1_C3= @"dd7c";
static NSString *const K_P_DETAILS2_C3= @"rf";
static NSString *const K_P_D1_CHUNK4= @"lBlg";
static NSString *const K_P_D2_CHUNK4= @"tr";

static NSString *const USER_DEFAULTS_APPENDER = @",";

static NSInteger const KIWI_DOWN_TIME_STATUS_CODE = 459;

static NSString *const SERVER_CALL_SENT_NOTIFICATION = @"SERVER_CALL_SENT_NOTIFICATION";

#endif /* CommonConstant_h */
