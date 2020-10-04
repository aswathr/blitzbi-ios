//
//  NetworkConstant.h
//  Networking
//
//  Created by Saurabh on 29/08/20.
//

#ifndef CommonConstant_h
#define CommonConstant_h


//#import "FacebookEducationExperienceModel.h"
//#import "FacebookPageModel.h"
//#import "GameType.h"
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
//typedef void (^FetchFbUserEducationInfoBlock)(NSArray<FacebookEducationExperienceModel *> *pages);
//typedef void (^FetchFbPageInfoBlock)(FacebookPageModel *page);
typedef void (^TapHandlerBlock)(UIView *view);
typedef void (^TimerCallback)(NSInteger);

typedef void (^HttpSuccessCallback)(NSObject *_Nullable data);
typedef void (^HttpFailureCallback)(NSError *_Nullable error, NSString *extraInfo);

static unsigned short const USER_ACTIVE_CALL_TIMER = 12;
//
//static NSString *const RESET_USER_ON_LOGIN_KEY = @"reset_user_on_login";
//static NSString *const VERIFY_OTP_KEY = @"verify_with_otp";
//static NSString *const SKIPPED_OTP_KEY = @"skipped_otp";
//static NSString *const PHONE_TO_SKIP_OTP = @"phone_to_skip_otp";
//
//#pragma mark game related constants
//static NSString *const TRIVIA_SEEN_CONTENT_KEY = @"trivia_seen_content";
//static NSString *const POP_TRIVIA_SEEN_CONTENT_KEY = @"poptrivia_seen_content";
//static NSString *const HEADSHOT_SEEN_CONTENT_KEY = @"headshot_seen_content";
//static NSString *const FAMILY_FEUD_SEEN_CONTENT_KEY =
//    @"familyfeud_seen_content";
//
//static NSString *const IS_TOKBOX_CLIENT = @"is_tokbox_client";
//static unsigned short const CONGRATULATION_VIEW_TIME = 2;
//static NSString *const USER_KEY = @"user_key";
//static NSString *const USER_NAME_TAG = @"userName";
//static NSString *const USER_NAME_REPLACE_TAG = @"[username]";
//static NSString *const USER_ID_TAG = @"userId";
//static NSString *const APP_EVENT = @"appEvent";
//static NSString *const APP_EVENT_NOTIFICATION = @"APP_EVENT_NOTIFICATION";
static NSString *const SERVER_CALL_SENT_NOTIFICATION = @"SERVER_CALL_SENT_NOTIFICATION";
//static NSString *const TOKBOX_FPS_NETWORK_NOTIFICATION =
//    @"TOKBOX_FPS_NETWORK_NOTIFICATION";
//static NSString *const REMOVED_USERS_KEY = @"removedUsers";
//static NSString *const SEEN_FILTER_IDS = @"seenFilterIds";
//static NSString *const INVITE_BFF_POPUP_INVITE_SUCCESS_KEY =
//    @"invite_bff_popup_invite_success";
//static NSString *const INVITE_BFF_POPUP_LAST_SHOWN_KEY =
//    @"invite_bff_popup_last_shown";
//
//#pragma StoryBoard constants
//static NSString *const SCREENSHOT_VC_IDENTIFIER =
//    @"screenshotPopupViewController";
//static NSString *const INVITE_VC_IDENTIFIER = @"inviteViewController";
//static NSString *const LOADER_VC_IDENTIFIER = @"loaderViewController";
//
//#pragma Tokbox Constants
//static unsigned short const MAX_NUMBER_OF_PARTICIPANTS = 8;
//
//static unsigned short const TABOO_WORD_ALERT_OVERLAY_TIMER_DURATION = 3;
//
//#pragma Launchpad UI
//
//static NSString *const USER_GROUP_STATE_GROUP = @"GROUP";
//static NSString *const USER_GROUP_STATE_GAME = @"GAME";
//static NSString *const USER_GROUP_STATE_ALONE = @"ALONE";
//static NSString *const USER_GROUP_STATE_FULLROOM = @"FULL_ROOM";
//static NSString *const USER_GROUP_STATE_LOCKED = @"LOCKED";
//static NSString *const USER_GROUP_STATE_GLOBAL = @"GLOBAL";
//// static NSString * const AUX_STRING_STATUS_ALONE[] = { @" wants to catch up.
//// Say hi!" , @" is home alone and needs a friend. Say hi!", @" is feeling
//// bored. Say hi!" };
//static NSString *const AUX_STRING_STATUS_ALONE[] = {
//    @"%@ needs a friend "
//};
//static NSString *const AUX_STRING_STATUS_ALONE_ONLINE = @"%@ seems bored...";
//static NSString *const LAST_ACTIVE_STRING_STATUS_ALONE =
//    @" was on Joyride few hours ago";
//static NSString *const LAST_CHAT_STRING_STATUS_ALONE =
//    @"It's been long since you talked to ";
//static NSString *const AUX_STRING_STATUS_INGROUP[] = {
//    @"%@ and %ld friend are laughing their 🍑's off"
//};
//static NSString *const AUX_STRING_MULTI_STATUS_INGROUP[] = {
//    @"%@ and %ld friends are laughing their 🍑's off"
//};
//static NSString *const FULL_GROUP_STATUS[] = {
//    @"Looks like it's a full house for %@ and %ld friends"
//};
//
//static NSString *const AUX_STRING_STATUS_ONE_ON_ONE[] = {
//    @"You and %@ are laughing your 🍑s off"
//};
//
//static NSString *const AUX_STRING_STATUS_INGAME[] = {
//    @" are crushing it in Joyride. Join in!",
//    @" are enjoying the Joyride challenge. Say hi!"
//};
//static NSString *const AUX_STRING_STATUS_INVITE[] = {
//    @" Needs an invite!"
//};// {@" needs an invite! Also friends with "};
//static NSString *const INVITE_LABEL_TEXT = @"INVITE";
//static NSString *const FIND_LABEL_TEXT = @"FIND";
//static NSString *const JOIN_LABEL_TEXT_GROUP = @"JOIN";
//static NSString *const PARTY_LABEL_TEXT = @"PARTY";
//static NSString *const JOIN_LABEL_TEXT_FULLROOM = @"FULL ROOM";
//static NSString *const JOIN_LABEL_TEXT_ALONE = @"SAY HI";
//static NSString *const JOIN_LABEL_TEXT_POKED = @"SENT!";
//static NSString *const LEAVE_LABEL_TEXT_SELFGROUP = @"LEAVE";
//static NSString *const INVITED_LABEL_TEXT = @"INVITED!";
//static NSString *const PARTY_BANNER_TEXT =
//    @"PARTY ROOM! \n New friends are waiting!";
//
//static NSString *const FACEBOOK = @"facebook";
//static NSString *const LAUNCHPAD_DIRECT_FB_APP = @"launchpad_direct_fb_app";
//static NSString *const FRIEND_CENTER_FB_APP = @"friend_center_fb_app";
//
//static NSInteger const LAUCHPAD_FONT_SIZE = 14;
//static NSString *const PARTY_ROOM_SECTION_HEADER = @"TAP TO JOIN A PARTY 🎈";
//static NSString *const FRIENDS_SECTION_HEADER = @"TAP TO JOIN YOUR FRIENDS 👯";
//static NSString *const OFFLINE_FRIENDS_SECTION_HEADER =
//    @"TAP TO GRAB YOUR FRIENDS ✌️";
//static NSString *const NO_INAPP_FRIENDS_SECTION_HEADER =
//    @"ADD FRIENDS AND START CHATTING!🤝";
//static NSString *const NO_FRIENDS_SECTION_HEADER =
//    @"Looks like they're not on Joyride 😱";
//static NSString *const INVITE_SECTION_HEADER =
//    @"Tap to get your friends in the loop <U+1F60A>";
//static NSString *const GENERIC_DISPLAY_PIC_FILE = @"dp-gn@1x.png";
//static NSString *const JOIN_BUTTON_ICON = @"ico-01@1x.png";
//static NSString *const POKE_BUTTON_ICON = @"ico-02@1x.png";
//static NSString *const OFFLINE_TOAST_MESSAGE = @"Hi Sent!✌️";
//static NSString *const ALREADY_SENT_HI_TOAST_MESSAGE =
//    @"Have already sent Hi!👍";
//static NSString *const FULL_ROOM_TOAST_MESSAGE =
//    @"Room is already full ! Sending Hi to all friends in the room!✌️";
//static NSString *const INVITE_TOAST_MESSAGE = @"Invite Sent!";
//static NSString *const LAUNCHPAD_POKE_EMOJI = @"✌️";
//static NSString *const LAUNCHPAD_POKED_EMOJI = @"👍";
//static NSString *const LAUNCHPAD_JOIN_EMOJI = @"👯";
//static NSString *const LAUNCHPAD_IN_ROOM_EMOJI = @"🎉";
//static NSString *const LAUNCHPAD_FULL_ROOM_EMOJI = @"✌️";
//static NSString *const LAUNCHPAD_IN_GAME_EMOJI = @"🎭";
//
//static NSString *const LAUNCHPAD_SAME_ROOM = @"You are already in the room!";
//static NSString *const LOCKED_ROOM_TOAST_MESSAGE = @"Hi sent ✌️";
//
//static NSString *const MANUAL_INCREASE_IN_FRIENDS_COUNT =
//    @"MANUAL_INCREASE_IN_FRIENDS_COUNT";
//static NSString *const COUNT_OF_SYS_RATING_POPUP_SHOWN =
//    @"COUNT_OF_SYS_RATING_POPUP_SHOWN";
//static NSString *const COUNT_OF_NPS_RATING_POPUP_SHOWN =
//    @"COUNT_OF_NPS_RATING_POPUP_SHOWN";
//static NSString *const TIME_STAMP_DURING_NPS_RATING_POPUP_SHOWN =
//    @"TIME_STAMP_DURING_NPS_RATING_POPUP_SHOWN";
//static NSString *const IS_ELIGIBLE_FOR_SYS_RATING_PROMPT =
//    @"IS_ELIGIBLE_FOR_SYS_RATING_PROMPT";
//static NSString *const TIME_STAMP_DURING_NPS_GOOD_RATING =
//    @"TIME_STAMP_DURING_NPS_GOOD_RATING";
//static NSString
//*const TIME_STAMP_DURING_CONTINUOUS_DAILY_APP_SESSION_COUNT_UPDATE =
//    @"TIME_STAMP_DURING_CONTINUOUS_DAILY_APP_SESSION_COUNT_UPDATE";
//static NSString *const CONTINUOUS_DAILY_APP_SESSION_COUNT =
//    @"CONTINUOUS_DAILY_APP_SESSION_COUNT";
//static NSString *const CONTINUOUS_GAME_WIN_COUNT = @"CONTINUOUS_GAME_WIN_COUNT";
//static NSString *const MYSELF_GAME_SHOW_CASH_WON = @"MYSELF_GAME_SHOW_CASH_WON";
//static NSString *const MYSELF_REQUESTED_CASH_OUT = @"MYSELF_REQUESTED_CASH_OUT";
//static NSString *const LAST_CONTINUOUS_GAME_WON = @"LAST_CONTINUOUS_GAME_WON";
//static NSString *const SESSION_NUMBER_DURING_NPS_GOOD_RATING =
//    @"SESSION_NUMBER_DURING_NPS_GOOD_RATING";
//static NSString *const APP_VERSION_DURING_NPS_GOOD_RATING =
//    @"APP_VERSION_DURING_NPS_GOOD_RATING";
//
//// TODO: MOVE LP CONSTANTS IN DIFFERENT FILE
//static NSString *const LP_BANNER_TYPE_2_TITLE = @"See who you know on Joyride!";
//static NSString *const LP_BANNER_TYPE_5_TITLE =
//    @"Having fun?\nGive us a rating and let us know!";
//static NSString *const LP_BANNER_TYPE_6_TITLE =
//    @"How about giving us some feedback 📝";
//static NSString *const LP_BANNER_TYPE_7_TITLE =
//    @"How about showing us some love\non the App Store 🙏";
//static NSString *const LP_BANNER_TYPE_8_TITLE =
//    @"Are you still enjoying Joyride?";
//static NSString *const LP_BANNER_TYPE_2_BUTTON_TEXT = @"ADD FRIENDS";
//static NSString *const LP_BANNER_TYPE_5_BUTTON_TEXT = @"Not really";
//static NSString *const LP_BANNER_TYPE_6_BUTTON_TEXT = @"Yes!";
//static NSString *const LP_BANNER_TYPE_7_BUTTON_TEXT = @"NOT NOW";
//static NSString *const LP_BANNER_TYPE_8_BUTTON_TEXT = @"SURE";
//static NSString *const LP_BANNER_TYPE_1_TITLE =
//    @"Wanna know when a friend says hi?";
//static NSString *const LP_BANNER_TYPE_1_BUTTON_TEXT = @"YES";
//static NSString *const LP_BANNER_TYPE_0_TITLE =
//    @"Jump in a Party Room to make new friends 🎈";
//static NSString *const LP_BANNER_TYPE_0_BUTTON_TEXT = @"JOIN A PARTY ROOM";
//static NSString *const LP_BANNER_TYPE_3_TITLE =
//    @"Bring your friends in on the fun 👯";
//static NSString *const LP_BANNER_TYPE_3_BUTTON_TEXT = @"ADD FRIENDS";
//static NSString *const LP_BANNER_TYPE_4_TITLE = @"See who you know on Joyride!";
//static NSString *const LP_BANNER_TYPE_4_BUTTON_TEXT = @"FIND FRIENDS";
//static NSString *const INVITE_SENT_KEY = @"isInviteSent";
//static NSString *const INVITE_BANNER_TEXT_LABEL_FB =
//    @"Add friends from Facebook";
//static NSString *const INVITE_BANNER_TEXT_LABEL_CONTACTS =
//    @"Add friends from your contacts";
//
//static NSString *const LAST_SHOWN_NOTIFICATION_ALERT =
//    @"LAST_SHOWN_NOTIFICATION_ALERT";
//static float const LAUCHPAD_SWIPE_UTITLITY_BTN_WIDTH = 60.0f;
//static NSString *const CLUE_CARD_GIVER_CAPTION_1 =
//    @"Help <FRIENDNAME> say the secret word.  In case we miss it, just...";
//static NSString *const CLUE_CARD_GIVER_CAPTION_3 =
//    @"If you ever get stuck, after 5 seconds you can skip the Clue Word...";
//
//static NSString *const CLUE_CARD_WATCHER_CAPTION_1 =
//    @"See how many words <FRIENDNAME1> can guess from <FRIENDNAME2>'s clues.  "
//    @"Pay attention, you’re up next 😝";
//static NSString *const CLUE_CARD_GIVER_CAPTION_2 =
//    @"🤓 REMEMBER, <FRIENDNAME> DOESN'T SEE THE CLUE!";
//static NSString *const CLUE_CARD_GUSSER_CAPTION_1 =
//    @"Try and guess the words from <FRIENDNAME>'s clues. See how many you can "
//    @"get 😉";
//static NSString *const CLUE_CARD_GUESSER_CAPTION_2 =
//    @"🤓 REMEMBER, <FRIENDNAME> CAN'T USE CERTAIN WORDS!";
//static NSString *const FRIENDNAME = @"<FRIENDNAME>";
//static NSString *const FRIENDNAME1 = @"<FRIENDNAME1>";
//static NSString *const FRIENDNAME2 = @"<FRIENDNAME2>";
//static NSString *const GUESSER_SUCCESS_LABEL = @"🤓 YAY YOU DID IT! 💪";
//static NSString *const GUESSER_PASS_LABEL =
//    @"🤓 IS <FRIENDNAME> REALLY HELPFUL AT ALL? 😂";
//static NSString *const GUESSER_END_GAME_LABEL = @"🤘 YOU DID IT! 🤘";
//static NSString *const CLUE_GIVER_END_GAME_LABEL = @"🤘 YOU DID IT! 🤘";
//static NSString *const WATCHER_END_GAME_LABEL = @"🤘 THEY DID IT! 🤘";
//static NSString *const FORBIDDEN_WORD_SPOKEN =
//    @"😂 OOPS! <FRIENDNAME> SAID A FORBIDDEN WORD!";
//static NSString *const CLUE_GIVER_FIRST_CARD_HINT =
//    @"  Double tap card when they get it!  ";
//
//static NSString *const GUESSER = @"GUESSER";
//static NSString *const CLUEGIVER = @"CLUE GIVER";
//static NSString *const CLUEGIVER_SUCCESS_LABEL = @"🤘 YOU GOT IT! 🤘";
//static NSString *const WATCHER_SUCCESS_LABEL = @"🤘 THEY GOT IT! 🤘";
//
//static NSString *const CARD_DEFAULT_COLOR = @"734EB9";
//static NSString *const CARD_DEFAULT_GREY_COLOR = @"696969";
//static NSString *const CARD_SUCCESS_COLOR = @"00D921";
//static NSString *const CARD_FAILURE_COLOR = @"F24214";
//static NSString *const CARD_BG_GREY_COLOR = @"29232D";
//
//static NSString *const DELIMITER = @"|::|";
//static NSString *const LAUNCHPAD_BLOCK_USER_SUCCESS = @"User will be blocked!";
//static NSString *const LAUNCHPAD_REMOVE_USER_SUCCESS = @"User will be removed!";
//static NSString *const LAUNCHPAD_UNFRIEND_USER_SUCCESS =
//    @"User will be unfriended!";
//static NSString *const LAUNCHPAD_BLOCK_USER_FAIL =
//    @"Usergroup can't be blocked!";
//static NSString *const LAUNCHPAD_UNFRIEND_USER_FAIL =
//    @"Usergroup can't be unfriended!";
//static NSString *const BLOCK_BUTTON_TITLE = @"BLOCK";
//static NSString *const BLOCK_BUTTON_TITLE_CAMEL_CASE = @"Block";
//static NSString *const BLOCK_ALERT_CONTROLLER_HEADER = @"Block?";
//static NSString *const REMOVE_ALERT_CONTROLLER_HEADER = @"Remove Contact?";
//static NSString *const BLOCK_ALERT_CONTROLLER_MSG =
//    @"Would you like to block this person?";
//static NSString *const REMOVE_ALERT_CONTROLLER_MSG =
//    @"Would you like to remove this contact from your list?";
//static NSString *const LP_INVITE_FRIENDS_BUTTON_TITLE = @"+ ADD FRIENDS";
//static NSString *const LP_OFFLINE_STATE_TEXT = @"Last seen 2h ago";
//static NSString *const LP_ONLINE_STATE_TEXT = @"seems bored";
//
//static NSString *const LP_INVITE_BUTTON_TITLE = @"ADD";
//static NSString *const LP_INVITE_EMOJI = @"🎁";
//static NSString *const LP_SEARCH_EMOJI = @"🔎";
//static NSString *const LP_NO_INAPP_CONTACTS_LABEL_TEXT =
//    @"Add friends and start chatting!";
//static NSString *const LP_BALOON_EMOJI = @"🎈";
//static NSString *const PEOPLE_PICKER_TITLE = @"Pick friends to invite";
//static NSString *const LP_LOCK_STATE_TEXT = @"Busy in a private room";
//static NSString *const LP_LOCK_EMOJI = @"🔒";
//static NSString *const LP_LOCK_SINGLE_EMOJI = @"🙏";
//
//#pragma Assets Download - Server Side
//static NSString *const CDN_BASE_URL =
//    @"https://dmr9skuvnb8pi.cloudfront.net/content/";
//static NSString *const CDN_DEFAULT_PROFILE_GIF_URL = @"https://dmr9skuvnb8pi.cloudfront.net/userdata/prod2/profile_gifs/DP-0.gif";
//
//#pragma Speech Benchmarking
//static NSString *const SPEECH_BENCHMARKING_WORDLIST =
//    @"https://s3.amazonaws.com/kiwi-faceoff/content/"
//    @"SpeechRecognitionBenchmarkWordList.csv";
//static NSString *const SPEECH_BENCHMARKING_CSVNAME =
//    @"SpeechRecognitionBenchmarkWordList.csv";
//static NSString *const BOT_TABOO_WORD_MESSAGE = @"  %@  ";
//static NSString *const BOT_TARGET_WORD_MESSAGE = @"  YAY!  ";
//static NSString *const TARGET_WORD_ID = @"targetWordId";
//static NSString *const GAME_TIME_REMAINING = @"gameTimeRemaining";
//
//static NSString *const CLUE_GUESSER_DEFAULT_MESSAGE = @"Can you guess? 😜";
//static NSString *const CLUE_GUESSER_SUCCESS_MESSAGE = @"Great!";
//
//#pragma Client Side
//static NSString *const CONTENT_VERSION_KEY_PREFIX = @"contentVersion";
//static NSString *const AVAILABLE_FILTERS_KEY = @"availableFilters";
//
//static NSString *const USER_FILTERS_KEY = @"userFilters";
//static NSString *const USER_FILTERS_TIMESTAMP_KEY = @"userFiltersTimestamp";
//static NSString *const USER_FILTERS_SLOT_SIZE_KEY = @"userFiltersSlotSize";
//
//static NSString *const TIME_GAP_SUFFIX = @"min_gap";
//static NSString *const FILTER_SCREENSHOT_SHOWN = @"filter_screenshot_shown";
//static NSString *const VIMOJI_SCREENSHOT_SHOWN = @"vimoji_screenshot_shown";
//static NSString *const FRIEND_COUNT_SUFFIX = @"max_friends";
//static NSString *const INVITE_SENT_DIRECT_DETAILS =
//    @"invite_sent_direct_details";
//static NSString *const THUMBNAILS_DIRECTORY_NAME = @"thumbnails";
//
//static NSInteger const NUM_FRIENDS_TO_INVITE = 10;
//static NSInteger const PASS_MATCH_TIME_THRESOLD = 5;
//
//static NSString *const ROOM_TYPE_DEFAULT = @"default";
//static NSString *const ROOM_TYPE_ONLINE = @"onlineUser";
//static NSString *const ROOM_TYPE_OFFLINE = @"offlineUser";
//static NSString *const ROOM_TYPE_FRIEND_IN_ROOM = @"friendInRoom";
//static NSString *const ROOM_TYPE_NOT_IN_APP_CONTACT_USER =
//    @"notInAppContactUser";
//static NSString *const ROOM_TYPE_IN_APP_CONTACT_USER = @"inAppContactUser";
//static NSString *const ROOM_TYPE_GROUP = @"group";
//static NSString *const ROOM_TYPE_FRIENDS_IN_NOT_SUBSCRIBED_GROUP =
//    @"freindsInNotSubscribedGroup";
//static NSString *const ROOM_TYPE_SHOW = @"show";
//
//#pragma notification constants
//static NSString *const PARTYROOM_INAPP_NOTIFICATION_COUNT_PREFIX =
//    @"partyroom_inapp_notification_count";
//static NSString *const EVENT_HI_PREFIX = @"event_hi_";
//static NSString *const EVENT_GROUP_CHAT = @"event_groupchat";
//static NSString *EVENT_ONLINE = @"event_online";
//static NSString *EVENT_SESSION = @"event_session";
//static NSString *const EVENT_ONLINE_MESSAGE_SUFFIX =
//    @" is hanging out. Say hi ✌️";
//static NSString *const EVENT_FIRST_TIME_ONLINE_MESSAGE_SUFFIX =
//    @" joined Joyride! Say hi 🙌✌";
//static NSString *const EVENT_HI_MESSAGE_SUFFIX = @" says hi 🙌✌";
//static NSString *const EVENT_FRIEND_REQUEST_INITIATED_MESSAGE_SUFFIX =
//    @" sent you a friend request!";
//static NSString *const EVENT_FRIEND_REQUEST_ACCEPTED_MESSAGE_SUFFIX =
//    @" accepted your friend request!";
//static NSString *const EVENT_STRANGER_MESSAGE_SUFFIX = @"New kid on the block!";
//static NSString *const EVENT_ENTERED_PARTYROOM_MESSAGE =
//    @"This is an open space. Let's keep it clean 😉";
//static NSString *const EVENT_JOINED_PARTYROOM_MESSAGE =
//    @"You're invited! Come check out this Party Room, the place is popping 🎉🎉🎉";
//static NSString *const EVENT_GROUP_CHAT_MESSAGE_SUFFIX =
//    @" are crushing it together!👯";
//static NSString *const EVENT_SCREENSHOT_MESSAGE_SUFFIX =
//    @" just captured a screenshot!";
//
//static NSString *const PARTY_ROOM_NOBODY_CAN_SEE_YOU =
//    @"👋 Whoa, your 1st Public Room! \nNobody can 🙈 or 🙉 you yet…";
//
//static const long long MIN_TIME_DURATION_GAP_FOR_EVENT_HI = 5 * 60;// seconds
//static const long long MIN_TIME_DURATION_GAP_FOR_EVENT_ONLINE =
//    5 * 60;// seconds
//
//static NSString *const NOTIFICATION_TYPE_REMINDER = @"reminder";
//static NSString *const NOTIFICATION_TYPE_JOINED_GROUP_CHAT = @"JOINED";
//static NSString *const NOTIFICATION_SOUND = @"sound";
//static NSString *const NOTIFICATION_ALERT = @"alert";
//static NSString *const NOTIFICATION_BODY = @"body";
//static NSString *const NOTIFICATION_BADGE = @"badge";
//static NSString *const NOTIFICATION_TYPE = @"type";
//static NSString *const NOTIFICATION_SUB_TYPE = @"subType";
//static NSString *const NOTIFICATION_STATUS = @"status";
//static NSString *const NOTIFICATION_STATE = @"state";
//static NSString *const NOTIFICATION_ID = @"apnsCollapseId";
//static NSString *const NOTIFICATION_MESSAGE = @"notificationMessage";
//static NSString *const NOTIFICATION_IS_SILENT = @"isSilent";
//static NSString *const UNIDENTIFIED_NOTIFICATION = @"unidentifiedNotification";
//static NSString *const NOTIFICATION_APS = @"aps";
//static NSString *const NOTIFICATION_MESSAGE_BODY = @"messageBody";
//static NSString *const APP_STATE = @"appState";
//
//static NSString *const NOTIFICATION_SOUND_NAME = @"Notification_132.wav";
//
//static NSString *const USER_SELF_DATA = @"userSelfData";
//static NSString *const NOTIFICATION_TEXT_FRIEND_REQUEST_INITIATED =
//    @"wants to be friends!";
//static NSString *const NOTIFICATION_TEXT_FRIEND_REQUEST_ACCEPTED =
//    @"accepted your friend request!";
//static NSString *const NOTIFICATION_TEXT_CONTACT_BECAME_FRIEND =
//    @"and you are now friends!";
//
//static NSString *const BI_TEXT_CONTACT_BECAME_FRIEND =
//    @"added contact has been made friend";
//
//#pragma invite flow
//static NSString *const ATTACHED_VIDEO_PLACEHOLDER_NAME = @"Hey.mp4";
//static NSString *const ATTACHED_GIF_PLACEHOLDER_NAME = @"Hey.gif";
//
//// Help email flow
//static NSString *const EMAIL_HELP_SEND_TO = @"help@onjoyride.com";
//static NSString *const EMAIL_HELP_SUBJECT = @"Joyride Help & Feedback";
//static NSString *const EMAIL_HELP_SUBJECT_REPORT_BROADCASTER = @"Joyride Help & Feedback :[%@ Report]";
//static NSString *const EMAIL_WINNINGS_SUBJECT = @"Joyride Winnings";
//static NSString *const EMAIL_WINNINGS_SUBJECT_INDIA = @"Joyride India Winnings";
//static NSString *const EMAIL_EARNINGS_SUBJECT = @"Joyride Earnings";
//static NSString *const EMAIL_EARNINGS_SUBJECT_INDIA = @"Joyride India Earnings";
//static NSString *const EMAIL_FEEDBACK_SUBJECT = @"Joyride Feedback";
//static NSString *const ALERT_HELP_SUCCESS_TITLE = @"Request sent!";
//static NSString *const ALERT_HELP_SUCCESS_MESSAGE =
//    @"We will get back to you shortly... 😃";
//static NSString *const ALERT_HELP_DRAFT_TITLE = @"Request in draft";
//static NSString *const ALERT_HELP_DRAFT_MESSAGE =
//    @"Your request has not been sent yet. Please go back to the draft message "
//    @"in your email app to send it. 😃";
//static NSString *const ALERT_HELP_FAIL_TITLE = @"Help email couldn't be sent!";
//static NSString *const ALERT_HELP_FAIL_MESSAGE = @"Something went wrong 😳";
//static NSString *const ALERT_HELP_NO_ACCOUNT_TITLE = @"No email account found!";
//static NSString *const ALERT_HELP_NO_ACCOUNT_MESSAGE =
//    @"Please add an email account from your device settings: Settings > Passwords & Accounts > Accounts. Please email help@onjoyride.com if you have trouble! 🙂";
//
//// DEBUG MAIL FLOW
//static NSString *const EMAIL_DEBUG_SUBJECT = @"Joyride Session Debug Logs";
//static NSString *const ALERT_DEBUG_SUCCESS_TITLE = @"Debug Logs sent!";
//static NSString *const ALERT_DEBUG_SUCCESS_MESSAGE = @"SENT!";
//static NSString *const ALERT_DEBUG_DRAFT_TITLE = @"Session Debug Logs in draft";
//static NSString *const ALERT_DEBUG_DRAFT_MESSAGE =
//    @"Your request has not been sent yet. Please go back to the draft message "
//    @"in your email app to send it. 😃";
//static NSString *const ALERT_DEBUG_FAIL_TITLE = @"Email couldn't be sent!";
//static NSString *const ALERT_DEBUG_FAIL_MESSAGE = @"Something went wrong 😳";
//static NSString *const ALERT_DEBUG_NO_ACCOUNT_TITLE =
//    @"No email account found!";
//
//// Local cache file name
//static NSString *const CONTACT_CACHE_FILE_PATH = @"contactCacheFilePath.txt";
//static NSString *const FRIEND_NETWORK_CACHE_FILE_PATH = @"friendNetworkCacheFilePath.txt";
//static NSString *const ALL_CONTACTS_DATA = @"allContactsdata.txt";
//static NSString *const PREFIX_MACRO = @"_prefix_";
static NSString *const CACHE_PREFIX_MACRO = @"cache_prefix_";
//static NSString *const DIFF_DATA_CACHE_FILE_PATH = @"diffDataCacheFilePath.txt";
//static NSString *const USER_DIFF_KEY = @"userDiff";
//static NSString *const APP_PARAM_DIFF_KEY = @"appParamDiff";
//static NSString *const PRODUCTS_DIFF_KEY = @"productDiff";
//static NSString *const AUDITION_DIFF_KEY = @"auditionDiff";
//static NSString *const PLAYGROUND_DIFF_KEY = @"playgroundDiff";
//static NSString *const CONTEST_DIFF_KEY = @"contestDiff";
//static NSString *const BATTLE_DIFF_KEY = @"battleDiff";
//static NSString *const SUBSCRIPTION_PRODUCTS_DIFF_KEY = @"subscriptionProductDiff";
//static NSString *const ALL_SUBSCRIPTION_PRODUCTS_DIFF_KEY = @"allSubscriptionProductDiff";
//static NSString *const USER_SPECIFIC_PRODUCTS_DATA_DIFF_KEY = @"userSpecificProductDiff";
//static NSString *const USER_COLLECTABLES_DIFF_KEY = @"userCollectableDiff";
//static NSString *const COLLECTABLES_STORE_EVENT_DIFF_KEY = @"eventsDiff";
//static NSString *const APP_CONTENT_DIFF_KEY = @"appContentDiff";
//static NSString *const COMPOSITE_GROUPS_AND_SHOWS_DIFF_KEY = @"groupsAndShowsDiff";
//static NSString *const EXTRAS_DIFF_KEY = @"extrasDiff";
//static NSString *const LANGUAGE_GROUP_DIFF_KEY = @"langGrpDiff";
//static NSString *const CLIENT_LANGUAGE_DIFF_KEY = @"appLanguage";
//static NSString *const CLIENT_NOTIFICATION_SETTINGS_FOR_SHOWTYPE = @"showNotiSet";
//static NSString *const GROUPS_DIFF_KEY = @"partyRoomsDiff";
//static NSString *const SHOWS_DIFF_KEY = @"gameShowsDiff";
//static NSString *const GIFTS_DIFF_KEY = @"giftsDiff";
//static NSString *const FRIEND_ID_PARAM_KEY = @"friendIds";
//static NSString *const FETCH_FRIENDS_AT_SERVER_PARAM_KEY = @"forceFetchFriendIds";
//
//// Error message on showing alert
//static NSString *const RETRY = @"Try Again";
//static NSString *const OK = @"Okay";
//
//static NSString *const YT_RATE_LIMIT_ERROR_TITLE = @"Boo 😔";
//static NSString *const YT_RATE_LIMIT_ERROR_MESSAGE =
//    @"YouTube doesn't seem to want to connect. Try again later!";
//
//static NSString *const PROFILE_DATA_VALIDATION_ERROR_TITLE = @"Username Taken!";
//static NSString *const PROFILE_DATA_VALIDATION_ERROR_MESSAGE =
//    @"Oops... looks like that username is taken 😜";
//
//static NSString *const APP_UNAVAILABLE_TITLE = @"Greetings friend!";
//static NSString *const UNAVAILABLE_ERROR_MESSAGE = @"We're not live in your country yet, but we're working hard to bring Joyride to the world 🌎\n\nCheck again soon! 👍";
//
//static NSString *const SERVER_TIMEOUT_ERROR_TITLE = @"Uh oh..";
//static NSString *const SERVER_TIMEOUT_ERROR_MESSAGE =
//    @"Err, something's not right. Give us a second 😬";
//static NSString *const SERVER_ERROR_TITLE = @"Server Error";
//static NSString *const SERVER_ERROR_MESSAGE = @"Whoops! Looks like there’s an issue with our servers. If the issue persists, please contact us at help@onjoyride.com";
//static NSString *const DIGIT_INTERNET_ERROR_TITLE = @"Uh oh..";
//static NSString *const DIGIT_INTERNET_ERROR_MESSAGE =
//    @"Well, this is awkward 😬 ";
//static NSString *const DIGIT_SERVER_ERROR_TITLE = @"Uh oh..";
//static NSString *const DIGIT_SERVER_ERROR_MESSAGE =
//    @"Sorry, something went wrong... #oops";
//static NSString *const TOKBOX_CONNECTION_ERROR_TITLE = @"Uh oh..";
//static NSString *const TOKBOX_CONNECTION_ERROR_MESSAGE =
//    @"Err, something's not right. Give us a second 😬";
//
//static NSString *const VIDEO_CHAT_ERROR_MESSAGE =
//    @"Sorry, we're having trouble connecting you... please try again!";
//static NSString *const VIDEO_CHAT_ERROR_SELF_MESSAGE =
//    @"Looks like there's something up with your connection. Restart the app to "
//    @"start Joyriding again!";
//
//static NSString *const FILTER_UNLOCKED_TITLE = @"Filter Unlocked!";
//static NSString *const FILTER_UNLOCKED_MESSAGE =
//    @"Tap the smiley face to try your new filter!";
//static NSString *const FILTER_UNLOCKED_BUTTON_TITLE = @"GREAT!";
//static NSString *const MAIN_PROFILE_GIF_UPLOAD_SUCCESS =
//    @"main_profile_gif_upload_success";
//static NSString *const HIGH_RESOLUTION_PROFILE_GIF_UPLOAD_SUCCESS =
//    @"high_resolution_profile_gif_upload_success";
//static NSString *const THUMBNAIL_PROFILE_GIF_UPLOAD_SUCCESS =
//    @"thumbnail_profile_gif_upload_success";
//static NSString *const TIME_STAMP = @"timeStamp";
//
//static NSString *const ENCODED_STATE = @"encoded_state";
//
//static NSString *const DEFAULT_USER_INFO =
//    @"{\"filterId\":\"vimojicordelianew\",\"sessionYTLiveState\":0,"
//    @"\"playerState\":0}";
//
//static NSString *const DEFAULT_USER_DATA =
//    @"{\"%@\":\"%@\", \"%@\":\"%@\", \"%@\":\"%@\", \"%@\":\"%@\", "
//    @"\"%@\":\"%@\", \"%@\":\"%@\", \"%@\":\"%@\", \"%@\":\"%@\", "
//    @"\"%@\":%@,\"%@\":%@}";
//
//#pragma Game Banners
//static NSString *const CHAT_BANNER_TEXT = @"";
//// static NSString * const CHAT_BANNER_IMAGE_NAME = @"chatBannerImage";
//static NSString *const CHAT_BANNER_IMAGE_NAME = nil;
//static NSString *const CHAT_MENU_ITEM_IMAGE = @"chat";
//
//static NSString *const FILTER_BANNER_TEXT = @"";
//// static NSString * const CHAT_BANNER_IMAGE_NAME = @"chatBannerImage";
//static NSString *const FILTER_BANNER_IMAGE_NAME = nil;
//static NSString *const FILTER_MENU_ITEM_IMAGE = @"filterMenuIcon";
//
//static NSString *const FACEOFF_MENU_ITEM_IMAGE = @"playGameIcon";
//static NSString *const FACEOFF_BANNER_TEXT = @"Guess who you are from your "
//    @"friends' clues! And then it's "
//    @"time to switch 😬";
//static NSString *const FACEOFF_BANNER_IMAGE_NAME = @"faceoffBannerImage";
//static NSString *const TRIVIA_BANNER_TEXT =
//    @"Answer as many questions as you can to see who’s the smartest 🤓";
//static NSString *const POP_TRIVIA_BANNER_TEXT =
//    @"Answer as many questions as you can to see who's the trivia queen 👑";
//static NSString *const AUDIO_TRIVIA_BANNER_TEXT =
//    @"Answer questions about the audio clip";
//static NSString *const FAMILY_FEUD_BANNER_TEXT =
//    @"Answer as many questions as you can to see who’s the smartest 🤓";
//
//static NSString *const HEADSHOT_LOGO_IMAGE_NAME = @"headshotLogo";
//static NSString *const TRIVIA_LOGO_IMAGE_NAME = @"triviaLogo";
//static NSString *const POP_TRIVIA_IMAGE_NAME = @"popTriviBanner";
//static NSString *const AUDIO_TRIVIA_IMAGE_NAME = @"MusicMania";
//static NSString *const FAMILY_FEUD_IMAGE_NAME = @"logoFriendlyFeud";
//
//static NSString *const HEADSHOT_VIDEO_NAME = @"HeadshotTrailer.mp4";
//static NSString *const TRIVIA_VIDEO_NAME = @"TriviaTrailer.mp4";
//static NSString *const POP_TRIVIA_VIDEO_NAME = @"PopTriviaTrailer.mp4";
//static NSString *const AUDIO_TRIVIA_VIDEO_NAME = @"MusicManiaTrailer.mp4";
//static NSString *const FAMILY_FEUD_VIDEO_NAME = @"FriendlyFeudTrailer.mp4";
//
//static NSString *const TEAM_BANNER_TEXT = @"";
//// static NSString * const TEAM_BANNER_IMAGE_NAME = @"chatBannerImage";
//static NSString *const TEAM_BANNER_IMAGE_NAME = nil;
//static NSString *const TEAM_MENU_ITEM_IMAGE = @"team";
//
//static float const MENU_STAY_DURATION = 6.0;
//static float const MENU_HIDE_ANIMATION_DURATION = 1.0;
//static CGFloat const EMOJI_BUTTON_ANIMATION_DURATION = 0.75;
//
//static NSString *const REMOTE_NOTIFICATION_TYPE_IN_PR_SESSION =
//    @"IN_PR_SESSION";
//static NSString *const REMOTE_NOTIFICATION_FROM_USER_ID = @"fromUserId";
//static NSString *const REMOTE_NOTIFICATION_TO_USER_ID = @"userId";
//static NSString *const REMOTE_NOTIFICATION_SESSION_ID = @"sessionId";
//static NSString *const REMOTE_NOTIFICATION_GAME_SHOW_ID = @"gameShowId";
//static NSString *const REMOTE_NOTIFICATION_GAME_ID = @"game_id";
//static NSString *const REMOTE_NOTIFICATION_ROOM_ID = @"roomId";
//static NSString *const REMOTE_NOTIFICATION_TIME_STAMP = @"timeStamp";
//static NSString *const REMOTE_NOTIFICATION_IGNORE_DURATION =
//    @"ignore_notification_duration";
//static NSString *const REMOTE_NOTIFICATION_TO_USER_IDS = @"pushReceiverUserIds";
//static NSString *const REMOTE_NOTIFICATION_USER_IDS_IN_SESSION =
//    @"userIdsInSession";
//static NSString *const REMOTE_NOTIFICATION_COLLAPSE_ID = @"apnsCollapseId";
//
//static NSString *const REMOTE_NOTIFICATION_TYPE = @"type";
//static NSString *const REMOTE_NOTIFICATION_SUB_TYPE = @"subType";
//static NSString *const REMOTE_NOTIFICATION_TYPE_HI = @"HI";
//static NSString *const REMOTE_NOTIFICATION_TYPE_SESSION_HI = @"SESSION_HI";
//static NSString *const REMOTE_NOTIFICATION_TYPE_ONLINE = @"ONLINE";
//static NSString *const REMOTE_NOTIFICATION_TYPE_HIDDEN_ONLINE = @"HIDDEN_ONLINE";
//static NSString *const REMOTE_NOTIFICATION_TYPE_JOINED = @"JOINED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_IN_SESSION = @"IN_SESSION";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAME = @"GAME";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAME_START = @"GAME_START";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GENERIC_PUSH = @"GENERIC";
////static NSString *const REMOTE_NOTIFICATION_TYPE_ADD_GAME = @"HI";
//static NSString *const REMOTE_NOTIFICATTION_CHAT_MESSAGE = @"chat";
//static NSString *const REMOTE_NOTIFICATION_TYPE_FRIEND_REQUEST_INITIATED =
//    @"FRIEND_REQUEST_INITIATED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_FRIEND_REQUEST_ACCEPTED =
//    @"FRIEND_REQUEST_ACCEPTED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_CONTACT_BECAME_FRIEND =
//    @"CONTACT_BECAME_FRIEND";
//static NSString *const REMOTE_NOTIFICATION_TYPE_UNFRIENDED = @"UNFRIENDED";
//
//static NSString *const REMOTE_NOTIFICATION_GAME_SHOW_START = @"gameshowStart";
//static NSString *const REMOTE_NOTIFICATION_GAME_SHOW_CANCEL = @"gameshowCancel";
//
//static NSString *const REMOTE_NOTIFICATION_FOLLOW_EVENT = @"FOLLOWED";
//
//static NSString *const REMOTE_NOTIFICATION_SUB_TYPE_SESSION_USER_ONE =
//    @"SESSION_USER_ONE";
//static NSString *const REMOTE_NOTIFICATION_SUB_TYPE_SESSION_USER_TWO =
//    @"SESSION_USER_TWO";
//static NSString *const REMOTE_NOTIFICATION_SUB_TYPE_SESSION_USER_MORE =
//    @"SESSION_USER_MORE";
//
//static NSString *const REMOTE_NOTIFICATION_TYPE_PARTYROOM_BROADCAST = @"PARTYROOM_BROADCAST";
//static NSString *const REMOTE_NOTIFICATION_TYPE_PARTYROOM_ENGAGEMENT = @"PARTYROOM_ENGAGEMENT";
//static NSString *const REMOTE_NOTIFICATION_TYPE_LIVE_GROUP_UNLOCKED = @"LIVE_GROUP_UNLOCKED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_PARTYROOM_GAME_RE_ENGAGEMENT = @"PARTYROOM_GAME_REENGAGEMENT";
//static NSString *const REMOTE_NOTIFICATION_IS_PARTY_ROOM_EMPTY = @"isPartyRoomEmpty";
//static NSString *const REMOTE_NOTIFICATION_IS_PARTY_ROOM_HOST_PRESENT = @"isPartyRoomHostPresent";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAMESHOW_JOIN_TEAM = @"GAMESHOW_JOIN_TEAM";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAME_SHOW_CHAT_UNMUTED =
//    @"GAME_SHOW_CHAT_UNMUTED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAME_SHOW_CHAT_SLOW_DOWN =
//    @"GAME_SHOW_CHAT_SLOW_DOWN ";
//static NSString *const REMOTE_NOTIFICATION_TYPE_GAME_SHOW_CHAT_MUTED =
//    @"GAME_SHOW_CHAT_MUTED";
//static NSString *const NOTIFICATION_TYPE_NONE = @"NOTIFICATION_TYPE_NONE";
//static NSString *const NOTIFICATION_TYPE_SHOW_CHALLENGER = @"NOTIFICATION_TYPE_SHOW_CHALLENGER";
//static NSString *const NOTIFICATION_TYPE_SHARE = @"NOTIFICATION_TYPE_SHARE";
//
//static NSString *const REMOTE_NOTIFICATION_TYPE_SHOW_JOIN = @"SHOW_JOIN";
//static NSString *const REMOTE_NOTIFICATION_TYPE_CHALLENGER_SHOW_JOIN = @"CHALLENGER_SHOW_JOIN";
//static NSString *const REMOTE_NOTIFICATION_TYPE_CHALLENGER_INFLUENCER_SHOW_JOIN = @"CHALLENGER_INFLUENCER_SHOW_JOIN";
//static NSString *const REMOTE_NOTIFICATION_TYPE_HIDDEN_SHOW_JOIN = @"HIDDEN_SHOW_JOIN";
//static NSString *const REMOTE_NOTIFICATION_TYPE_AUDITION_LIKE_REWARD = @"AUDITION_LIKE_REWARD";
//static NSString *const REMOTE_NOTIFICATION_TYPE_AUDITIONS_CREATED = @"AUDITIONS_CREATED";
//static NSString *const REMOTE_NOTIFICATION_TYPE_CONTESTS_REWARDED = @"CONTESTS_REWARDED";
//
//static NSString *const PUBNUB_MESSAGE_TYPE = @"message_type";
//static NSString *const PUBNUB_MESSAGE = @"pubnub_message";
//static NSString *const PUBNUB_MESSAGE_STATE_ON_RECEIVE = @"status";
//static NSString *const IS_FROM_PUBNUB = @"IS_FROM_PUBNUB";
//
//static NSString *const GENERIC_PUSH_MESSAGE_KEY = @"notificationMessage";
//static NSString *const SCREENSHOT_MESSAGE = @"<USER> took a screenshot📷";
//
//static NSString *const IS_VIMOJI_ENABLED = @"isVimojiEnabled";
static NSString *const IS_ADMIN_MODE_DISABLED = @"isAdminModeDisabled";
//static NSString *const IS_VIMOJI_ENABLED_CMS = @"isVimojiEnabledInCMS";
//static NSString *const TABOO_ASSET_LIST[] = {
//    @"awkward", @"eek", @"mybad",
//    @"nope", @"snap", @"sorry",
//    @"whoopsie", @"wtf"
//};
//
///* permissions */
//static NSString *const PERMISSION_TYPE_KEY = @"permissionType";
//static NSString *const NOTIFICATION_PERMISSION_KEY =
//    @"Notifications_permissions_asked";
//static NSString *const FIRST_LAUNCH_PERMISSIONS_TRIGGERED =
//    @"firstLaunchPermissionsTriggered";
//static NSString *const LAUNCHPAD_BUTTON_TAPPED_FIRST_TIME =
//    @"launchpadButtonTappedFirstTime";
//static NSString *const PERMISSION_HAS_SEEN_CONTACT_NOTIFICATION_VARIANT = @"hasSeenContactNotificationVariant";
//
//// notification
//static NSString *const SELF_INITIATED_KEY = @"selfInitiated";
//static NSString *const USER_ROLE_KEY = @"user_role";
//static NSString *const GAME_ID_KEY = @"game_id";
//static NSString *const GAME_NAME_KEY = @"game_name";
//static NSString *const GAME_STATUS_KEY = @"status";
//
//static NSString *const GAME_CARD_PASSED = @"gameCardPassed";
//static NSString *const GAME_END_OF_TURN = @"gameEndOfTurn";
//static NSString *const GAME_SUCCESS_MATCH = @"gameSuccessMatch";
//
//static NSString *const END_OF_TURN_SOUND_PATH = @"%@/endOfTurnSound.mp3";
//static NSString *const PASS_CARD_SOUND_PATH = @"%@/passCardSound.mp3";
//static NSString *const SUCCESS_MATCH_SOUND_PATH = @"%@/correctWordSound.mp3";
//static NSString *const TABOO_WORD_SOUND_PATH = @"%@/tabooWordSound.wav";
//
//static NSInteger const USER_LOCKED_FILTER_COUNT = 7;
//
//static NSString *const SHOULD_RELOAD_FILTER_COLLECTION_VIEW =
//    @"shouldReloadFilterCollectionView";
//static NSString *const FILTER_APPLIED_ANIMATION = @"filterAppliedAnimation";
//static NSString *const INVITE_MSG_PARAM = @"inviteMessage";
//static NSString *const SHARE_MSG_PARAM = @"shareMessage";
//static NSString *const INVITE_MUTUAL_FRIENDS_MSG_PARAM =
//    @"inviteMutualFriendsMessage";
//static NSInteger const DUMMY_PARTY_USERS_COUNT = 2;
//static NSString *const BLOCK_THIS_PERSON = @"Are you sure?";
//static NSString *const GLOBAL_CHAT_BLOCK_MESSAGE =
//    @"If more than one person blocks a user, they will be removed from this "
//    @"room and you won't see them again 🙅";
//static NSString *const BAN_THIS_PERSON = @"Ban this Person?";
//static NSString *const GLOBAL_CHAT_BAN_MESSAGE =
//    @"Banning a user will remove them from the app. They will not be able to "
//    @"use the app anymore.";
//
//static NSString *const CHALLENGER_NOTIFICATION_SELF_MESSAGE = @"Your Joyride friends have been invited ✅";
//
//static NSString *const GOOGLE_AUTH_TOKEN = @"google_auth_token";
//static NSString *const YOUTUBE_LIVE_ENABLED = @"youtube_live_enabled_1";
//
//static NSString *const LAST_UPLOADED_CONTACTS_COUNT =
//    @"lastUploadedContactsCount";
//static NSString *const LAST_FETCH_CONTACTS_COUNT = @"lastFetchContactsCount";
//static NSString *const FILTER_APPLIED = @"filter_applied";
//static NSString *const TOP_MENU_STATUS_MUTE_TAG = @"mute";
//static NSString *const TOP_MENU_STATUS_UNMUTE_TAG = @"unMute";
//
///*
// * Google Auth Popup
// */
//static NSString *const GOOGLE_LOGIN_TITLE = @"Get Started!";
//static NSString *const GOOGLE_LOGIN_MESSAGE =
//    @"Stream your room right to YouTube Live! 😎";
//static NSString *const GOOGLE_LOGIN_BUTTON_TEXT = @"SIGN IN";
//
///*
// * Streaming Images/Animation names
// */
//static NSString *const FB_STREAM = @"facebook-top-stream";
//static NSString *const YT_STREAM = @"youtube-top-stream";
//
///*
// * Enable Live Stream Popup
// */
//static NSString *const ENABLE_STREAM_TITLE = @"One Last Step...";
//static NSString *const ENABLE_STREAM_MESSAGE =
//    @"You need to enable YouTube Live to start a livestream.";
//static NSString *const ENABLE_STREAM_BUTTON_TEXT = @"ENABLE";
//
//static NSString *const ENABLE_STREAM_YT_LINK =
//    @"https://www.youtube.com/my_live_events";
///*
// * Start Live Stream Popup
// */
//static NSString *const START_STREAM_TITLE = @"Start Your Livestream";
//static NSString *const START_STREAM_MESSAGE =
//    @"Show the world what you've got 😎";
//static NSString *const START_STREAM_BUTTON_TEXT = @"START";
//static NSString *const CANCEL_BUTTON_TEXT = @"Cancel";
//static NSString *const OKAY_BUTTON_TEXT = @"Okay";
///*
// * Share Live Stream Popup
// */
//
//static NSString *const SHARE_STREAM_POPUP_TITLE = @"Share Your Livestream";
//static NSString *const SHARE_STREAM_POPUP_MESSAGE =
//    @"Make sure your friends catch your livestream! 😛";
//static NSString *const SHARE_STREAM_POPUP_BUTTON_TEXT = @"SHARE";
//static NSString *const SKIP_BUTTON_TEXT = @"SKIP";
//static NSString *const SKIP_BUTTON_TEXT_CAMEL_CASE = @"Skip";
//static NSString *const SHARE_STREAM_SHARE_MESSAGE =
//    @"I'm having fun on Joyride 🤓 Watch me LIVE on YouTube now!! 👉";
//static NSString *const CHANGE_ACCOUNT_TEXT = @"CHANGE ACCOUNT";
//static NSString *const START_FACEBOOK_STREAM_TITLE = @"Start Facebook Stream";
//static NSString *const START_FACEBOOK_STREAM_MESSAGE = @"Stream the show to your FB timeline and get a key!";
//static NSString *const START_STREAM_WITH_CAMERA_EMOJI_TAG = @"Start Stream 📹";
//static NSString *const SHARE_STREAM_TAG = @"Share Stream";
//static NSString *const START_STREAM_TAG = @"Start Stream";
//static NSString *const SETTINGS_TAG = @"Settings";
//static NSString *const RECORDING_TAG = @"Recording";
//static NSString *const STREAM_TO_YOUTUBE_TAG = @"Stream to YouTube";
//static NSString *const STREAM_TO_FACEBOOK_TAG = @"Stream to Facebook";
//static NSString *const YOUR_ROOM_IS_STREAMING_TAG = @"Your Room is Streaming";
//static NSString *const SHARE_THIS_ROOM_TAG =
//    @"Share this stream or start your own";
//
///*
// * Stop Live Stream Popup
// */
//static NSString *const STOP_STREAM_TITLE = @"Stop Stream";
//static NSString *const STOP_STREAM_MESSAGE =
//    @"You are live. Are you sure you want to stop?";
//static NSString *const STOP_STREAM_BUTTON_TEXT = @"STOP";
//static NSString *const END_STREAM_TAG = @"End Stream";
//
///*
// * Stop Live Stream Popup
// */
//static NSString *const ERROR_STREAM_TITLE = @"Uh oh....";
//static NSString *const ERROR_STREAM_MESSAGE =
//    @"Looks like there's something up with your connection to YouTube";
//static NSString *const ERROR_STREAM_BUTTON_TEXT = @"RETRY";
//
///*
// * Stream Ended Popup
// */
//static NSString *const ENDED_STREAM_TITLE = @"Livestream Ended";
//static NSString *const ENDED_STREAM_MESSAGE =
//    @"Share the recorded live session with your friends! 👯";
//static NSString *const ENDED_STREAM_BUTTON_TEXT = @"SHARE";
//static NSString *const RECORDED_STREAM_SHARE_MESSAGE =
//    @"I had fun on Joyride 🤓 Watch my video on YouTube now!! 👉";
//static NSString *const INVITE_SENT_NOTIFICATION_MESSAGE = @"Your invites have been sent";
//static NSString *const LINK_COPIED_NOTIFICATION_MESSAGE = @"Your link to share has been copied. You can directly paste and share with your friends";
//
//static NSString *const NOTIFICATION_BUTTON_TYPE = @"notificationButtonType";
//static NSString *const NOTIFICATION_SHARE = @"SHARE";
//static NSString *const NOTIFICATION_JOIN = @"JOIN";
//
//static NSString *const KICKED_FROM_GLOBAL_ROOM_KEY = @"kicked_from_global_room";
//static NSString *const PHONE_TAG = @"phone";
//static NSString *const COUNTRY_CODE_TAG = @"countryCode";
//static NSString *const ISO_CODE_TAG = @"isoCode";
//static NSString *const GEO_GROUP_TAG = @"geoGroup";
//static NSString *const LANGUAGE_TAG =  @"languageCode";
//static NSString *const CURRENCY_CODE_TAG = @"currencyCode";
//static NSString *const WINNINGS_CASH_OUT_LIMIT_TAG = @"winningsCashOutLimit";
//static NSString *const EARNING_CASH_OUT_LIMIT_TAG = @"earningCashOutLimit";
//static NSString *const MODIFY_INITIAL_KEY_AB_TEST_TAG = @"modifyInitialKeyAbTest";
//static NSString *const OTP_METHOD_PARAM_KEY = @"otpMethod";
//static NSString *const OTP_BY_CALL = @"call";
//static NSString *const SHOULD_SHOW_INVITE_POPUP_ON_GLOBAL_ROOM_JOIN =
//    @"shouldShowInvitePopupOnGlobalRoomJoin";
//static NSString *const LOCKED_LABEL = @"Closed";
//static NSString *const UNLOCKED_LABEL = @"Open";
//static NSString *const FULL_ROOM_TAG = @"full_room";
//static NSString *const LOCKED_ROOM_TAG = @"locked_room";
//static NSString *const BLOCKERS_ROOM_TAG = @"blockers_room";
//
//static NSString *const DEFAULT_TAG = @"default";
//static NSString *const MUTE_LABEL = @"Mute";
//static NSString *const UNMUTE_LABEL = @"Unmute";
//
//static NSString *const RECIEPIENTS = @"RECIEPIENTS";
//static NSString *const USD_CURRENCY = @"USD";
//static NSString *const LOCALE = @"locale";
//
///*
// * Swipe Gesture allowed variable
// */
//
//static BOOL const allowRightSwipe = NO;
//
//static NSString *const LP_HEAD_SHOT_STATUS = @"HEAD_SHOT";
//static NSString *const LP_TRIVIA_STATUS = @"TRIVIA";
//static NSString *const LP_POP_TRIVIA_STATUS = @"POP_TRIVIA";
//static NSString *const LP_AUDIO_TRIVIA_STATUS = @"AUDIO_TRIVIA";
//static NSString *const LP_GAME_SHOW_TRIVIA_STATUS = @"GAME_SHOW_TRIVIA";
//static NSString *const LP_FAMILY_FEUD_STATUS = @"FAMILY_FEUD";
//static NSString *const LP_VIDEO_CHAT_STATUS = @"VIDEO_CHAT";
//static NSString *const LP_SAID_HI_STATUS = @"SAID_HI";
//static NSString *const LP_BECAME_FRIEND_STATUS = @"BECAME_FRIEND";
//static NSString *const LP_ANY_DIRECTION_STATUS = @"ANY";
//static NSString *const LP_OUT_DIRECTION_STATUS = @"OUT";
//static NSString *const LP_IN_DIRECTION_STATUS = @"IN";
//static NSString *const NONE_CAPS = @"NONE";
//static NSString *const LP_NONE_STATUS = NONE_CAPS;
//static NSString *const LP_STATUS_DELIM = @"@@@";
//
//static NSString *const FROM_SYSTEM_NOTIFICATION = @"fromSystemNotification";
//
//static NSString *const PARTY_ROOM_IDENTITY_POPUP_TITLE = @"Feeling shy?";
//static NSString *const PARTY_ROOM_IDENTITY_POPUP_MESSAGE =
//    @"Tap when you're ready to show your face 😊";
//static NSString *const PARTY_ROOM_IDENTITY_POPUP_BTN_TXT = @"I'M READY";
//
//static NSString *const IS_GAME_CANCEL_INITIATED = @"IS_GAME_CANCEL_INITIATED";
//
//static NSString *const READY_TO_BE_NEW_KID_ON_THE_BLOCK =
//    @"Ready to be the new kid on the block?";
//
///*
// * Twilio FireStarter Config
// */
//
//static NSString *const FIRESTARTER_POPUP_TITLE = @"Welcome to Joyride 😎";
//static NSString *const FIRESTARTER_POPUP_MESSAGE =
//    @"Invite your friends to hangout \nand play games!";
//static NSString *const FIRESTARTER_SEND_BTN_TEXT = @"Send";
//static NSString *const FIRESTARTER_PICK_FRIENDS_TEXT = @"Pick Friends";
//static NSString *const FIRESTARTER_SKIP_TEXT = @"SKIP";
//
//static NSInteger const TOKBOX_MIN_SESSIONS_FETCH_COUNT = 1;
//static NSInteger const TOKBOX_MAX_SESSIONS_FETCH_COUNT = 2;
//
//static NSString *const TOKBOX_SESSION_ID = @"sessionId";
//static NSString *const TOKBOX_CONNECTION_ID = @"connectionId";
//static NSString *const FRIENDS_IDENTIFIER = @"friends";
//static NSString *const FRIEND_REQUESTS_RECEIVED_IDENTIFIER =
//    @"friendrequestsreceived";
//static NSString *const FRIEND_REQUESTS_SENT_IDENTIFIER = @"friendrequestssent";
//static NSString *const IN_APP_CONTACTS_IDENTIFIER = @"inAppContacts";
//static NSString *const NOT_IN_APP_CONTACTS_IDENTIFIER = @"notInAppContacts";
//static NSString *const IN_APP_CONTACTS_COUNT = @"inAppContactsCount";
//static NSString *const NOT_IN_APP_CONTACTS_COUNT = @"notInAppContactsCount";
//
//#pragma mark Redesign
//static NSString *const MY_ROOM = @"My Room";
//static NSString *const FRIENDS_HANGING_OUT = @"Friends Hanging Out";
//static NSString *const PUBLIC_ROOM = @"Public Rooms";
//static NSString *const FRIENDS = @"Friends";
//
//static NSInteger const AUGMENTOR_UPDATE_INTERVAL = 2000;
//
//static NSString *const FB_DEFAULT_FIELDS_PARAM_KEY = @"fields";
//static NSString *const FB_EDUCATION_EXPERIENCE_PARAM_VALUE = @"education";
//static NSString *const FB_BEST_PAGE_PARAM_VALUE = @"best_page";
//static NSString *const FB_PAGE_INFO_PARAM_VALUE = @"name,cover";
//static NSString *const FB_CURRENT_LOGGED_IN_USER_ROUTE = @"me";
//static NSString *const TARGET_MACRO_KEY = @"target";
//static NSString *const NAME_MACRO_KEY = @"name";
//static NSString *const IMAGE_MACRO_KEY = @"image";
//static NSString *const FC_SEARCH_BAR_PLACEHOLDER_TEXT =
//    @"Search contacts                ";
//
//static NSString *const GLOBAL_SEARCH_PLACEHOLDER = @"Search usernames and contacts";
//
//static NSString *const UI_UPDATE_COMPONENT_ID = @"uiComponentId";
//static NSString *const COMPONENT_ID_TOPMENU = @"topMenu";
//static NSString *const COMPONENT_ID_BOTTOMMENU = @"bottomMenu";
//static NSString *const UI_UPDATE_COMPONENT_STATE = @"uiComponentState";
//#pragma end
//
//static NSString *const SESSION_ID_KEY = @"sId";
//static NSString *const USER_ID_KEY = @"uId";
//static NSString *const DEVICE_TYPE_KEY = @"dType";
//static NSString *const DEEPLINK_USER_NAME_KEY = @"uName";
//static NSString *const ROOM_ID_KEY = @"rId";
//static NSString *const ROOM_NAME_KEY = @"rName";
//static NSString *const TIME_IN_LIVE_KEY = @"tLive";
//static NSString *const ROOM_ID_FALLBACK_KEY = @"rid";
//static NSString *const PLATFORM_KEY = @"pt";
//static NSString *const LINK_KEY = @"~referring_link";
//
static NSString *const HASH_KEY = @"hashKey";
static NSString *const JWT = @"jwt";
//
static NSString *const KIWI_DEVICE_ID_KEY = @"kiwiDeviceId";
//static NSString *const UTM_SOURCE_KEY = @"utmSource";
//static NSString *const UTM_CAMPAIGN_KEY = @"utmCampaign";
//static NSString *const UTM_MEDIUM_KEY = @"utmMedium";
//static NSString *const UTM_CONTENT_KEY = @"utmContent";
//static NSString *const WEB_LINK_KEY = @"kiwiWebLinkData";
//static NSString *const CLICK_LABEL = @"click_label";
//
//static NSString *const IFA_PARAM = @"ifa";
//static NSString *const IFV_PARAM = @"ifv";
//static NSString *const RESET_USER_PARAM = @"resetUser";
//static NSString *const VERIFY_OTP_PARAM = @"verifyOtp";
//static NSString *const NO_OTP_NUMBER_PARAM = @"noOtpPhoneNumber";
//static NSString *const AUTH_CLIENT_PARAM = @"authenticationClient";
//static NSString *const AUTH_HEADER_PARAM = @"authorizationHeader";
//static NSString *const GET_JWT_PARAM = @"getJwt";
//static NSString *const DEVICE_TYPE_PARAM = @"deviceType";
//static NSString *const FIREBASE = @"firebase";
//
//// pragma mark - Color constants
//#define gueTextBackgroundColor                  \
//    [UIColor colorWithRed: 0.65098039220000004f \
// green: 0.20784313730000001f                    \
// blue: 1.0f                                     \
// alpha: 1.0f]
//
//static NSString *const FILTER_NONE_BG_IMAGE = @"filterNoneBg";
//static NSString *const FILTER_LOCKED_BG_IMAGE = @"filterLockedBg";
//static NSString *const FILTER_LOCKED_NEW_BG_IMAGE = @"filterLockedNewBg";
//static NSString *const FILTER_UNLOCKED_BG_IMAGE = @"filterUnlockedBg";
//static NSString *const FILTER_UNLOCKED_NEW_BG_IMAGE = @"filterUnlockedNewBg";
//static NSString *const FILTER_LOCKED_ICON_IMAGE = @"filterLockedIcon";
//static NSString *const FILTER_UNLOCKED_ICON_IMAGE = @"filterUnlockedIcon";
//
//static NSString *const CANCEL_CAMEL_CASE = @"Cancel";
//
//#pragma mark - Game Banner
//static NSString *const PLAY_GAME = @"Play Game 🎮";
//static NSString *const ADD_FRIENDS_TO_PLAY = @"Add Friends to Play 🎮";
//static NSString *const ADD_FRIENDS_TO_PLAY_IPHONE5 = @"Invite to Play 🎮";
//#pragma end
//
//static NSInteger const THRESHOLD_FOR_COUNT_OF_BEING_KICKED_OUT = 2;
//static NSInteger const TRUNCATION_USERNAME_LENGTH = 11;
//
//static NSInteger const OTP_VERIFICATION_MAX_LENGTH = 6;
//
//#pragma mark - Branch params
//static NSString *const IS_FIRST_SESSION = @"+is_first_session";
//static NSString *const NETWORK = @"network";
//static NSString *const CAMPAIGN = @"campaign";
//static NSString *const ADGROUP = @"adgroup";
//static NSString *const CREATIVE = @"creative";
//static NSString *const TRACKER_TOKEN = @"trackerToken";
//
//static NSString *const DEVICE_CHECK_ID = @"deviceCheckId";
//static NSString *const DEVICE_STATUS = @"deviceStatus";
//
//static NSString *const HEADSHOT_FILTER_LIST = @"HEADSHOT_FILTER_LIST";
//static NSString *const HEADSHOT_ORDERED_GUESSOR_LIST =
//    @"HEADSHOT_ORDERED_GUESSOR_LIST";
//static NSString *const MY_ROOM_SECTION_HEADER = @"My Room";
//static NSString *const GAME_SHOW_BANNER = @"Coming Soon!";
//
//#pragma mark - GameShow
//static NSString *const QUESTION_ID = @"question_id";
//static NSString *const QUESTION_NUM = @"question_num";
//static NSString *const IS_WINNER = @"is_winner";
//static NSString *const USER_SCORE = @"user_score";
//static NSString *const USER_MUTED_KEY = @"USER_MUTED";
//static NSString *const MUTED_USERID_LIST_KEY = @"MUTED_USERID_LIST";
//
//#pragma user update status message
//
//static NSString *const INVALID_REFERRAL = @"invalid referral code";
//static NSString *const USERNAME_UNAVAILABLE = @"username not available";
//
//#pragma mark - Messaging delimiters
//
///******GameQuestionDelimiters******/
//static NSString *const QUESTION_TEXT = @"question_text";
//static NSString *const QUESTION_OPTIONS = @"question_options";
//static NSString *const QUESTION_TEXT_DELIMITER = @"!!!";
//static NSString *const QUESTION_TEXT_OPTION_DELIMITER = @":::";
//static NSString *const OPTION_DELIMITER = @"###";
//
///******QuestionOptionDelimiters******/
//static NSString *const OPTION_VALUE = @"option_value";
//static NSString *const OPTION_VALUE_DELIMITER = @"===";
//static NSString *const OPTION_PROPERTIES = @"option_properties";
//static NSString *const OPTION_PROPERTIES_DELIMITER = @"%%%";
//static NSString *const PROPERTIES_DELIMITER = @"@@@";
//static NSString *const PROPERTY_VALUE_DELIMITER = @"&&&";
//
///******WinnerModelDelimiters******/
//static NSString *const GAME_WINNER_DELIMITER = @"@@@";
//
///******ItemMessageDelimiters******/
//static NSString *const VALUE_DELIMITER = @"=!=#=@";
//static NSString *const PROPERTY_DELIMITER = @"%!%#%@";
//
//static NSString *const STATUS = @"status";
//static NSString *const STATUS_CODE = @"statusCode";
//static NSString *const MESSAGE = @"message";
//static NSString *const REWARDS = @"rewards";
//static NSString *const USER_PRODUCTS = @"userPurchases";
//static NSString *const USER_COLLECTABLES = @"userCollectables";
//static NSString *const KEY_COUNT = @"keyCount";
//static NSString *const REFERRAL_CODE = @"referralCode";
//static NSString *const PROFILE_IMAGE_URL = @"profileImgUrl";
//
//static NSString *const USER_PROPERTIES = @"userProperties";
//
//static NSInteger const IOB_TIMESCALE_FOR_PLAYBACK_OBSERVER = 10;
//
//static NSString *const SOCIAL_GAME_ENABLED = @"SOCIAL_GAME_ENABLED";
//static NSString *const IOS_VERSION_1125 = @"11.2.5";
//
//static NSString *const PRODUCTS_JSON_STRING_KEY = @"productsJsonString";
//static NSString *const REWARD_SERVICES_JSON_STRING_KEY = @"rewardServicesJsonString";
//static NSString *const USER_REWARDS_STATE_MAX_ID = @"USER_REWARDS_STATE_MAX_ID";
//
//static NSString *const USER_MAIL_PERMISSION = @"USER_MAIL_PERMISSION";
//
//static NSString *const USER_JSON_STRING_KEY = @"userJsonString";
//static NSInteger const GAME_SHOW_CRITICAL_TIME = 120000;//in msecs
//
//static NSString *const START_TIME = @"startTime";
//static NSString *const LOCAL_NEWBIE_SHOW = @"local_newbie_show";
//static NSString *const USER_NAME_MACRO = @"<uname>";
//static NSString *const LOCAL_CREATE_AUDITION_NOTIFICATION_TYPE = @"local_create_audition_notification";
//static NSString *const PRIZE_REGEX = @"{prize}";
//static NSString *const NOTIFICATION_TYPE_ALARM = @"alarm";
//
//static NSInteger const MAX_COUNTER_TO_RESET_COUNT_FROM_OTHER_SOURCES = 10;
//static NSInteger const TIMER_TO_CONTINUE_DIFF = 5;
//static NSString *const BUNDLE_IDENTIFIER = @"com.kiwi.joyride";
//
//static NSString *const USER_TERMS_AGREEMENT_STRING = @"I agree to the {Terms_Of_Service}, {Privacy_Policy}, and {Contest_Rules}";
//
//static NSString *const TERMS_OF_SERVICE_TITLE_TAG = @"Terms of Service";
//static NSString *const PRIVACY_POLICY_TITLE_TAG = @"Privacy Policy";
//static NSString *const CONTEST_RULES_TITLE_TAG = @"Contest Rules";
//static NSString *const LEGAL_TITLE_TAG = @"Legal";
//static NSString *const COMMUNITY_GUIDELINES_TITLE_TAG = @"Community Guidelines";
//static NSString *const TERMS_OF_SERVICE_URL = @"https://www.onjoyride.com/legal?sab=0#terms";
//static NSString *const PRIVACY_POLICY_URL = @"https://www.onjoyride.com/legal?sab=0#privacy";
//static NSString *const CONTEST_RULES_URL = @"https://www.onjoyride.com/legal?sab=0#rules";
//
//static NSString *const FONT_GREYCLIFF_CF_BOLD = @"GreycliffCF-Bold";
//static NSString *const FONT_GREYCLIFF_CF_DEMI_BOLD = @"GreycliffCF-DemiBold";
//
//#pragma monetization
//
//static NSString *const USER_PRODUCT_REQ_DAY = @"USER_PRODUCT_REQ_DAY";
//static NSString *const USER_PRODUCT_LOGGED = @"USER_PRODUCT_LOGGED";
//
//
//static NSString *const CURRENT_PLACEHOLDER = @"<current>";
//static NSString *const MIN_NUMBER_PLACEHOLDER = @"<num>";
//static NSString *const NUMBER_PLACEHOLDER = @"<num1>";
//static NSString *const NUMBER2_PLACEHOLDER = @"<num2>";
//static NSString *const BTIER_PLACEHOLDER = @"<tier>";
//static NSString *const PERFIX_PLACEHOLDER = @"<prefix>";
//static NSString *const FREE_KEYS_PLACEHOLDER = @"<free>";
//static NSString *const BONUS_KEYS_PLACEHOLDER = @"<bonus>";
//static NSString *const FREE_KEYS_PRICE_PLACEHOLDER = @"<free_price>";
//static NSString *const PRODUCT_REWARD_PLACEHOLDER = @"<product_reward>";
//static NSString *const DURATION_PLACEHOLDER = @"<duration>";
//static NSString *const POSITION_PLACEHOLDER = @"<position>";
//static NSString *const PRIZE_PLACEHOLDER = @"<prize>";
//static NSString *const PRICE_PLACEHOLDER = @"<price>";
//static NSString *const PRICE_BY_6_PLACEHOLDER = @"<price/6>";
//static NSString *const REQUIRED_PLACEHOLDER = @"<req>";
//static NSString *const USERNAME_PLACEHOLDER = @"<user_name>";
//static NSString *const DISCOUNT_PERCENT_PLACEHOLDER = @"<discount_percent>";
//static NSString *const PERCENT_PLACEHOLDER = @"<percent>";
//static NSString *const GAME_TYPE_PLACEHOLDER = @"{gameshow}";
//static NSString *const CASHOUT_REDUCED_LIMIT_PLACEHOLDER = @"<reduced_limit>";
//static NSString *const TIME_PLACEHOLDER = @"<time>";
//
//static NSString *const GAME_NAME_PLACEHOLDER = @"<game_name>";
//
//static const CGFloat LP_TOP_INSET_PADDING = 62.0;
//static const CGFloat LP_FOOTER_HEIGHT_FOR_BOTTOM_INSET = 700.0;
//
//static NSInteger const ENTRY_TIME_OF_LIVESTREAM_USER = 7200;
//
//static NSInteger const TOURNAMENT_SHOW_LOBBY_KEYS_BUTTON_WIDTH = 120;
//static NSInteger const TOURNAMENT_SHOW_LOBBY_FRIENDS_BUTTON_WIDTH = 160;
//static NSInteger const TOURNAMENT_SHOW_LOBBY_SPIN_BUTTON_WIDTH = 180;
//
//static NSUInteger const LOBYY_MESSAGES_CELL_HEIGHT = 174;
//static NSString *const PRIORITY_CONSTANT = @"priority";
//
//static NSString *const DAYS_AFTER_TRIAL_SUBSCRIPTION = @"DAYS_AFTER_TRIAL_SUBSCRIPTION";
//
//static NSUInteger const DEFAULT_LOBBY_REQUIRED_SHOW_JOIN_COUNT = 3;
//static NSString *const SHOW_TOP_POP = @"GameTypeGameShowTopPop";
//static NSString *const SHOW_SWIPE = @"GameTypeGameShowSwipe";
//static NSString *const SHOW_FILM_FRENZY = @"GameTypeGameShowFilmFrenzy";
//static NSString *const SHOW_TCRUSH_BUTTON = @"GameTypeGameShowTCrushButton";
//static NSString *const SHOW_SOLD = @"GameTypeGameShowSold";
//static NSString *const SHOW_MUSIC_MANIA = @"GameTypeGameShowMusicMania";
//static NSString *const SHOW_TCRUSH_V2 = @"GameTypeGameShowTriviaCrushV2";
//static NSString *const SHOW_TRIVIA = @"GameTypeGameShowTrivia";
//static NSString *const SHOW_CRUSH = @"GameTypeGameShowCrush";
//static NSString *const SHOW_DRAWZZLE = @"GameTypeGameShowDrawzzle";
//static NSString *const SHOW_VIEW_EXP = @"GameTypeViewingExperienceWebView";
//static NSString *const SHOW_VIEW_EXP_SHOPPING = @"GameTypeViewingExperienceWebViewShopping";
//static NSString *const SHOW_WEB_SCORE = @"GameTypeGameShowWebViewScore";
//static NSString *const SHOW_ASK_AWAY = @"GameTypeGameShowAskAway";
//static NSString *const SHOW_FEATURED_SHOW = @"GameTypeGameShowFeatured";
//static NSString *const GAME_AUDIO_TRIVIA = @"GameTypeAudioTrivia";
//static NSString *const GAME_FAMILY_FEUD = @"GameTypeFamilyFeud";
//static NSString *const GAME_POP_TRIVIA = @"GameTypePopTrivia";
//static NSString *const GAME_HEADSHOT = @"GameTypeHeadshot";
//static NSString *const GAME_FEAT = @"GameTypeFeat";
//static NSString *const GAME_TRIVIA = @"GameTypeTrivia";
//static NSString *const GAME_CATEGORY_IRL = @"GameTypeCategoryIRL";
//static NSString *const GAME_JOYRIDE = @"GameTypeJoyRide";
//static NSString *const GAME_SHOW_RESERVED_COUNT_UPDATED = @"GAME_SHOW_RESERVED_COUNT_UPDATED";
//
//static NSString *const DEPRECATED_MONTHLY_PLAN_ID = @"com.kiwi.joyride.monthly.subscription.56keys.19.99";
//static NSString *const BASIC_WEEKLY_PLAN_ID = @"com.kiwi.joyride.basicWeeklyKeys1";
//static NSString *const WEEKLY_3_DAY_TRIAL_PLAN_ID = @"com.kiwi.joyride.freetrial.3day.weekly";
//static NSString *const YEARLY_PLAN_ID = @"com.kiwi.joyride.annual.subscription.730keys";
//static NSString *const BASIC_CONSUMABLE_PRODUCT_ID = @"com.kiwi.joyride.basicKeys";
//static NSString *const IS_APP_STORE_DATA_UPDATE = @"IS_APP_STORE_DATA_UPDATE";//dont change plz
//
//static NSString *const IS_LOCAL = @"IS_LOCAL";
//static NSString *const LOCAL = @"LOCAL";
//static NSString *const SCHEDULABLE_NOTIFICATIONS = @"SCHEDULABLE_NOTIFICATIONS";
//static NSString *const STREAK_TYPE = @"STREAK_TYPE";
//
//static NSInteger const TRIAL_DURATION_3_DAYS = 3;//dont change
//static NSInteger const TRIAL_DURATION_7_DAYS = 7;//dont change
//
//static NSInteger const GUEST_VIDEO_PREFFERENCE_ARRAY_SIZE = 4;
//
//#pragma mark mini game
//static NSString *const REMAINING_TIME = @"REMAINING_TIME";
//static NSString *const LAST_FREE_PLAY_TIME = @"LAST_FREE_PLAY_TIME";
//static NSString *const FREE_PLAY_COUNT = @"FREE_PLAY_COUNT";
//static NSString *const FREE_VIDEO_PLAY_COUNT = @"FREE_VIDEO_PLAY_COUNT";
//static NSString *const TOTAL_PLAY_COUNT_FOR_SUBS_POPUP = @"TOTAL_PLAY_COUNT_FOR_SUBS_POPUP";
//static NSString *const FREE_PLAY_ERROR = @"FREE_PLAY_ERROR";
//static NSString *const PLAY_ERROR = @"PLAY_ERROR";
//static NSString *const FREE_GAME_ATTEMPT = @"isFreeGameAttempt";
//static NSString *const FREE_VIDEO_GAME_ATTEMPT = @"isVieoPlayAttempt";
//static NSString *const SELECT_PLAY_ATTEMPT = @"isSelectGameAttempt";
//static NSString *const TOTAL_COUNT_OF_CONVERTED_VIDEOPLAY_TO_FREEPLAY_FOR_NEWBIE = @"TOTAL_COUNT_OF_CONVERTED_VIDEOPLAY_TO_FREEPLAY_FOR_NEWBIE";
//
//static NSString *const SELECT_POPUP_SHOWN_FOR = @"SELECT_POPUP_SHOWN_FOR";
//static NSString *const SELECT_PLAYED_FOR = @"SELECT_PLAYED_FOR";
//static NSString *const TOTAL_SELECT_PLAYED_FOR = @"TOTAL_SELECT_PLAYED_FOR";
//static NSString *const EPOCH_FOR_LAST_SELECT_PLAY = @"EPOCH_FOR_LAST_SELECT_PLAY";
//static NSString *const IS_SELECT_PLAY_POPUP_ACTIVE = @"IS_SELECT_PLAY_POPUP_ACTIVE";
//static NSString *const IS_FIRST_NOT_FREE_GAME = @"IS_FIRST_NOT_FREE_GAME";
//
//static NSString *const FREE_PLAY_THRESHOLD_FOR_SUBS_POPUP = @"FREE_PLAY_THRESHOLD_FOR_SUBS_POPUP";
//static NSString *const VIDEO_PLAY_THRESHOLD_FOR_SUBS_POPUP = @"VIDEO_PLAY_THRESHOLD_FOR_SUBS_POPUP";
//static NSString *const MINI_CASH_WIN_FOR_SUBS_POPUP = @"MINI_CASH_WIN_FOR_SUBS_POPUP";
//
//static NSString *const MINI_GAME_FINAL_REWARDS = @"MINI_GAME_FINAL_REWARDS";
//static NSString *const TAPJOY_VIDEO_ERROR = @"TAPJOY_VIDEO_ERROR";
//
////Will Add up these details
static NSString *const KIWI_P_D1_C1 = @"NuW9";
static NSString *const KIWI_P_D2_C1 = @"6N";
static NSString *const K_PARSER_D1_C2= @"cG5C";
static NSString *const K_PARSER_D2_C2= @"uz";
static NSString *const K_P_DETAILS1_C3= @"dd7c";
static NSString *const K_P_DETAILS2_C3= @"rf";
static NSString *const K_P_D1_CHUNK4= @"lBlg";
static NSString *const K_P_D2_CHUNK4= @"tr";
//
//static NSString *const GCLID = @"gclid";
//
//static NSString *const IMAGE_AND_TEXT_WITH_SWITCH_SETTING_CELL = @"ImageAndTextWithSwitchCell";
//static NSString *const IMAGE_AND_TEXT_WITH_SWITCH_BUTTON_CELL = @"ImageAndTextWithButtonCell";
//static NSString *const TEXT_SETTING_CELL = @"TextCell";
//
//static NSString *const CLIENT_ROOT_SCORE = @"rootScore";
//static NSString *const CLIENT_APP_VERSION = @"appVersion";
//
//static NSString *const MIN_USER_MACRO = @"{minUser}";
//static NSString *const GAME_TYPE_MACRO = @"{gametype}";
//static NSString *const BROADCASTER_NAME_MACRO = @"{broadcasterName}";
//
//static NSString *const VIDEO_CALL_LOCK_SETTING = @"VIDEO_CALL_LOCK_SETTING";
//static NSString *const VIMOJI_FILTER_TYPE = @"vimoji";
//static NSString *const GIFT_FILTER_TYPE = @"gift";
//static NSString *const VIDEO_FILTER_TYPE = @"video";
//
//static NSString *const IS_GIFTING_GUE_SHOWN = @"IS_GIFTING_GUE_SHOWN";
//
//static NSString *const CASH_CURRENCY = @"CASH";
//static NSString *const KEY_CURRENCY = @"KEY";
//
static NSString *const USER_DEFAULTS_APPENDER = @",";
////static NSString *const BROADCASTER_MUTED_USERS = @"broadcaster_muted_users";
//static NSString *const MUTED_BY_BROADCASTERS = @"muted_by_broadcasters";
//static NSString *const PUBNUB_EVENT_BROADCASTER_MUTED_USER = @"broadcaster_muted_user";
//static NSString *const BROADCASTER_USER_ID = @"broadcaster_user_id";
//
//static NSString *const MAGIC_CODE_TAG = @"mCode";
//static NSString *const MAGIC_CODE_TYPE_TAG = @"mType";
//static NSString *const MAGIC_CODE_EXPIRY_TAG = @"mExpiry";
//static NSString *const DEEPLINK_POPUP_NAME_TAG = @"pName";
//
//static NSInteger const CHALLENGER_HOSTED_SHOW_NUMBER = 3;
static NSInteger const KIWI_DOWN_TIME_STATUS_CODE = 459;
//
//static NSString *const LATEST_MARATHONSHOW_ID = @"latest-marathonshow";
//
//static NSString *const KEY_COUNT_STRING = @"{keyCount}";
//static NSString *const LIKE_COUNT_STRING = @"{likeCount}";
//
//static NSString *const GAME_TYPE = @"gameType";
//
//static NSString *const STRAIGHT_FACE_URL = @"STRAIGHT_FACE_URL";
//static NSString *const FACE_RECT = @"FACE_RECT";
//
//static NSString *const LOG_TEXT = @"LOG_TEXT";
//static NSString *const CTA_TEXT_KEY = @"ctaText";
//
//static CGFloat const AUDITION_PROGRESS_BAR_HEIGHT = 10.0 ;
//
//static NSString *const PURPOSE = @"purpose";
//static NSString *const PURPOSE_INFO = @"purposeInfo";
//static NSString *const ACTION = @"action";
//static NSString *const CURRENCY = @"currency";
//static NSString *const WALLET_RECHARGE = @"WALLET_RECHARGE";
//static NSString *const USER_WALLET = @"userWallet";
//static NSString *const PAYMENT_AMOUNT = @"paymentAmount";
//static NSString *const PAYMENT_CURRENCY = @"paymentCurrency";
//static NSString *const ERROR = @"error";
//
//static NSString *const AUDITION_ID = @"auditionId";
//static NSString *const CONTEST_ID = @"contestId";
//
//static NSString *const DIFF_DEVICE_ENV = @"DIFF_DEVICE_ENV";
//
//static NSString *const PG_INVITE_MESSAGE = @"privateGameInvite";
//
//static NSString *const ONLINE_TAG = @"Online";
//static NSString *const OFFLINE_TAG = @"Offline";

#endif /* CommonConstant_h */
