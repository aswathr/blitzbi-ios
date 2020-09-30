//
//  StringConstant.h
//  ArVideoDemo
//
//  Created by Anshul on 18/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#ifndef StringConstant_h
#define StringConstant_h

static NSString *const CONTINUE_BUTTON_TEXT = @"Continue";

static NSString *const VERIFIED_COUNTRY_ISO_CODE = @"VERIFIED_COUNTRY_ISO_CODE";
static NSString *const ABTEST_COUNTRY_ISO_CODE = @"ABTEST_COUNTRY_ISO_CODE";
static NSString *const USER_CURRENT_LANGUAGE_GROUP = @"USER_CURRENT_LANGUAGE_GROUP";
static NSString *const USER_SHOW_NOTIFICATION_SETTINGS = @"USER_SHOW_NOTIFICATION_SETTINGS";
static NSString *CONTACTS_ONCE_UPLOADED_FORCIBLY = @"CONTACTS_ONCE_UPLOADED_FORCIBLY";

static NSString *const SIGNIN_FAILED = @"SignIn Failed!";
static NSString *const USER_ID = @"userId";
static NSString *const AUTH_TOKEN = @"X-AUTH-TOKEN";
static NSString *const AUTH_TOKEN_V2 = @"X-AUTH-TOKEN-V2";
static NSString *const PLATFORM_CODE = @"platformCode";
static NSString *const COUNTRY_GROUP = @"countryGroup";
static NSString *const FROM_USER_ID = @"fromUserId";
static NSString *const BROADCASTER_ID = @"bId";
static NSString *const TO_USER_ID = @"toUserId";
static NSString *const EXTRA_DATA = @"extraData";
static NSString *const USER_MODEL = @"userModel";
static NSString *const SHARE_REFERAL_CODE = @"Share Referral Code";

static NSString *const VIRAL_INVITE_CONTACTS = @"viralInviteContacts";
static NSString *const APP_LAUNCH_NOTIFICATION_ID = @"appLaunchNotificationId";
static NSString *const NORMAL_APP_LAUNCH = @"-1";
static NSString *const LOCAL_NOTIFICATION_APP_LAUNCH = @"localNotification";
static NSString *const IS_NOT_SHOWN_LAUNCHPAD_BANNER_FIRST_TIME = @"isNotShownLaunchpadBannerFirstTime";

static NSString *const kGueViewManagerMilestoneKey = @"GueViewManagerMilestoneKey";
static NSString *const kLaunchpadGueViewManagerMilestoneKey = @"LaunchpadGueViewManagerMilestoneKey";
static NSString *const kHasSeenLaunchpadKey = @"kHasSeenLaunchpadKey";
static NSString *const kHasAppliedFilterKey = @"kHasAppliedFilterKey";
static NSString *const kShouldShowGueToUser = @"kShouldShowGueToUser";
static NSString *const kLpGueCompleted = @"kLpGueCompleted";
static NSString *const kGameshowGueCompleted = @"kGameshowGueCompleted";
static NSString *const kVideoCallMessageGueCompleted = @"kVideoCallMessageGueCompleted";
static NSString *const kIsHostGueActive = @"kIsHostGueActive";
static NSString *const kHasAppliedVimoji = @"kHasAppliedVimoji";
static NSString *const kIsSelfieGifNotFirstTime = @"kIsSelfieGifNotFirstTime";

static NSString *const BLOCKER_USER_ID = @"blockerUserId";
static NSString *const FRIEND_USER = @"friendUser";
static NSString *const FOLLOW_USER = @"followUser";
static NSString *const IS_USER_BANNED = @"isUserBanned";
static NSString *const DAY_1_RETENTION_CHECKED = @"day1RetentionChecked";
static NSString *const EVENT = @"event";
static NSString *const GAME_SHOW_ID = @"gameShowId";
static NSString *const PARTICIPANT_INFO_MODIFIED_EVENT = @"participantInfoModified";
static NSString *const PARTICIPANT_JOINED_EVENT = @"participantJoined";
static NSString *const PARTICIPANT_LEFT_EVENT = @"participantLeft";

static NSString *const CROWN_TIER = @"crownTier";
static NSString *const BROADCASTER_TIER = @"broadcasterTier";

static NSString *const SESSION_ID = @"sessionId";
static NSString *const SESSION_BUCKET = @"sessionBucket";
static NSString *const SESSION_STATE = @"sessionState";
static NSString *const SESSION_USERS = @"sessionUsers";
static NSString *const SESSION_USERS_INFO = @"sessionUsersInfo";
static NSString *const FILTER_ID = @"filterId";
static NSString *const VIMOJI_FILTER_ID = @"vimojiFilterId";
static NSString *const VIMOJI_ASSET_ID = @"vimojiAssetId";
static NSString *const PLAYER_STATE = @"playerState";
static NSString *const GAME_TYPE_STRING = @"gameType";
static NSString *const IS_LOCKED = @"isLocked";
static NSString *const IS_PARTY_ROOM = @"isPartyRoom";
static NSString *const ROOM_ID = @"roomId";
static NSString *const ROOM_TITLE = @"roomTitle";
static NSString *const ROOM_CATEGORY = @"roomCategory";
static NSString *const LOCK_UNLOCK = @"LOCK_UNLOCK";
static NSString *const PUBNUB_SOCIAL_DISCOUNT_USED = @"PUBNUB_SOCIAL_DISCOUNT_USED";
static NSString *const PIXELATION_MESSAGE = @"PIXELATION_MESSAGE";
static NSString *const IS_PIXELATED = @"isPixelated";
static NSString *const PIXELATION_EPOCH = @"pixelationEpoch";
static NSString *const PARTY_ROOM_ADD_SESSION = @"partyRoomAddSession";
static NSString *const PARTY_ROOM_REMOVE_SESSION = @"partyRoomRemoveSession";
static NSString *const PARTY_ROOM_UPDATE_SUBSCRIBERS = @"partyRoomUpdateSubscribers";
static NSString *const SUBSCRIBERS_COUNT = @"subscribersCount";
static NSString *const WILL_CREATE_NEW_SESSION = @"willCreateNewSession";
static NSString *const LEFT_ALONE_IN_SESSION = @"leftAloneInSession";

static NSString *const COLLECTABLES_REFRESH = @"collectableRefresh";
static NSString *const COLLECTABLES_KEY = @"collectables";
static NSString *const EVENTS_REFRESH_DIFF = @"eventRefreshDiff";
static NSString *const EVENTS_REFRESH_DELETE = @"eventDelete";
static NSString *const GAME_SHOW_CREATED = @"GAME_SHOW_CREATED";
static NSString *const NEWBIE_GAME_SHOW_CREATED = @"NEWBIE_GAME_SHOW_CREATED";
static NSString *const GAME_SHOW_UPDATED = @"GAME_SHOW_UPDATED";
static NSString *const GAME_SHOW_DELETED = @"GAME_SHOW_DELETED";
static NSString *const EVENTS_KEY = @"events";


static NSString *const PUBNUB_EVENT_FRIEND_REQUEST_INITIATED = @"friendRequestInitiated";
static NSString *const PUBNUB_EVENT_FRIEND_REQUEST_ACCEPTED = @"friendRequestAccepted";
static NSString *const PUBNUB_EVENT_FRIEND_REQUEST_REJECTED = @"friendRequestRejected";
static NSString *const PUBNUB_EVENT_CONTACT_BECAME_FRIEND = @"contactBecameFriend";
static NSString *const PUBNUB_EVENT_UNFRIENDED = @"unfriended";
static NSString *const PUBNUB_EVENT_USER_JOIN = @"userJoin";
static NSString *const PUBNUB_EVENT_ADD_TO_GAME_SHOW = @"addToGameShow";
static NSString *const PUBNUB_EVENT_FOLLOW = @"followEvent";
static NSString *const PUBNUB_EVENT_UNFOLLOW = @"unfollowEvent";

static NSString *const VISIBILITY_RESTRICTED = @"restricted";
static NSString *const QUALIFICATION_KEY_DEEPLINK = @"DEEPLINK";
static NSString *const DEEPLINK_FEATURE_NAME = @"fName";
static NSString *const DEEPLINK_FEATURE_INVITE = @"invite";
static NSString *const DEEPLINK_FEATURE_MAGIC_LINK = @"magicLink";
static NSString *const DEEPLINK_FEATURE_DIRECT = @"direct";
static NSString *const DEEPLINK_PRIVATE_GAME_INVITE = @"privateGames";

static NSString *const GAME_SHOW_END = @"gameShowEnd";
static NSString *const GAME_INFO_TAG = @"gameInfoTag";

static NSString *const TOURNAMENT_SHOW_RESOURCE_PERMISSION_GIVEN = @"TOURNAMENT_SHOW_KEY_PERMISSION_GIVEN";
static NSString *const TOURNAMENT_SHOW_RESOURCE_PERMISSION_NOT_GIVEN = @"TOURNAMENT_SHOW_KEY_PERMISSION_NOT_GIVEN";

/************Rollout features*****************/
static NSString *const LOG_SERVER_TO_SQS_ROLLOUT = @"log_server_to_sqs_rollout";

/************TOKBOX SESSION STATES START*****************/
static NSString *const TOKBOX_SESSION = @"tokboxSession";
static NSString *const TOKBOX_SESSION_STATE = @"tokboxSessionState";
static NSString *const TOKBOX_SESSION_CONNECTED = @"tokboxSessionConnected";
static NSString *const TOKBOX_SESSION_PARTICIPANT_CONNECTED = @"tokboxSessionParticipantConnected";
static NSString *const TOKBOX_SESSION_PUBLISHED = @"tokboxSessionPublish";
static NSString *const TOKBOX_SESSION_STARTED_SUBSCRIPTION = @"tokboxSessionStartedSubscription";
static NSString *const TOKBOX_SESSION_SUBSCRIBED = @"tokboxSessionSubscribed";
static NSString *const TOKBOX_SESSION_DISCONNECTED = @"tokboxSessionDisconnected";
/************TOKBOX SESSION STATES END*****************/

static NSString *const TOKBOX_STREAM = @"tokboxStream";
static NSString *const TOKBOX_SUBSCRIBER_TIMER = @"tokboxSubscriberTimer";

//User Data params
static NSString *const PROFILE_IMAGE = @"profileImage";
static NSString *const SHARD = @"shard";
static NSString *const DISPLAY_NAME = @"displayName";
static NSString *const USER_DIGITS_ID = @"userDigitsId";
static NSString *const IS_NEW = @"isNew";
static NSString *const PHONE = @"phone";
static NSString *const EMAIL = @"email";
static NSString *const USERNAME = @"userName";
static NSString *const SERVER_EPOCHTIME_AT_START = @"serverEpochTimeAtStart";
static NSString *const LAST_LOGIN_TIME = @"lastLoginTime";

static NSString *const IS_FAILED = @"isFailed";
static NSString *const IS_RESET = @"isReset";
static NSString *const APIKEY = @"apiKey";
static NSString *const TOKEN = @"token";

static NSString *const USER_INFO = @"userInfo";
static NSString *const USER_DATA = @"userData";
static NSString *const USER_YTLIVESTATE = @"sessionYTLiveState";
static NSString *const USER_YTBROADCASTURL = @"sessionYTBroadcastUrl";
static NSString *const USER_IS_ACTIVE = @"isActive";
static NSString *const SOCIAL_DISCOUNT_PROVIDER_SHOW = @"SOCIAL_DISCOUNT_PROVIDER_SHOW";
static NSString *const USER_JOIN_TIME = @"joinTime";

static NSString *const USER_FB_LIVE_STATE = @"sessionFbLiveState";
static NSString *const USER_FB_BROADCAST_URL = @"sessionFbBroadcastUrl";

static NSString *const LS_API_TITLE_TAG = @"title";
static NSString *const LS_API_DESCRIPTION_TAG = @"description";
static NSString *const LS_API_START_TIME_TAG = @"startTime";
static NSString *const LS_API_PLATFORM_TAG = @"platform";
static NSString *const LS_API_PRIVACY_TAG = @"privacy";
static NSString *const LS_API_FACEBOOK_TAG = @"FACEBOOK";
static NSString *const LS_API_PUBLIC_TAG = @"PUBLIC";
static NSString *const FB_LIVESTREAM_INFO_POPUP_TEXT = @"The stream will start 15 seconds before the show starts";
static NSString *const FB_LIVESTREAM_OKAY_BUTTON_TEXT = @"Okay";
static NSString *const SERVER_ERROR_POPUP_TITLE = @"Server Error";
static NSString *const FB_LIVESTREAM_API_ERROR_POPUP_TEXT = @"Whoops! Looks like there’s an issue with our servers. Please try again.";
static NSString *const FB_LIVESTREAM_DISMISS_BUTTON_TEXT = @"Dismiss";

//static NSString *const ALONE_STATE = @"Alone";
//static NSString *const GROUP_STATE = @"Group";
//static NSString *const GAME_STATE = @"Game";

static NSString *const CONTACTS_UPLOADED_TO_DIGITS = @"contactsUploadedToDigits";
static NSString *const CONTACTS_UPLOADED_TO_SERVER = @"contactsUploadedToServer";
static NSString *const CONTACTS_UPLOADED_TO_BI = @"contactsUploadedToBi";
static NSString *const UPLOAD_CONTACTS_FOR_BI_KEY = @"upload_contacts_for_bi";

static NSString *const FETCHING_FRIENDS = @"Wait for it...";

#pragma lp InviteFriends
static NSString *const INVITE_FRIENDS_MESSAGE = @"Hey, check out Joyride with me!";
static NSString *const INVITE_WITH_MUTUAL_FRIENDS_MESSAGE = @"We are having so much fun playing - come join us";

#pragma status lp Messages
static NSString *const INVITE_FRIEND_STATUS_MESSAGE = @"Tap 🎁  to add your friends!";
static NSString *const SENT_HI_STATUS_MESSAGE = @"You said hi to <USER>";
static NSString *const NO_FRIENDS_ONLINE_STATUS_MESSAGE = @"Say hi to start chatting!";
static NSString *const HAS_ONLINE_FRIENDS_STATUS_MESSAGE = @"Tap on your friends to jump in 👯";
static NSString *const FRIEND_CAME_ONLINE_STATUS_MESSAGE = @"<USER> just jumped in!";

static NSString *const TWTR_NETWORKING_STATUS_CODE = @"TWTRNetworkingStatusCode";

static NSString *const CONTACT_LIST_SIZE = @"ContactListSize";

static NSString *const RESTART_APPLICATION = @"Restart Application";
static NSString *const RESTART_APPLICATION_MESSAGE = @"Please restart application for changes to take effect";

static NSString *const ENVIRONMENT_KEY = @"environment_key";
static NSString *const LOG_TO_FILE_KEY = @"log_to_file";
static NSString *const IS_TRIVIA_GAME_ENABLED = @"_IS_TRIVIA_GAME_ENABLED";
static NSString *const NO_TRIGGER_KEY = @"no trigger";

static NSString *const TRIGGER_IS_MOUTH_OPENED = @"isMouthOpened";
static NSString *const TRIGGER_IS_MOUTH_CLOSED = @"isMouthClosed";
static NSString *const TRIGGER_IS_OPEN_EYES = @"isOpenEyes";
static NSString *const TRIGGER_IS_CLOSED_EYES = @"isCloseEyes";
static NSString *const TRIGGER_IS_WINK = @"isWinkAny";
static NSString *const TRIGGER_IS_WINK_LEFT = @"isLeftWink";
static NSString *const TRIGGER_IS_WINK_RIGHT = @"isRightWink";
static NSString *const TRIGGER_IS_FURROWED = @"isFurrowed";
static NSString *const TRIGGER_IS_BROWS_RAISED = @"isBrowsRaised";
static NSString *const TRIGGER_IS_EYES_BLINKING = @"isEyesBlinking";
static NSString *const TRIGGER_IS_PURSED_LIPS = @"isPursedLips";
static NSString *const TRIGGER_IS_HEAD_DOWN = @"isHeadDown";
static NSString *const TRIGGER_IS_HEAD_DOWN_ONE = @"isHeadDownOne";
static NSString *const TRIGGER_IS_HEAD_RAISED = @"isHeadRaised";
static NSString *const TRIGGER_IS_HEAD_NOD = @"isHeadNod";
static NSString *const TRIGGER_IS_HEAD_TURNED_LEFT = @"isHeadTurnLeft";
static NSString *const TRIGGER_IS_HEAD_TURNED_LEFT_ONE = @"isHeadTurnLeftOne";
static NSString *const TRIGGER_IS_HEAD_TURNED_RIGHT = @"isHeadTurnRight";
static NSString *const TRIGGER_IS_HEAD_TURNED_RIGHT_ONE = @"isHeadTurnRightOne";
static NSString *const TRIGGER_IS_HEAD_STRAIGHT = @"isHeadStraight";
static NSString *const TRIGGER_IS_WAVING_HEAD = @"isWavingHead";
static NSString *const TRIGGER_IS_FACE_NORMAL = @"isFaceNormal";
static NSString *const TRIGGER_IS_SAD = @"isSad";
static NSString *const TRIGGER_IS_ANGRY = @"isAngry";
static NSString *const TRIGGER_IS_HAPPY = @"isHappy";
static NSString *const TRIGGER_ARE_EYES_NARROW = @"areEyesNarrow";
static NSString *const TRIGGER_ARE_EYES_WIDE_OPEN = @"areEyesWideOpen";

#pragma datamodel params
static NSString *const TRIGGER_START_KEY = @"Start Trigger";
static NSString *const TRIGGER_START_INTERVAL_KEY = @"Start Trigger Interval";
static NSString *const TRIGGER_STOP_KEY = @"Stop Trigger";
static NSString *const PARAM_X_COORD = @"X Coord";
static NSString *const PARAM_Y_COORD = @"Y Coord";
static NSString *const PARAM_IMAGE_NAME = @"Image Name";
static NSString *const PARAM_CENTRAL_LANDMARK_POINT = @"Central Landmark Point";
static NSString *const PARAM_ART_TYPE = @"Art Type";
static NSString *const PARAM_ANIMATION_COUNT = @"Animation Count";
static NSString *const PARAM_LANDMARK_POINT_TYPE = @"Landmark Point Type";
static NSString *const PARAM_NINE_PATCH = @"Nine Patch";
static NSString *const PARAM_PATCH_TOP = @"Patch Top";
static NSString *const PARAM_PATCH_LEFT = @"Patch Left";
static NSString *const PARAM_PATCH_BOTTOM = @"Patch Bottom";
static NSString *const PARAM_PATCH_RIGHT = @"Patch Right";
static NSString *const PARAM_LOOP_COUNT = @"Loop Count";
static NSString *const PARAM_DELAY_VALUE = @"Delay Value";
static NSString *const PARAM_RANDOM_DELAY = @"Random Delay";
static NSString *const PARAM_ANIMATION_DURATION = @"Animation Duration";
static NSString *const PARAM_RANDOM_POSITION = @"Random Position";
static NSString *const PARAM_MIN_X_COORD = @"Min X Coord";
static NSString *const PARAM_MIN_Y_COORD = @"Min Y Coord";
static NSString *const PARAM_FIXED_FRAME_NO = @"Fixed Frame No";
static NSString *const PARAM_SPEED_VARIABLE = @"Speed Variable";
static NSString *const PARAM_Z_ORDER = @"Z Order";
static NSString *const PARAM_IMAGE_SCALE = @"Image Scale";
static NSString *const PARAM_MIN_IMAGE_SCALE = @"Min Image Scale";
static NSString *const PARAM_IMAGE_SCALE_DURATION = @"Scale Duration";
static NSString *const PARAM_SCALE_EFFECT = @"Scale Effect";
static NSString *const PARAM_EYE_SCALE = @"Eye Scale";
static NSString *const PARAM_FACE_SCALE = @"Face Scale";
static NSString *const PARAM_CHIN_SCALE = @"Chin Scale";
static NSString *const PARAM_NOSE_SCALE = @"Nose Scale";
static NSString *const PARAM_EYE_BAGS_SMOOTH_SCALE = @"Eye Bag Smooth Scale";
static NSString *const PARAM_MOUTH_SCALE = @"Mouth Scale";
static NSString *const PARAM_ANCHOR_TYPE = @"Anchor Type";
static NSString *const PARAM_RENDER_SCREEN = @"Render Screen";
static NSString *const PARAM_CAMERA_MODE = @"Camera Mode";
static NSString *const PARAM_RANDOM_GROUP = @"Random Group";
static NSString *const PARAM_AUDIO_TRIGGER = @"Audio Trigger";
static NSString *const PARAM_TARGET_FILTER = @"Target Filter";
static NSString *const PARAM_IGNORE_START_TRIGGER = @"Ignore Start Trigger";
static NSString *const PARAM_CROPPED_PIXELS = @"croppedPixels";

static NSString *const EFC = @"efc";
static NSString *const FMF = @"fmf";
static NSString *const TXT = @"txt";
static NSString *const PNG = @"png";
static NSString *const OBJ = @"obj";
static NSString *const SKS = @"sks";
static NSString *const ZIP = @"zip";
static NSString *const WAV = @"wav";
static NSString *const NONE = @"None";
static NSString *const SINEWAVE = @"SineWave";
static NSString *const COSINEWAVE = @"CosineWave";
static NSString *const TRIANGULARWAVE = @"TriangularWave";
static NSString *const ALWAYS = @"Always";
static NSString *const SELFIEVIEW = @"SelfieView";
static NSString *const CHATVIEW = @"ChatView";
static NSString *const BOTH = @"Both";
static NSString *const FRONTCAM = @"FrontCam";
static NSString *const REARCAM = @"RearCam";

static NSString *const kAppParamsKey = @"kAppParamsKey";
static NSString *const kQATableViewControllerID = @"QATableViewControllerID";
static NSString *const kSplashScreenViewControllerID = @"SplashScreenViewControllerID";

static NSString *const ITUNES_APPLE_COM = @"itunes.apple.com";

static NSString *const SESSION_STATE_HANDLER = @"SESSION_STATE_HANDLER";
static NSString *const LAUNCHPAD = @"LAUNCHPAD";
static NSString *const ONRESUME_APPMANAGER = @"ONRESUME_APPMANAGER";
static NSString *const ONRESUME_ERROR_HANDLER = @"ONRESUME_ERROR_HANDLER";
static NSString *const VIDEO_ERROR = @"VIDEO_ERROR";

static NSString *const CHANNEL_EMPTY = @"CHANNEL_EMPTY";
static NSString *const FOR_PARTY_ROOM = @"forPartyRoom";
static NSString *const LIVE_PLATFORM = @"livePlatform";
static NSString *const USER_BLOCK_INFO_KEY = @"USER_BLOCK_INFO";

static NSString *const ROOM_STATUS_CONNECTING = @"connecting...";
static NSString *const ROOM_STATUS_AWAY = @"voice only";
static NSString *const ROOM_STATUS_MUTE = @"Mute";
//static NSString *const PARTY_ROOM_STATUS_CONNECTING = @"Connecting you to a public party room!";

static NSString *const ERROR_POPUP_TYPE = @"ERROR_POPUP_TYPE";

static NSString *const SUBSCRIBER = @"SUBSCRIBER";
static NSString *const DEFAULT = @"default";
static NSString *const RATING = @"rating";

static NSString *const NPS_RATING_TITLE = @"How likely are you to recommend Joyride to a friend?";

static NSString *const GAME_JOINED_IN_BETWEEN = @"GAME_JOINED_IN_BETWEEN";
static NSString *const GAME_SELF_INITIATED = @"GAME_SELF_INITIATED";
static NSString *const FACEBOOK_SHARE_PERMISSION_MSG_SHOWN = @"facebookSharePermissionMsgShown";

static NSString *const RETRY_COUNT = @"retryCount";
static NSString *const IS_GAME_MODERATOR = @"IS_GAME_MODERATOR";

static NSString *const ANCHOR_TYPE_POSITION_NONE = @"NONE";
static NSString *const ANCHOR_TYPE_POSITION_LEFT_TOP = @"LEFT_TOP";
static NSString *const ANCHOR_TYPE_POSITION_TOP = @"TOP";
static NSString *const ANCHOR_TYPE_POSITION_RIGHT_TOP = @"RIGHT_TOP";
static NSString *const ANCHOR_TYPE_POSITION_LEFT = @"LEFT";
static NSString *const ANCHOR_TYPE_POSITION_RIGHT = @"RIGHT";
static NSString *const ANCHOR_TYPE_POSITION_LEFT_BOTTOM = @"LEFT_BOTTOM";
static NSString *const ANCHOR_TYPE_POSITION_BOTTOM = @"BOTTOM";
static NSString *const ANCHOR_TYPE_POSITION_RIGHT_BOTTOM = @"RIGHT_BOTTOM";

static NSString *const VOICE_TEXT = @"VOICE_TEXT";
static NSString *const COMMA_SEPERATED_DELIMITER = @",";
static NSString *const CONSOLE_OUTPUT_LOG_FILE = @"console.log";

static NSString *const PARTY_ROOM_PASSIVE_FIRST_TIME_SEEN = @"PARTY_ROOM_PASSIVE_FIRST_TIME";
static NSString *const BIRTHDATE_UNDER_AGE_TITLE_TEXT = @"Not Eligible to Joyride";
static NSString *const BIRTHDATE_UNDER_AGE_TEXT = @"Sorry! Looks like you're not eligible to use Joyride but thanks for checking us out!";
static NSString *const BIRTHDATE_SUBMIT_BUTTON_TEXT = @"Okay";
static NSString *const BIRTHDATE_SUBMIT_FORMAT = @"MM-dd-yyyy";
static NSString *const BIRTHDATE_SUBMIT_FORMAT_SERVER = @"yyyy-MM-dd";
static NSString *const FIRST_NAME_TEXT = @"FIRST NAME";
static NSString *const LAST_NAME_TEXT = @"LAST NAME";
static NSString *const USERNAME_TEXT = @"USERNAME";
static NSString *const BIRTHDAY_TEXT = @"BIRTHDAY";
static NSString *const DATE_PICKER_DONE_BUTTON_TEXT = @"Done";
static NSInteger const NOT_ELIGIBLE_TO_JOYRIDE_AGE = 13;
static NSString *const BIRTHDAY_DEFAULT_DEBUG_VALUE = @"01-01-1970";

static NSString *const REMOVED_FROM_CALL_POPUP_TITLE = @"Try Joining Again!";
static NSString *const REMOVED_FROM_CALL_POPUP_DESC = @"There was an issue with your connection. Please try joining the room again.";

static NSString *const BANNED_POPUP_TITLE = @"Account Suspended";
static NSString *const BANNED_POPUP_CTA_TEXT = @"Dismiss";
static NSString *const BANNED_POPUP_DESC = @"Your account has been suspended. Email help@onjoyride.com if you believe this message is in error.";
static NSString *const FRIEND_REQUEST_STATUS_INITIATED = @"initiated";
static NSString *const FRIEND_REQUEST_STATUS_ACCEPTED = @"accepted";
static NSString *const FRIEND_REQUEST_STATUS_REJECTED = @"rejected";
static NSString *const GET_FRIENDNETWORK_DATA_FROM_SERVER_IMMEDIATELY = @"GET_FRIENDNETWORK_DATA_FROM_SERVER_IMMEDIATELY";

static NSInteger const FB_EDUCATION_MIN_AGE = 13;
static NSInteger const FB_EDUCATION_MAX_AGE = 22;
static NSInteger const FB_EDUCATION_SCHOOL_TO_COLLEGE = 17;
static NSString *const FIND_YOUR_HIGH_SCHOOL = @"Find your School?";
static NSString *const FIND_YOUR_COLLEGE = @"Find your College?";

static NSString *const JUST_BECAME_FRIEND = @"Just became friend!";
static NSString *const BECAME_FRIEND_TIME_AGO = @"Became friend %@ ago!";

static NSString *const FRIENDREQUEST_ACCEPTED_STATUS = @"accepted";
static NSString *const FRIENDREQUEST_REJECTED_STATUS = @"rejected";
static NSString *const SESSION_LIVE_STREAMING_MSG = @"Hey!";
static NSString *const SESSION_IS_LIVE_STREAMING = @"Session is live streaming. Do you want to join?";
static NSString *const JOIN_POPUP_BUTTON = @"Join";
static NSString *const CANCEL_POPUP_BUTTON = @"Cancel";

static NSString *const NEW_KID_LIVE_STREAMING = @"New user is Live Streaming";
static NSString *const VERSION_KEY = @"VersionKey";
static NSString *const MUTE_POPUP_VIEW_COUNT = @"MutePopupViewCount";
static NSString *const VERSION_KEY_PREFIX = @"version_key_";

static NSString *const BI_STATE_SHOWN = @"shown";
static NSString *const BI_STATE_LP_PRESENT = @"not_show_lp_present";
static NSString *const BI_STATE_NOT_SHOW_HI = @"not_show_hi";
static NSString *const BI_STATE_IN_SESSION = @"not_show_in_session";
static NSString *const BI_STATE_SENDER_NOT_ONLINE = @"sender_not_online";
static NSString *const BI_STATE_SENDER_NOT_IN_PARTYROOM = @"sender_not_in_partyroom";
static NSString *const BI_STATE_SENDER_NOT_IN_SESSION = @"sender_not_in_session";
static NSString *const BI_STATE_NOT_SHOW_FRIEND_REQUEST_INITIATED = @"not_show_friend_request_initiated";
static NSString *const BI_STATE_NOT_SHOW_FRIEND_REQUEST_ACCEPTED = @"not_show_friend_request_accpeted";
static NSString *const BI_STATE_NOT_SHOW_CONTACT_BECAME_FRIEND = @"not_show_contact_became_friend";
static NSString *const BI_STATE_NOT_SHOW_UNFRIENDED = @"not_show_unfriended";
static NSString *const BI_STATE_NOT_SHOW_NO_APNS = @"not_show_no_apns";
static NSString *const BI_STATE_NOT_SHOW_GAME_SHOW_LIVE = @"not_show_game_show_live";
static NSString *const BI_STATE_NOT_SHOW_FRIEND_IN_SESSION = @"not_show_friend_in_session";
static NSString *const BI_STATE_NOT_SHOW_NOTIFICATION_DISABLED = @"not_show_notification_disabled";
static NSString *const BI_STATE_NOT_SHOW_SENDER_SELF = @"not_show_sender_self";
static NSString *const BI_STATE_NOT_SHOW_LOCAL_NOTIFICATION = @"not_show_local_notification";

static NSString *const URL_VARIABLE_FROM_USER_ID = @":fromUserId";
static NSString *const URL_VARIABLE_FRIEND_USER_ID = @":friendUserId";
static NSString *const URL_VARIABLE_FRIEND_USER_NAME = @":friendUserName";
static NSString *const URL_VARIABLE_REQUEST_STATUS = @":requestStatus";

static NSString *const USER_OFFSET_KEY = @"USER_OFFSET_KEY";
static NSString *const USER_BFF_OFFSET_KEY = @"USER_BFF_OFFSET_KEY";

static NSString *const LP_LOCKED_ROOM_ICON = @"lpLockedRoomIcon";
static NSString *const LP_UNIVERSITY_PUBLIC_ROOM_ICON = @"lpUniversityPublicRoomIcon";

static NSString *const LP_SCHOOL_PLACEHOLDER_GRAPHIC = @"schoolPlaceholderGraphic";
static NSString *const LP_PRIVATE_ROOM_TEXT = @"is Private";

#pragma mark overflow menu items
static NSString *const OVERFLOW_MENU_MIC_DEFAULT = @"Mute My Mic";
static NSString *const OVERFLOW_MENU_MIC_MUTED = @"Mic Muted";
static NSString *const OVERFLOW_MENU_FLIP_CAMERA = @"Flip Camera";
static NSString *const OVERFLOW_MENU_ROOM_PUBLIC = @"Make Room Private";
static NSString *const OVERFLOW_MENU_ROOM_PRIVATE = @"Room is Private";
static NSString *const OVERFLOW_MENU_STREAM_YOUTUBE = @"Stream to Youtube";
static NSString *const OVERFLOW_MENU_STREAMING_YOUTUBE = @"Streaming to Youtube";
static NSString *const OVERFLOW_MENU_STREAM_FACEBOOK = @"Stream to Facebook";
static NSString *const OVERFLOW_MENU_STREAMING_FACEBOOK = @"Streaming to Facebook";
static NSString *const OVERFLOW_MENU_TAG = @"overflow_menu";
static NSString *const OVERFLOW_MENU_REPORT = @"Report Abuse";
static NSString *const OVERFLOW_MENU_BAN_INFLUENCER = @"Ban Influencer";

static NSString *const REPORT_VIDEO = @"Block Video";
static NSString *const REPORT_USER = @"Block";

static NSString *const MUTE_UNMUTE_ITEM = @"muteUnmuteItem";
static NSString *const FLIP_CAMERA_ITEM = @"flipCameraItem";
static NSString *const TOGGLE_PRIVACY_ITEM = @"togglePrivacyItem";
static NSString *const YOUTUBE_STREAM_ITEM = @"youtubeStreamItem";
static NSString *const FACEBOOK_STREAM_ITEM = @"facebookStreamItem";
static NSString *const REPORT_ABUSE_ITEM = @"reportAbuseItem";
static NSString *const HOST_VOLUME_CONTROL = @"HOST_VOLUME_CONTROL";

#pragma mark For Streaming Strings
static NSString *const FACEBOOK_STR = @"Facebook";
static NSString *const YOUTUBE_STR = @"YouTube";

static NSString *const PUB_NUB_CURRENT_FRIENDS = @"PubNubCurrentFriends";
static NSString *const CURRENT_FRIENDS = @"CurrentFriends";

static NSString *const PRIVATE_ROOM_IN_APP_NOTIFICATION_TEXT = @" made the room private";
static NSString *const PRIVATE_ROOM_PUBLIC_IN_APP_NOTIFICATION_TEXT = @" made the room public";
static NSString *const PARTICIPANT_BLOCKED_TEXT = @"Blocked";
static NSString *const PARTICIPANT_ADD_FRIEND_TEXT = @"+ Add Friend";
static NSString *const SENT = @"Sent";
static NSString *const USER_COUNT_IN_SESSION = @"userCountInSession";
static NSString *const IS_PARTICIPANT_GLOABL_HOST = @"isParticipantGlobalHost";

#pragma mark popup string constants
static NSString *const PERMISSION_POPUP = @"permission_popup";
static NSString *const SYSTEM_POPUP = @"system_popup";
static NSString *const PRE_ASK_POPUP = @"PRE_ASK_POPUP";
static NSString *const BLOCKING_NAGGING_POPUP = @"BLOCKING_NAGGING_POPUP";
static NSString *const NON_BLOCKING_NAGGING_POPUP = @"NON_BLOCKING_NAGGING_POPUP";

#pragma mark Friending event constants
static NSString *const FRIENDING_TAG = @"friending";
static NSString *const FRIEND_USER_ID_TAG = @"friend_user_id";
static NSString *const USER_ACTION_TAG = @"user_action";
static NSString *const TOKBOX_SESSION_ID_TAG = @"tokbox_session_id";
static NSString *const RECOMMENDED_CATEGORY_TAG = @"recommended_category";
static NSString *const FRIENDING_MESSAGE_TAG = @"friending_message";
static NSString *const FRIENDING_ACTION_CONTACT_BECAME_FRIEND = @"ContactBecameFriend";
static NSString *const FRIENDING_ACTION_AUTO_FRIEND = @"AutoFriend";
static NSString *const FRIENDING_ACTION_ADD = @"Add";
static NSString *const FRIENDING_ACTION_REJECT = @"Reject";
static NSString *const FRIENDING_ACTION_REMOVE = @"Remove";
static NSString *const FRIENDING_ACTION_ACCEPT = @"Accept";
static NSString *const FRIENDING_ACTION_MUTENOTIFICATION = @"Mutenotification";
static NSString *const FRIENDING_ACTION_UNMUTENOTIFICATION = @"Unmutenotification";
static NSString *const SETTINGS_ACTION_ENABLE_FRIENDS_NOTIFICATION = @"friends_notification_enable";
static NSString *const SETTINGS_ACTION_DISABLE_FRIENDS_NOTIFICATION = @"friends_notification_disable";
static NSString *const SETTINGS_ACTION_ENABLE_GROUPS_NOTIFICATION = @"groups_notification_enable";
static NSString *const SETTINGS_ACTION_DISABLE_GROUPS_NOTIFICATION = @"groups_notification_disable";
static NSString *const SETTINGS_ACTION_ENABLE_SHOWS_NOTIFICATION = @"shows_notification_enable";
static NSString *const SETTINGS_ACTION_DISABLE_SHOWS_NOTIFICATION = @"shows_notification_disable";
static NSString *const SETTINGS_ACTION_ENABLE_AUDITIONS_NOTIFICATION = @"auditions_notification_enable";
static NSString *const SETTINGS_ACTION_DISABLE_AUDITIONS_NOTIFICATION = @"auditions_notification_disable";
static NSString *const SETTINGS_ACTION_ENABLE_VIMOJI = @"vimoji_enable";
static NSString *const SETTINGS_ACTION_DISABLE_VIMOJI = @"vimoji_disable";
static NSString *const SETTINGS_ACTION_ENABLE_ADMIN = @"admin_enable";
static NSString *const SETTINGS_ACTION_DISABLE_ADMIN = @"admin_disable";

#pragma mark Friend center open events
static NSString *const FRIEND_CENTER_OPEN_TAG = @"friend_center_open";
static NSString *const FRIEND_REQ_COUNT_TAG = @"friendReqCount";
static NSString *const FRIEND_CENTER_SOURCE_TAG = @"source";
static NSString *const REMOVED_SUGGESTIONS = @"removedSuggestions";
static NSString *const REMOVED_CONTACTS_ON_JOYRIDE = @"removedContactsOnJoyride";
static NSString *const ALREADY_SEEN_FRIEND_REQUESTS = @"seenRequests";

#pragma mark Friend center close events
static NSString *const FRIEND_CENTER_CLOSE_TAG = @"friend_center_close";
static NSString *const TIME_SPENT_TAG = @"time_spent";
static NSString *const INVITES_SENT_TAG = @"invites_sent";
static NSString *const FRIEND_REQ_SENT_TAG = @"friend_req_sent";
static NSString *const FRIEND_REQ_ACCEPTED_TAG = @"friend_req_accepted";
static NSString *const FRIEND_REQ_REJECTED_TAG = @"friend_req_rejected";
static NSString *const IS_FACEBOOK_CLICK_TAG = @"is_facebook_click";
static NSString *const FOLLOW_SENT_TAG = @"follows_sent";
static NSString *const UNFOLLOW_SENT_TAG = @"unfollows_sent";


static NSString *const ADD_FRIEND = @"Add Friend";

static NSString *const GHOSTING_ENABLED = @"GHOSTING_ENABLED";
static NSString *const GHOSTING_DISABLED = @"GHOSTING_DISABLED";

static NSString *const GAME_SHOW_TOGGLED_TO_CHAT = @"message_view_quizzo";
static NSString *const GAME_SHOW_TOGGLE_TO_SOCIAL_GAME_PLAY = @"video_chat_view_quizzo";

#pragma mark Country Codes
static NSString *const COUNTRY_CODE_FILE_NAME = @"country-codes-source-firebase";
static NSString *const COUNTRY_NAME_KEY = @"name";
static NSString *const COUNTRY_CODE_KEY = @"e164_cc";
static NSString *const COUNTRY_ISO_CODE_KEY = @"iso2_cc";

static NSString *const GLOBAL_BLOCK = @"GLOBAL_BLOCK";

static NSString *const PUBNUB_EVENT_REMOTE_DISCONNECT = @"REMOTE_DISCONNECT";

static NSString *const FIND_SCHOOL_APP_PARAM_KEY = @"show_find_school_group";

static NSString *const REFERRAL_INPUT_VIEW_NAME = @"Add_referral_code_view";

static NSString *const LIVE_STREAM_SLOW_INTERNET_CONNECTION_POP_UP_TITLE = @"Slow Internet Connection!";
static NSString *const LIVE_STREAM_SLOW_INTERNET_CONNECTION_POP_UP_MESSAGE = @"Heads up that your connection may be too 🐢 right now to livestream. Quality may be decreased or your stream may end unexpectedly.";
static NSString *const LIVE_STREAM_START_ANYWAY = @"Start Anyway";
static NSString *const START_LIVE_STRAM_SOURCE_TEXT = @"start_live_stream";
static NSString *const LIVE_STREAM_SLOW_INTERNET_CONNECTION_POP_UP_VIEW_NAME = @"Live Stream Slow Internet Connection Popup";

static NSString *const AUTH_BG_APP_REFRESH_POPUP_TITLE = @"Permission Required";
static NSString *const AUTH_BG_APP_REFRESH_POPUP_MESSAGE = @"Please enable background app refresh in settings to continue";

static NSString *const LOTTIE_MIC_OFF = @"Mic-Off";
static NSString *const LOTTIE_MIC_ON = @"Mic-On";

static NSString *const UD_SESSIONS_SINCE_INSTALL_KEY = @"SESSIONS_SINCE_INSTALL";
static NSString *const NEWBIE_ROOM_CATEGORY = @"newbie";
static NSString *const MAX_SSI_PROPERTY_KEY = @"MAX_SSI";
static NSString *const MAX_AGE_PROPERTY_KEY = @"MAX_AGE";
static NSString *const MIN_AGE_PROPERTY_KEY = @"MIN_AGE";
static NSString *const ROOM_ORDER_BY_COUNT = @"ROOM_ORDER_BY_COUNT";
static NSString *const DEFAULT_COUNTRY_ISO = @"CA";

static NSString *const SENT_TEXT = @"Sent ";

static NSString *const EDUCATION_HISTORY_ERROR_POPUP_TITLE = @"Education History";
static NSString *const EDUCATION_HISTORY_MISSING_POPUP_TITLE = @"Misssing Education History";

static NSString *const EDUCATION_HISTORY_ERROR_POPUP_MSG = @"We are unable to verify your education history on Facebook.";
static NSString *const EDUCATION_HISTORY_MISSING_POPUP_MSG = @"Please add your education experience on Facebook and retry.";

static NSString *const SCHEDULE_LIVE_TEXT = @"Live";
static NSString *const SCHEDULE_DAILY_TEXT_FORMAT = @"'Daily at' h:mm a";
static NSString *const SCHEDULE_TODAY_TEXT_FORMAT = @"'Today' h:mm a";
static NSString *const SCHEDULE_TOMORROW_TEXT_FORMAT = @"'Tomorrow' h:mm a";
static NSString *const SCHEDULE_WEEKLY_TEXT_FORMAT = @"EEEE's' h:mm a";

static NSString *const SCHEDULE_DAILY_CHECK_FORMAT = @"HH:mm";
static NSString *const WEEK_DAY_FORMAT = @"e";

#pragma - quest service

static NSString *const IS_NEW_DEVICE_FOR_QUEST_ADJUST = @"IS_NEW_DEVICE_FOR_QUEST_ADJUST";

#pragma invite button attribute

static NSString *const CMS_INVITE_BUTTON_STYLE_VER1 = @"CMS_INVITE_BUTTON_STYLE_VER1";
static NSString *const CMS_INVITE_BUTTON_STYLE_VER2 = @"CMS_INVITE_BUTTON_STYLE_VER2";

#pragma - game menu
static NSString *const GAME_MENU_HEADSHOT_ICON = @"headShotIcon";
static NSString *const GAME_MENU_TRIVIA_ICON = @"triviaIcon";
static NSString *const GAME_MENU_POP_TRIVIA_ICON = @"popTriviaIcon";
static NSString *const GAME_MENU_AUDIO_TRIVIA_ICON = @"audioTriviaIcon";
static NSString *const GAME_MENU_AUDIO_FAMILY_FEUD_ICON = @"friendlyfeudIcon";

static NSString *const GAME_SHOW_MESSAGE = @"GAME_SHOW_MESSAGE";

static NSString *const MUTE_ALERT_TEXT = @"Mute Alerts";
static NSString *const UNMUTE_ALERT_TEXT = @"Unmute Alerts";

static NSString *const SILENCE_ALERT_TEXT = @"Notifications Off";
static NSString *const TURN_ON_ALERT_TEXT = @"Notifications On";
static NSString *const MUTE_CHAT_TEXT = @"Mute Chat";

static NSString *const SHARE_ALERT_TEXT = @"Share";
static NSString *const SUBSCRIBE_ALERT_TEXT = @"Subscribe";
static NSString *const UNSUBSCRIBE_ALERT_TEXT = @"Unsubscribe";

static NSString *const GAME_SHOW_HOST_REJOINED = @"GAME_SHOW_HOST_REJOINED";
static NSString *const GAME_SHOW_HOST_NOT_JOINED = @"GAME_SHOW_HOST_NOT_JOINED";
static NSString *const GAME_SHOW_HOST_EXIT = @"GAME_SHOW_HOST_EXIT";
static NSString *const FORCE_EXIT_PLAYERS = @"FORCE_EXIT_PLAYERS";
static NSString *const GAME_SHOWS_COUNT = @"GAME_SHOWS_COUNT";
static NSString *const GAME_SHOW_SHOW_WINNERS = @"GAME_SHOW_HOST_SHOW_WINNERS";
static NSString *const GAME_SHOW_GAME_END_STATS = @"GAME_SHOW_GAME_END_STATS";
static NSString *const GAME_SHOW_GAME_END_VIEW_ONLY = @"GS_GM_END_VW_ONLY";
static NSString *const GAME_SHOW_STATS_REPORT = @"GS_STAT_RPT";

static NSString *const GAME_SHOW_CHALLENGER_STREAM_START = @"GAME_SHOW_CHALLENGER_STREAM_START";
static NSString *const GAME_SHOW_CHALLENGER_STREAM_END = @"GAME_SHOW_CHALLENGER_STREAM_END";
static NSString *const GAME_SHOW_CHALLENGER_REQUEST = @"GAME_SHOW_CHALLENGER_REQUEST";
static NSString *const GAME_SHOW_CHALLENGER_SELECTED = @"GAME_SHOW_CHALLENGER_SELECTED";
static NSString *const GAME_SHOW_CHALLENGER_EXIT = @"GAME_SHOW_CHALLENGER_EXIT";
static NSString *const GAME_SHOW_METADATA_NO_UPDATE = @"GAME_SHOW_METADATA_NO_UPDATE";
static NSString *const GAME_SHOW_QUESTION_AUTO_COMMENT = @"GAME_SHOW_QUESTION_AUTO_COMMENT";
static NSString *const GAME_SHOW_INVENTORY_SOLD_OUT = @"GAME_SHOW_INVENTORY_SOLD_OUT";

static NSString *const GAME_SHOW_START_BONUS_ROUND = @"GAME_SHOW_START_BONUS_ROUND";
static NSString *const GAME_SHOW_BONUS_JOIN_TIMER_END = @"GAME_SHOW_BONUS_JOIN_TIMER_END";


#pragma mark - Loot Drop
static NSString *const GAME_SHOW_LOOT_ACTIVATED = @"GS_LOOT_ACTIVATED";
static NSString *const GAME_SHOW_LOOT_DROPPED = @"GS_LOOT_DROPPED";

static NSString *const GAME_SHOW_WINNER_TYPE = @"GAME_SHOW_WINNER_TYPE";
static NSString *const GAME_SHOW_WINNER_TYPE_NORMAL = @"NORMAL";

#pragma mark - Free Gift
static NSString *const FREE_GIFT_REQUEST = @"FREE_GIFT_REQUEST";
static NSString *const FREE_GIFT_UPDATE = @"FREE_GIFT_UPDATE";
static NSString *const FREE_GIFT_COUNT = @"FREE_GIFT_COUNT";

#pragma - permission popup data key names

static NSString *const PRE_ASK_POPUP_TITLE = @"PRE_ASK_POPUP_TITLE";
static NSString *const PRE_ASK_POPUP_MESSAGE = @"PRE_ASK_POPUP_MESSAGE";
static NSString *const PRE_ASK_POPUP_MAIN_BUTTON = @"PRE_ASK_POPUP_MAIN_BUTTON";
static NSString *const PRE_ASK_POPUP_SKIP_BUTTON = @"PRE_ASK_POPUP_SKIP_BUTTON";
static NSString *const PRE_ASK_POPUP_MESSAGE_FROM_FR_ACCEPT = @"Stay connected with your friends! We’ll notify you when your friends are online or say hi!";
static NSString *const PRE_ASK_POPUP_TITLE_FROM_FR_ACCEPT = @"Want to know when %@ is online?";

#pragma - interactive onboarding
static NSString *const kInteractiveOnboadingMilestoneKey = @"InteractiveOnboadingMilestoneKey";

static NSString *const IOB_GET_STARTED_VIDEO = @"getStartedVideo.mp4";
static NSString *const IOB_MIC_PERMISSION_VIDEO = @"micPermissionVideo.mp4";
static NSString *const IOB_EASY_QUESTION_VIDEO = @"easyQuestionVideo.mp4";
static NSString *const IOB_EASY_QUESTION_CORRECT_ANSWER_VIDEO = @"easyQuestionCorrectAnswer.mp4";
static NSString *const IOB_EASY_QUESTION_INCORRECT_ANSWER_VIDEO = @"easyQuestionIncorrectAnswer.mp4";
static NSString *const IOB_SAMPLE_FRIEND_DISPLAY_VIDEO = @"sampleFriendDisplay.mp4";
static NSString *const IOB_GIVE_CAMERA_PERMISSION_VIDEO = @"giveCameraPermission.mp4";
static NSString *const IOB_TEAM_QUESTION_VIDEO = @"teamQuestion.mp4";
static NSString *const IOB_CONCLUSION_VIDEO = @"conclusion.mp4";

static NSString *const IOB_FIRST_QUESTION_KEY_VIDEO = @"FirstQuestionKey.mp4";
static NSString *const IOB_FIRST_QUESTION_MONEY_VIDEO = @"FirstQuestionMoney.mp4";
static NSString *const IOB_SECOND_QUESTION_VIDEO = @"SecondQuestion.mp4";
static NSString *const IOB_THIRD_QUESTION_VIDEO = @"ThirdQuestion.mp4";
static NSString *const IOB_WINNER_MONEY_VIDEO = @"WinnerMoney.mp4";
static NSString *const IOB_WINNER_KEY_VIDEO = @"WinnerKey.mp4";
static NSString *const IOB_LOSER_VIDEO = @"Loser.mp4";

static NSString *const INTERACTIVE_ONBOARDING_SHOWN = @"InteractiveOnboardingShown";
static NSString *const IS_QUIZZO_IOB_REWARD_KEY_TAG = @"isQuizzoIOBRewardKey";
static NSString *const INVITE_FLOW_AB_TEST_DISTRIBUTION = @"invite_flow_ab_test_distribution";
static NSString *const CONSUMABLE_SHOP_TAG = @"consumableShopVariation";
static NSString *const PLAN_ORDERING_VARIATION_TAG = @"planOrderingVariation";

static NSString *const TRIAL_INFO_STRING_VARIATION_TAG = @"trialInfoStringVariation";

static NSString *const REWARD_SERVICE_CREATION_VARIATION_TAG = @"needToCreateRewardServiceVariation";
static NSString *const NON_SUBSCRIBER_STREAK_VARIATION_TAG = @"nonSubscriberStreakVariation";
static NSString *const AUTO_SUBS_POPUP_ON_PLAY_END_VARIATION_TAG = @"autoSubsPopupOnPlayEndAbtestVariation";
static NSString *const CAMPAIGN_PRODUCT_PLAN_VARIATION_TAG = @"product_plan_display_variation_ab_campaign";

static NSString *const RESUBS_PITCH_VARIATION_TAG = @"resubsPitchAbtestVariation";

static NSString *const SUBSCRIBER_STREAK_VARIATION_TAG = @"subscriberStreakVariation";
static NSString *const ONBOARDING_SALE_SHOW_GRAPHICS_AB_TEST = @"onboarding_sale_show_graphics_ab_test";
static NSString *const SUBSCRIPTION_VALUE_PROP_AB_TEST = @"subscriptionValuePropAbTestVariation";

static NSString *const DOUBLE_PLAN_ALREADY_SELECTED_PRODUCT_AB_TEST = @"double_plan_already_selected_product_ab_test";

static NSString *const PVP_IN_PG_ABTEST = @"pvp_in_pg_abtest";

static NSString *const CREATE_SHOW_WITH_SNAP_SHARE_ABTEST = @"new_create_show_with_snap_share_abtest";
static NSString *const LOBBY_SNAP_SHARE_ABTEST = @"lobby_snap_share_abtest";
static NSString *const INVITE_SNAP_SHARE_ABTEST = @"invite_snap_share_abtest";
static NSString *const INFLUENCER_NEWBIE_SHOW_ABTEST = @"influencer_newbie_show_abtest";

static NSString *const DID_ONBOARDING_MONEY_REWARD_WON = @"did_onboarding_money_reward_won";
static NSString *const DID_ONBOARDING_KEY_REWARD_WON = @"did_onboarding_key_reward_won";
static NSString *const DID_ONBOARDING_LOST = @"did_onboarding_lost";

static NSString *const SUBSCRIPTION_POPUP_SOCIAL_CALLOUT_ABTEST = @"subscription_popup_social_callout_abtest";

static NSString *const GAMESHOW_COMMUNITY_GUIDLINES_POPUP_ABTEST = @"gameshow_community_guidlines_popup_abtest";

#pragma - abtestkey
static NSString *const WOWZA_SERVER_ENABLED = @"wowza_enabled_ABTest";

static NSString *const PRODUCT_PLAN_DISPLAY_VARIATION_TAG = @"product_plan_display_variation";

static NSString *const YOU_WON_PURCHASE_POPUP_NEWBIE_SUBTITLES_ABTEST_VARIATION = @"you_won_purchase_popup_newbie_subtitles_abtest_variation";

static NSString *const TAPJOY_OFFERWALL_VISIBILITY_VARIATION = @"iosTapjoyOfferWallVisibilityVariation";

static NSString *const HUNDRED_PERCENT_PLAN_BENEFIT_ABTEST = @"100%plan_benefit_abtest";

static NSString *const EMAIL_ON_ONBOARDING_ABTEST = @"email_on_onboarding_abtest";

static NSString *const  SHOW_SHARE_WITH_SNAP_VARIATION = @"show_share_with_snap_new_variation";

static NSString *const  SHARE_UI_VARIATION_FOR_AUDITION_CREATION = @"share_ui_variation_for_audition_creation";

static NSString *const WEBLINK_SHARE_VARIATION_FOR_AUDITION = @"weblink_share_variation_for_audition";

static NSString *const WEBLINK_SHARE_VARIATION_FOR_AUDITION_FACEBOOK = @"weblink_share_variation_for_audition_facebook";


static NSString *const  FB_SHARE_ABTEST = @"facebook_share_abtest";

static NSString *const NEW_ONBOARDING_MONETIZATION_UI_ABTEST = @"new_onboarding_monetization_ui_abtest";

static NSString *const LPTOP_SOCIAL_CALLOUT_UI_VARIATION = @"lptop_social_callout_ui_variation";

static NSString *const WINNER_FLOW_APP_SUBSCRIPTION_VARIATION = @"winner_flow_app_subscription_abtest_variation";

static NSString *const BROADCASTER_SUBSCRIPTION_FREE_TRIAL_ABTEST = @"broadcaster_subscription_free_trial_abtest";

static NSString *const ONBOARDING_MERCHANDISING_ABTEST = @"onboarding_merchandising_abtest";

static NSString *const SUGGESTED_ONBOARDING_FRIEND_ABTEST = @"suggestedOnBoardingFriend";

static NSString *const USER_AUDITION_CREATE_LOCAL_NOTIFICATION_ABTEST = @"create_audition_local_notification_abtest";

static NSString *const GUEST_USER_LOGIN_ABTEST = @"guest_user_login_Abtest";

static NSString *const  SHARING_IMAGE_ABTEST = @"sharing_image_attachment_Abtest";

static NSString *const  SHARING_IMAGE_VARIANT = @"ab_test_share_image_url_variant_";

static NSString *const GUEST_USER_NOTIFICATION_PERMISSION_ABTEST = @"guest_user_notification_permission_abtest";

static NSString *const PLAYGROUND_RESULT_CTA_TEXT_ABTEST = @"playground_result_cta_text_abtest";

static NSString *const SHOW_PLAYGROUND_TAB_ABTEST = @"show_playground_tab_abtest";

static NSString *const PVT_FRIEND_INVITE_ABTEST = @"pvt_friend_invite_abtest";

#pragma - broadcast platforms
static NSString *const BROADCAST_TOKBOX = @"TOKBOX";
static NSString *const BROADCAST_RED5PRO = @"RED5PRO";

static NSString *const PERMISSION_VARIANT = @"permissionVariant";

static NSString *const INFINITE_CLICKER_INVITED_CONTACTS = @"InvitedContacts";
static NSString *const CURRENT_INFINITE_CLICKER = @"currentInfiniteClicker";
static NSString *const CURRENT_HALF_CARD = @"currentHalfCard";
static NSString *const CONTACTS_SKIPPED_ON_SESSION_ADVANCE = @"contactsSkippedOnSessionAdvance";

static NSString *const GAMESHOW_START_VIEW = @"gameshow_start_view";
static NSString *const GAMESHOW_RECONNECTING_VIEW = @"gameshow_reconnecting_view";

static NSString *const IS_ADMIN_USER_KEY = @"isAdminUser";

#pragma - Social Menu
static NSString *const SOCIAL_PLAY_WITH_FRIENDS = @"Play with Friends!";
static NSString *const SOCIAL_CAMERA_AND_MIC_PERMISSION_TEXT = @"Enable your camera and mic to play with your friends";
static NSString *const SOCIAL_CAMERA_PERMISSION_TEXT = @"Enable your camera to play with your friends";
static NSString *const SOCIAL_MIC_PERMISSION_TEXT = @"Enable your mic to play with your friends";
static NSString *const SOCIAL_CAMERA_AND_MIC_BUTTON_TEXT = @"Enable Camera & Mic";
static NSString *const SOCIAL_CAMERA_BUTTON_TEXT = @"Enable Camera";
static NSString *const SOCIAL_MIC_BUTTON_TEXT = @"Enable Mic";
static NSString *const SOCIAL_MIC_TITLE_TCRUSH = @"Play with Friends!";
static NSString *const SOCIAL_MIC_SUBTITLE_TCRUSH = @"You need to enable your mic to play with your friends";

static NSString *const NAGGING_SKIP_TEXT = @"Later";

static NSString *const UD_FCM_TOKEN_KEY = @"UD_FCM_TOKEN";
static NSString *const UD_APNS_TOKEN_KEY = @"UD_APNS_TOKEN";
static NSString *const UD_LANG_KEY = @"UD_LANG_KEY";

static NSString *const REMOTE_SESSION = @"remoteSession";
static NSString *const STORE_SESSION_IN_CACHE = @"storeSessionInCache";

static NSString *const KEY_UPDATE = @"key_update";
static NSString *const CASH_UPDATE = @"cash_update";
static NSString *const COLLECTABLE_UPDATE = @"collectableUpdate";
static NSString *const BLOCK = @"BLOCK";
static NSString *const KEY_DIFF = @"key_diff";
static NSString *const CASH_TOTAL = @"cash_total";
static NSString *const EARN_TOTAL = @"cash_total_earning";
static NSString *const WALLET_UPDATE_TAG = @"wallet_update";
static NSString *const EVENT_MODIFIED_TAG = @"eventTimeRefreshDiff";
static NSString *const USER_CHAT_MESSAGE = @"chat message";

static NSString *const RECRUITED_COUNT_UPDATE = @"recruited_count_update";
static NSString *const RECRUITED_COUNT = @"recruited_count";

static NSString *const DEBUG_PUBNUB = @"DEBUG_PUBNUB:";
static NSString *const ERROR_MESSAGE_FAILED_PUBNUB_ATTACHMENT = @"\nError attaching pubnub log file";

static NSString *const JOYRIDE = @"Joyride";

static NSString *const PUBNUB = @"pubnub";
static NSString *const LIGHTSTREAMER = @"lightstreamer";

static NSString *const VOLUME_KEY = @"volume";

static NSString *const REFERRAL_CODE_ALREADY_USED = @"Referral Code (Already used)";
static NSString *const REFERRAL_CODE_OPTIONAL = @"Referral Code (Optional)";


static NSString *const IN_APP_PURCHASE_RECEIPT = @"receipt";
static NSString *const IN_APP_PURCHASE_TRANSACTION_ID = @"transactionId";
static NSString *const IN_APP_PURCHASE_PRODUCT_ID = @"productId";
static NSString *const IN_APP_PURCHASE_OFFER_TYPE = @"availedOfferType";//dont change this value
static NSString *const IN_APP_PURCHASE_SALE_EVENT_ID = @"saleEventId";//dont change this value
static NSString *const IN_APP_PURCHASE_NO_RECEIPT = @"NoReceipt";//dont change this value
static NSString *const NO_REFRESHED_RECEIPT_ERROR = @"no_receipt_after_refresh_error";
static NSInteger const NO_REFRESHED_RECEIPT_ERROR_CODE = 14;

static NSString *const RECEIPT_SENT_SUCCESS_TITLE = @"Purchase Receipt Sent";
static NSString *const RECEIPT_SENDING_FAIL_TITLE = @"Receipt Sending Failed!";
static NSString *const RECEIPT_SENT_SUCCESS_MESSAGE = @"Your keys will be updated soon.";
static NSString *const RECEIPT_SENDING_FAIL_MESSAGE = @"Please contact help@onjoyride.com for further details.";

static NSString *const PURCHASE_OFFER_BONUS_TITLE = @"Special Offer: Bonus Keys";
static NSString *const PURCHASE_OFFER_STAMP_BONUS_TEXT = @"+<bonus> Bonus Keys";
static NSString *const PURCHASE_OFFER_BLUE_BONUS_TEXT = @"+<bonus> BONUS KEYS";

static NSString *const NO_RECEIPT_TITLE = RECEIPT_SENDING_FAIL_TITLE;//@"No Receipt Found";
static NSString *const NO_RECEIPT_MESSAGE = RECEIPT_SENDING_FAIL_MESSAGE;//@"We couldn't find any purchase receipt.";
static NSString *const NO_LATEST_RECEIPT_MESSAGE = RECEIPT_SENDING_FAIL_MESSAGE;//@"We are unable to get latest receipt.";

static NSString *const SUCCESS_STRING = @"success";

static NSString *const CHALLENGE_URL = @"challenge_url";
static NSString *const GAME_SHOWS_PARTICIPATED = @"game_shows_participated";
static NSString *const QUESTION_COLLECTION_VIEW_CELL_TAG = @"QuestionCollectionViewCell";
static NSString *const QUESTION_COLLECTION_VIEW_CELL_ID_TAG = @"QuestionCollectionViewCellID";
static NSString *const LOBBY_TAG = @"lobby";
static NSString *const SNAP_FRIEND_CHALLENGE_TAG = @"SnapFriendChallenge";
static NSString *const CANCEL_TAG = @"cancel";
static NSString *const SNAPCHAT_TAG = @"snapchat";
static NSString *const INVITE_ONLY_TAG = @"InviteOnly";
static NSString *const GIF_TAG = @"gif";
static NSString *const SNAP_CHALLENGE_VIEW_TAG = @"snap_challenge_view";
static NSString *const SNAP_LOBBY_VIEW = @"snap_lobby_view";
static NSString *const SHARE_TAG = @"share";
static NSString *const SNAPCHAT_GIF_TUTORIAL_FILE_NAME = @"SnapShare-Seq.gif";

static NSString *const USER_CREATED_AFTER_SUBSCRIPTION_AB_TEST_RELEASE = @"userCreatedAfterSubscriptionAbTestVariationRelease";

static NSString *const FRIEND_COUNT = @"FRIEND_COUNT";
static NSString *const WIN_COUNT = @"WIN_COUNT";

static NSString *const OFF = @"OFF";

static NSString *const FAQ = @"FAQs";
static NSString *const MAIL_URL_SCHEME = @"mailto";
static NSString *const LOBBY_CONTENT_REQUEST_KEY = @"lobby_content_request_key";
static NSString *const LOBBY_CONTENT_CACHE_KEY = @"lobby_content_cache.txt";
static NSString *const RECEIPT_REFRESH_URL_PATH = @"resend-purchase-receipt-manually";

static NSString *const GAME_SHOW_AFTER_SOCIAL_JOINED = @"GAME_SHOW_AFTER_SOCIAL_JOINED";
static NSString *const LAST_SOCIAL_GAME_SHOW_JOINED = @"LAST_SOCIAL_GAME_SHOW_JOINED";
static NSString *const LOBBY_SOCIAL_CALL_VIEW_SHOWN = @"LOBBY_SOCIAL_CALL_VIEW_SHOWN";

static NSString *const LOBBY_CATEGORY = @"lobbyCategory";
static NSString *const LOBBY_MESSAGE_TYPE = @"lobbyMessageType";
static NSString *const FB_TEXT = @"fbText";
static NSString *const FB_LINK = @"fbLink";
static NSString *const DEFAULT_FB_TEXT = @"Share Joyride on Facebook and earn one free key";

static NSString *const TWITTER_TEXT = @"twitterText";
static NSString *const TWITTER_LINK = @"twitterLink";
static NSString *const DEFAULT_TWITTER_TEXT = @"Share Joyride on Twitter and earn one free key";

static NSString *const FACEBOOK_TAG = @"Facebook";
static NSString *const TWITTER_TAG = @"Twitter";
static NSString *const INSTAGRAM_TAG = @"Instagram";
static NSString *const GENERIC_TAG = @"generic";

static NSString *const CURRENCY_CHANGE_TAG = @"currency_change";
static NSString *const MIN_KEY_REQUIRED_TAG = @"min_keys_required";
static NSString *const INCREASE = @"increase";
static NSString *const DECREASE = @"decrease";
static NSString *const SOCIAL_CALL_LOBBY = @"lobby_social_call";
static NSString *const FB_SHARE_LOBBY = @"fb_share_lobby";
static NSString *const TWITTER_SHARE_LOBBY = @"twitter_share_lobby";
static NSString *const SNAP_SHARE_LOBBY = @"snap_share_lobby";
static NSString *const FB_LIKE_LOBBY = @"fb_like_lobby";
static NSString *const TWITTER_FOLLOW_LOBBY = @"twitter_follow_lobby";
static NSString *const FB_LIVESTREAM_LOBBY = @"fb_livestream_lobby";

static NSString *const KEY = @"key";
static NSString *const FRIEND = @"friend";
static NSString *const REFERRAL = @"referral";
static NSString *const REQUIRED_SHOW_COUNT_LOBBY = @"requiredShowCount";
static NSString *const NOTIFICATION_TEXT_LOBBY = @"notificationText";
static NSString *const DEFAULT_LOBBY_SOCIAL_CALL_JOIN_NOTIFICATION_TEXT = @"The more the merrier! Key awarded for squad play!!";
static NSString *const DEFAULT_LOBBY_SUBSCRIPTION_REWARD_NOTIFICATION_TEXT = @"Congrats, you got subscription reward!!";
static NSString *const DEFAULT_LOBBY_DSI_REWARD_NOTIFICATION_TEXT = @"Congrats, you got loyality reward!!";

static NSString *const LIKE = @"Like";
static NSString *const SHARE = @"Share";
static NSString *const STREAM = @"Stream";
static NSString *const FOLLOW = @"Follow";
static NSString *const TWEET = @"Tweet";

static NSString *const LOBBY_FB_ICON = @"fb-lobby";
static NSString *const LOBBY_FB_LIKE_ICON = @"fb-like-lobby";
static NSString *const LOBBY_TWITTER_ICON = @"twitter-lobby";

static NSString *const MAX_IMPRESSION_LIMIT_KEY = @"maxImpressionLimit";
static NSString *const DSI_REWARD_FOR_LOBBY_CONTENT = @"DSI_REWARD_FOR_LOBBY_CONTENT";
static NSString *const SUBSCRIPTION_EXPIRY_REWARD_FOR_LOBBY_CONTENT = @"SUBSCRIPTION_EXPIRY_REWARD_FOR_LOBBY_CONTENT";
static NSString *const SUBSCRIPTION_REWARD_FOR_LOBBY_CONTENT = @"SUBSCRIPTION_REWARD_FOR_LOBBY_CONTENT";
static NSString *const DSI_REWARD_DAYS = @"rewardDays";
static NSString *const DAY = @"day";
static NSString *const STARTER_PACK_FREE_TRIAL_LOBBY = @"starter_pack_free_trial_lobby";
static NSString *const SUBSCRIPTION_LOBBY = @"subscription_lobby";

static NSString *const PURCHASE_POPUP_SEEN = @"PURCHASE_POPUP_SEEN";
static NSString *const FREE_TRIAL_BASE_PRICE = @"$0";
static NSString *const NO_INTRODUCTORY_BASE_PRICE = @"NA";

static NSString *const SUBSCRIBE_BUTTON = @"Subscribe";

static NSString *const ONBOARDING_KEY_CHEST_BROWN = @"onboarding_key_chest_brown";

static NSString *const CONSUMABLE_SHOP_POPUP_TITLE = @"Get Key Packs";
static NSString *const SUBSCRIPTION_SPECIAL_BENEFIT = @"Bonus keys + special rewards";
static NSString *const SUBSCRIPTION_DISCOUNT_BENEFIT = @"50% member discount for special shows";


static NSString *const SUBSCRIPTION_SPECIAL_BENEFIT_FOR_YOUWON_POPUP = @"Bonus keys + special crowns";

static NSString *const SUBSCRIPTION_SPECIAL_BENEFIT_FOR_GIFTING = @"Bonus keys to buy special gifts";

static NSString *const SUBSCRIPTION_PLAN_V2_GROUP_ID = @"multiPlans_v2";
static NSString *const PINNED = @"pinned";
static BOOL const IS_FIREBASE_ENABLED = YES;

static NSString *const TRY_NOW = @"TRY IT NOW";
static NSString *const N_DAY_FREE_TEXT = @"%ld Day Free Trial*";

static NSString *const SUBSCRIBE_NOW = @"SUBSCRIBE NOW";


static NSString *const GENERIC_MONETIZATION_DISCLOSURE_PARTIAL_TEXT = @"Recurring billing, cancel anytime\n Joyride subscriptions will automatically renew unless auto-renew is turned off at least 24 hours before the end of the current period. Your iTunes account will be charged <price> for renewal within 24-hours prior to the end of the current period. Any unused portion of a free trial period, if offered, will be forfeited when you purchase a subscription to that publication, where applicable. You can go to your iTunes Account settings to manage your subscription and turn off auto-renew. Your iTunes Account will be charged when the purchase is confirmed. By using Joyride you agree to our";
static NSString *const ONBOARDING_SINGLE_PRODUCT_SINGLE_LINE_DISCLOSURE_PARTIAL_TEXT = @"Recurring billing. Joyride subscriptions will automatically renew unless auto-renew is turned off at least 24 hours before the end of the current period. Your iTunes account will be charged <price> for renewal within 24-hours prior to the end of the current period. You can go to your iTunes Account settings to manage your subscription and turn off auto-renew. Your iTunes Account will be charged when the purchase is confirmed. By using Joyride you agree to our";

static NSString *const AD_NETWORK_VIEW_SHOWN = @"AD_NETWORK_VIEW_SHOWN";
static NSString *const CAPPED_PAYER_EVENT_VIEW_SHOWN = @"CAPPED_PAYER_EVENT_VIEW_SHOWN";
static NSString *const CREATE_SHOW_EVENT_VIEW_SHOWN = @"CREATE_SHOW_EVENT_VIEW_SHOWN";
static NSString *const CREATE_SHOW_NTH_EVENT_VIEW_SHOWN = @"CREATE_SHOW_NTH_EVENT_VIEW_SHOWN";
static NSString *const AD_NETWORK_OTP_VIEW_SHOWN = @"AD_NETWORK_OTP_VIEW_SHOWN";
static NSString *const AD_NETWORK_PAYMENT_VIEW_SHOWN_V1 = @"AD_NETWORK_PAYMENT_VIEW_SHOWN_V1";
static NSString *const AD_NETWORK_PAYMENT_EVENT_FIRED = @"AD_NETWORK_PAYMENT_EVENT_FIRED";

static NSString *const PURCHASE_DISABLED_TITLE = @"In-App Purchase Disabled";
static NSString *const PURCHASE_DISABLED_SUBTITLE = @"In-App Purchase is not currently enabled on this device. Please enable it and try again.";

static NSString *const STREAK_REWARD_BENEFIT = @"Bonus keys + special rewards";


static NSString *const WEB_PRODUCT_CONTAINS = @".web.";

static NSString *const TRIAL = @"trial";
static NSString *const PAYMENT = @"payment";
static NSString *const CREATE_SHOW = @"create_show";
static NSString *const CREATE_SHOW_MARATHON = @"create_show_marathon";
static NSString *const CREATE_SHOW_MARATHON_REPEAT = @"create_show_repeat";
static NSString *const CREATE_SHOW_NTH = @"create_show_nth";
static NSString *const OTP = @"otp";
static NSString *const QUALIFIED_TRIAL = @"qualified_trial";


static NSString *const USER_ROLE_PARAM = @"role";
static NSString *const USER_ROLE_GUEST = @"Guest";
static NSString *const USER_ROLE_BUDDY = @"Buddy";
static NSString *const USER_ROLE_SUITOR_PREFIX = @"Suitor-";
static NSString *const USER_ROLE_CHALLENGER = @"Challenger";
static NSString *const VIDEO_SOURCE_PARAM = @"source";
static NSString *const VIDEO_SOURCE_BROWSER = @"browser";
static NSString *const VIDEO_SOURCE_APP = @"app";

static NSString *const DAILY_PURCHASE_POPUP_GAMESHOW_COUNT = @"daily_purchase_popup_gameshow_count";
static NSString *const DAILY_PURCHASE_POPUP_GAMESHOW_COUNT_FOR_DSI0 = @"daily_purchase_popup_gameshow_count_for_dsi0";
static NSString *const PURCHASE_POPUP_GAMESHOW_DAILY_DATE = @"purchase_popup_gameshow_daily_date";
static NSString *const PURCHASE_POPUP_LP_DAILY_DATE = @"purchase_popup_lp_daily_date";

static NSString *const DAILY_SOCIAL_CALLOUT_COUNT = @"daily_social_callout_count";
static NSString *const SOCIAL_CALLOUT_DAILY_DATE = @"social_callout_daily_date";

static NSString *const BUY_BUTTON_TEXT_FOR_SALE_EVENT = @"Sale";
static NSString *const BUY_CAPS = @"BUY";

static NSString *const NEWBIE_SHOW_END_ACTION = @"newbie_show_end_action";

static NSString *const ONBOARDING_MONETIZATION = @"ONBOARDING_MONETIZATION";
static NSString *const ONBOARDING_MONETIZATION_DOUBLE_PLAN = @"ONBOARDING_MONETIZATION_DOUBLE_PLAN";
static NSString *const POPUP_MONETIZATION_DOUBLE_PLAN = @"POPUP_MONETIZATION_DOUBLE_PLAN";

static NSString *const DAILY_CREATE_SHOW_COUNT = @"DAILY_CREATE_SHOW_COUNT_";
static NSString *const DAILY_CREATE_SHOW_DATE = @"DAILY_CREATE_SHOW_DATE_";

static NSString *const GLOBAL_DAILY_CREATE_SHOW_COUNT = @"GLOBAL_DAILY_CREATE_SHOW_COUNT_";
static NSString *const CREATE_SHOW_NEXT_CONVERTIBLE_INDEX = @"CREATE_SHOW_NEXT_CONVERTIBLE_INDEX_";

static NSString *const USER_PLAYED_QUIZ = @"<played>";
static NSString *const TOTAL_FREE_QUIZ = @"<free_game>";
static NSString *const USER_REMAINING_QUIZ = @"<remaining>";

static NSString *const DEFAULT_SOCIAL_PROOF_ELEMENT_ROTATION_STRING = @"In the last day, <num> new people started a Free Trial";

static NSString *const AD_QUALIFIED_TRIAL_SHOWN = @"AD_QUALIFIED_TRIAL_SHOWN";

static NSString *const CREATE_A_SHOW_MIN_USER_MSG = @"Get {minUser} people to join and we’ll feature you to everyone on Joyride";
static NSString *const MIN_FRIEND_TO_EARN_MONEY_MSG = @"Grow your following and apply to become a Verified Broadcaster to earn $$$ for your shows!";
static NSString *const USER_RATING_MAP = @"USER_RATING_MAP";

static NSString *const CREATE_SHOW_DEFAULT_MESSAGE = @"Create a shows";
static NSString *const CREATE_SHOW_QUIZZO_MESSAGE = @"A speedy trivia game, where players guess the answer before time runs out";
static NSString *const CREATE_SHOW_TOPPOP_MESSAGE = @"A fun, fast-paced game where players guess the most popular choice";
static NSString *const CREATE_SHOW_MUSIC_MANIA_MESSAGE = @"A music-guessing game, where players guess the song before time runs out";
static NSString *const CREATE_SHOW_TRIVIA_CRUSH_MESSAGE = @"A trivia game, where players collect points to qualify for a final championship round";
static NSString *const CREATE_SHOW_FILM_FRENZY_MESSAGE = @"A movie-guessing game, where players guess the film before time runs out";
static NSString *const CREATE_SHOW_SOLD_MESSAGE = @"A price-guessing game, where players assess a quirky item before time runs out";
static NSString *const CREATE_SHOW_DRAWZZLE_MESSAGE = @"A quirky drawing game, where players guess the drawing before time runs out";
static NSString *const CREATE_SHOW_DREAM_DATE_MESSAGE = @"Swipe through your favorite dating app live while your players watch and comment!";
static NSString *const CREATE_SHOW_SHOPPING_MESSAGE = @"Browse your favorite website live while your players watch and comment!";
static NSString *const CREATE_SHOW_WEB_SCORE_MESSAGE = @"A gameshow where players compete for the high score in popular minigames";

static NSString *const CREATE_SHOW_ASK_AWAY_MESSAGE = @"An anonymous feedback show, where players answer fun questions about the Creator";
static NSString *const CREATE_SHOW_FEATURED_MESSAGE = @"Choose from exciting products to show off to your players in your show!";
static NSString *const CREATE_SHOW_CATEGORY_IRL_MESSAGE = @"Get your fix of our reality shows like Dream Date and Feedback!";

static NSString *const MUSIC_MANIA_SHOW_IMG = @"musicManiaShow";
static NSString *const DREAM_DATE_SHOW_IMG = @"dreamDateShow";
static NSString *const FILM_FRENZY_SHOW_IMG = @"filmFrenzyShow";
static NSString *const WEB_SCORE_SHOW_IMG = @"gameOnShowCard";
static NSString *const TRIVIA_CRUSH_SHOW_IMG = @"triviaCrushShow";
static NSString *const QUIZZO_SHOW_IMG = @"quizzoShow";
static NSString *const TOP_POP_SHOW_IMG = @"topPopShow";
static NSString *const SURF_SHOW_IMG = @"surfShow";
static NSString *const SOLD_SHOW_IMG = @"soldShow";
static NSString *const DRAWZZLE_SHOW_IMG = @"drawzzleShow";
static NSString *const ASK_AWAY_SHOW_IMG = @"askawayShow";
static NSString *const FEATURED_SHOW_IMG = @"featuredShow";
static NSString *const CATEGORY_IRL_IMG = @"categoryIRL";

static NSString *const ALL_LANGUAGE_GROUP_ID = @"All";

static NSString *const DEFAULT_LANGUAGE_GROUP_ID = @"English_US";
static NSString *const INDIA_LANGUAGE_GROUP_ID = @"INDIA";

static NSString *const KEY_NUMBER = @"<keys>";
static NSString *const CASH_REWARD = @"<cash>";

static NSString *const USER_NAME = @"<USER_NAME>";
static NSString *const USER_WIN_COUNT = @"<WIN_COUNT>";


static NSString *const CHALLENGER_GAME_SHOW_ID_FOR_NOTIFICATION_SENT = @"CHALLENGER_GAME_SHOW_ID_FOR_NOTIFICATION_SENT";
static NSString *const DEEPLINK_CHALLENGER_SHOW_SESSION_ID = @"deeplinkChallengerShowSessionId";
static NSString *const CHALLENGER_INFLUENCER_SHOW_CREATED_BY_USER = @"CHALLENGER_INFLUENCER_SHOW_CREATED_BY_USER";
static NSString *const HOST_PARTNER_APPLICATION_SHOWN = @"HOST_PARTNER_APPLICATION_SHOWN";
static NSString *const HOST_PARTNER_APPLICATION_FILLED = @"HOST_PARTNER_APPLICATION_FILLED";

static NSString *const CONTACT_CELL_VIEW = @"contact_cell_view";

static NSString *const SOCIAL_SUBTITLE = @"Find out when your friends are hanging out in the app";
static NSString *const CHSHOW_SUBTITLE = @"Find out when your friends or followers create Game Rooms";

static NSString *const FRIEND_NOTIFICATION_VIEW = @"friend_notification_view";
static NSString *const SHOW_NOTIFICATION_VIEW = @"show_notification_view";

static NSString *const COMPENSATION_ACCEPT_POPUP_TITLE = @"Start Earning";
static NSString *const COMPENSATION_ACCEPT_POPUP_MESSAGE = @"You can now start earning $$$ for your shows! Any earnings will be deposited in your wallet once the show ends.";
static NSString *const COMPENSATION_REJECT_POPUP_TITLE = @"No Earnings";
static NSString *const COMPENSATION_REJECT_POPUP_MESSAGE = @"You have chosen NOT to earn money in your shows. Your hosted shows will continue as normal!";
static NSString *const COMPENSATION_AGREEMENT_POPUP_TITLE = @"Hosting Agreement";
static NSString *const COMPENSATION_AGREEMENT_POPUP_MESSAGE = @"I agree to host one or more shows within the Joyride App operated by Kiwi, Inc. (the “Company”). Hosting one or more shows may result in some revenue to you, based on the amount of virtual currency spent by all players in the show. The value of the virtual currency (i.e. the exchange rate) will be $0.06 per key spent. We have the right to modify this value from time to time, with or without reason, in our sole discretion. Your use of the Joyride App indicates your agreement to accept the then-current compensation amount. \n\nThe Company’s records about how many shows I have hosted in the Joyride App will be final and binding on me. \n\nI hereby grant a non-exclusive, royalty-free, worldwide, perpetual right to use my name, likeness, image, voice, appearance, performance, and statements I have provided to the Company for purposes of the production of one or more segments of content for display within the Joyride App (the “Production”) and any related, photographs, audio and/or video footage taken of me for purposes of the Production, and any other materials supplied by me that are identified for use in the Production (collectively, \"Show Materials\”). \n\nI agree that the Company may distribute, resell, lease, license, or otherwise make use of, whether for commercial gain or not, Show Materials for any purpose related to the Production including promotion of the Production and the Joyride App. \n\nI acknowledge that I do not have the right to pre-approve the Production or such related uses before Company makes use of Show Materials pursuant to this Release. \n\nI agree that while participating in the Production, the production of Show Materials, or involuntarily assisting in the promotion of the Production and/or the Joyride app not to engage in any of the following activities: \n\n● Nudity or pornography \n● Racist/Hateful/Sexist language or ideals \n● Use of illegal drugs \n● Content which reveals confidential elements of Joyride or Joyride staff \n● Violence \n\nThis Release shall be governed and interpreted in accordance with California law and each party irrevocably submits to the personal jurisdiction of the courts within Santa Clara County, California in connection with any enforcement or dispute pertaining to this Release. \n\nBy accepting this agreement I represent that I am 18 years old or older. \n\nThis Contract and Release states the entire agreement concerning my agreement to host shows in the Joyride App and the use of Show Materials in the Production and otherwise and supersedes all prior understandings and agreements on that subject, whether oral or written. \n\nThis Release cannot be modified except in a writing signed by me and an authorized representative of Kiwi, Inc.";

static NSString *const COMPENSATION_APPLICATION_SUBMIT_TITLE = @"Application Submitted";
static NSString *const COMPENSATION_APPLICATION_SUBMIT_MESSAGE = @"Thanks for your submission! Checking all the boxes is a big deal, but does not guarantee Partnership. Please allow up to 3 weeks for us to review your account. We will follow up via email as soon as we've reached a decision!";
static NSString *const HELP_EMAIL = @"help@onjoyride.com";

static NSString *const CREATE_SHOW_STARTED_LOCAL_COUNT = @"create_show_started_local_count";

static NSString *const CREATE_SHOW_DOWNTIME_DEFAULT_MESSAGE = @"Check back in at HH:MM to create your next show 🙂";
static NSString *const CREATE_SHOW_DOWNTIME_DEFAULT_TITLE = @"Try Again Later";
static NSString *const COMPENSATION_PARTNER_APPLICATION_TEXT = @"Based on your outstanding performance as a broadcaster, you have been selected to apply to be a Joyride Partner. Partners get access to special features and can earn cash for their shows!";

static NSString *const GIFT_VIEW_NAME = @"premium_gift_purchase";
static NSString *const JR_SUBSCRIBER_ONLY_GIFT_VIEW_NAME = @"jr_subscriber_only_gift";

static NSString *const NEW_ONBOARDING_BOX = @"new_onboarding_box";
static NSString *const NEW_ONBOARDING_KEY = @"new_onboarding_keys";
static NSString *const NEW_ONBOARDING_CASH = @"new_onboarding_cash";

static NSString *const ROOKIE = @"Rookie";
static NSString *const STREAMER = @"Streamer";
static NSString *const PARTNER = @"Partner";

static NSString *const STREAMERSMALL = @"streamerSmall";
static NSString *const STREAMERON = @"streamerOn";
static NSString *const STREAMEROFF = @"streamerOff";
static NSString *const PARTNERSMALL = @"partnerSmall";
static NSString *const PARTNERON = @"partnerOn";
static NSString *const PARTNEROFF = @"partnerOff";
static NSString *const ROOKIESMALL = @"rookieSmall";
static NSString *const ROOKIEON = @"rookieOn";
static NSString *const ROOKIEOFF = @"rookieOff";

static NSString *const USER_TIER_STATUS = @"You're a {broadcaster}!";


static NSString *const FRIENDS_TAB = @"friends_tab";
static NSString *const SHOWS_TAB = @"shows_tab";
static NSString *const FOR_YOU_TAB = @"for_you_tab";
static NSString *const RETURN_TO_CALL_TAB = @"return_to_call_tab";
static NSString *const BROADCAST_TAB = @"profile_tab";


static NSString *const NEXT_TIER = @"<nextTier>";


static NSString *const TIER_ERROR_TITLE = @"Whoops";
static NSString *const TIER_ERROR_SUBTITLE = @"We mixed up our wires. Please try again. If error persists, please try after some time.";

static NSString *const SNAP_STICKER_POS_X = @"snapStickerPosX";
static NSString *const SNAP_STICKER_POS_Y = @"snapStickerPosY";
static NSString *const SNAP_STICKER_ROTATION = @"snapStickerRotation";

static NSString *const HOST_INTRO_SHOW_COUNT = @"host_intro_show_count";
static NSString *const PARTNER_NEWBIE_POPUP_COUNT = @"PARTNER_NEWBIE_POPUP_COUNT";

static NSString *const SOCIAL_CALLOUT_USER_COUNT = @"<USER_COUNT>";
static NSString *const MUTE_STATE = @"muteState";

static NSString *const TOURNAMENT_SECTION_HEADING = @"Tournaments";

static NSString *const PROFILE_SECTION_HEADING = @"My Profile";

static NSString *const ACHIEVEMENTS_SECTION_HEADING = @"Achievements";
static NSString *const BROADCASTER_STATUS_SECTION_HEADING = @"Status";
static NSString *const LIVE_NOW_HEADING = @"Live Rooms";
static NSString *const NON_LIVE_SHOW_HEADING = @"Upcoming";

static NSString *const COMMUNITY_RULES_POPUP_SEEN = @"COMMUNITY_RULES_POPUP_SEEN";

static NSString *const SNAP_GROW_AUDIANCE_POPUP_TITLE = @"Grow Your Audience!";
static NSString *const SNAP_GROW_AUDIANCE_POPUP_MESSAGE = @"Record a Snap Story and share it with friends to promote your show";

static NSString *const SNAP_GROW_COMPLETE_POPUP_TITLE = @"Show Time";
static NSString *const SNAP_GROW_COMPLETE_POPUP_MESSAGE = @"Let's get this party started 🎉";

static NSString *const SNAP_FF_DEFAULT_VIDEO = @"https://d8dxyy24s0gbx.cloudfront.net/gameshowcontent/filmfrenzy/Natalie+Portman/FF_21558022875601KkcDma7XoP/FF_2.m3u8";
static NSString *const SNAP_MM_DEFAULT_AUDIO = @"https://d8dxyy24s0gbx.cloudfront.net/gameshowcontent/musicmania/Planes/MM_11554850858412lbxboVONER.m3u";
static NSString *const SNAP_MM_DEFAULT_QUESTION = @"Who sang this hit?";
static NSString *const SNAP_MM_DEFAULT_ANSWER_OPTION = @"Song";
static NSString *const SNAP_MM_DEFAULT_ANSWER_IMAGE_OPTION = @"";

static NSString *const CREATE_SHOW_MARATHON_MODE_SOURCE_TAG = @"Marathon Mode";

static NSString *const MAGIC_LINK_RESPONSE_EXPIRED = @"EXPIRED";
static NSString *const MAGIC_LINK_RESPONSE_ALREADY_USED_SELF = @"ALREADY_USED_SELF";
static NSString *const MAGIC_LINK_RESPONSE_ALREADY_USED_OTHER = @"ALREADY_USED_OTHER";
static NSString *const MAGIC_LINK_RESPONSE_USED = @"USED";
static NSString *const MAGIC_LINK_CHALLENGER_BANNED = @"CHALLENGER_BANNED";
static NSString *const MAGIC_LINK_USED_ANOTHER_IN_PAST = @"USED_ANOTHER_IN_PAST";

static NSString *const GAME_SHOW_MIN_REQUIREMENT_EXEMPTED = @"game_show_min_requirement_exempted";
static NSString *const HIDE_MONETIZATION_ONBOARDING_POPUP = @"hide_monetization_onboarding_popup";

static NSString *const SUPPORT_BUTTON = @"Support";
static NSString *const AUTO_DISMISS = @"Auto-Dismiss";
static NSString *const SMALL_CASE_NULL = @"null";

static NSString *const INVITE_SOURCE_WINNER_RESULT_SCREEN = @"winner_result_screen";
static NSString *const INVITE_SOURCE_SHARE_SHOW_CARD = @"share_show_card";
static NSString *const INVITE_SOURCE_SHOW_LOBBY = @"show_lobby";
static NSString *const LAST_LOOT_DROP_WIN_TIMESTAMP = @"lastLootDropWinTS";
static NSString *const AUTO_WINNER_FLOW_APP_SUBSCRIPTION_POPUP = @"auto_winner_flow_app_subscription_popup";

static NSString *const SUPPORTER_EXCLUSIVE = @"Supporter Exclusive";
static NSString *const MEMBER_EXCLUSIVE = @"Member Exclusive";


static NSString *const FOLLOW_EVENT = @"follow";
static NSString *const UNFOLLOW_EVENT = @"unfollow";

static NSString *const FOLLOWER_MODE_TOGGLE_VIEW = @"follower_mode_toggle_";

static NSString *const FOLLOWING_SECTION = @"Following";
static NSString *const FOLLOWERS = @"Followers";
static NSString *const KEYS_USED_COUNT = @"keysUsedCount";

// Show stats keys
static NSString *const GAME_SHOW_END_STATS_CHAT_COUNT = @"CHAT_COUNT";
static NSString *const GAME_SHOW_END_STATS_QUESTION_COUNT = @"QS_COUNT";
static NSString *const GAME_SHOW_END_STATS_RESPONSE_COUNT = @"RESP_COUNT";

static NSString *const USER_FRIEND_COUNT_EXCEEDS_SOFT_LIMIT = @"user_friend_count_exceeds_soft_limit";
static NSString *const BROADCASTER_SUBSCRIPTION_POPUP_AFTER_WINNING_DURATION = @"broadcasterSubscriptionPopupAfterWinningDuration";
static NSString *const BROADCASTER_RATING_POPUP_AFTER_WINNING_DURATION = @"challengerRatingPopupAfterWinningDuration";

static NSString *const GAME_SHOW_END_STATS_QUESTION_LABEL = @"Questions";
static NSString *const GAME_SHOW_END_STATS_RESPONSE_LABEL = @"Votes";
static NSString *const GAME_SHOW_END_STATS_CHAT_LABEL = @"Comments";

static NSString *const AUDITION_KEY_DEDUCTED_PREFIX = @"AUDITION_KEY_DEDUCTED_";
static NSString *const AUDITION_RESOURCE_DEDUCTION_AMOUNT = @"AUDITION_RESOURCE_DEDUCTION_AMOUNT";
static NSString *const SOLD_OUT_IMAGE = @"Sold_Out";
static NSString *const IS_SOLD_OUT = @"isSoldOut";

static NSString *const GENERIC_SHARE_DATA =  @"genericShareData";
static NSString *const GENERIC_SHARE_VIDEO_URL =  @"genericShareVideoUrl";
static NSString *const GENERIC_SHARE_WEBLINK_URL =  @"genericShareWeblinkUrl";
static NSString *const GENERIC_SHARE_STICKER =  @"genericShareSticker";
static NSString *const GENERIC_SHARE_PRE_HANDLING =  @"genericSharePreHandling";
static NSString *const GENERIC_SHARE_VIDEO_IMAGE =  @"genericShareVideoImage";

static NSString *const CARD_TYPE_VIDEO = @"video";
static NSString *const CARD_TYPE_MUSIC = @"music";
static NSString *const CARD_TYPE_FOUR_ANSWER_QUESTION = @"fourAnswerQuiz";
static NSString *const CARD_TYPE_TWO_ANSWER_QUESTION = @"twoAnswerQuiz";
static NSString *const CARD_TYPE_QUESTION = @"questionQuiz";

static NSString *const CIRCLE=@"CIRCLE";
// Daily pop string
static NSString *const AUDITION_TAB_POP_UP_TYPE = @"audition_tab";
static NSString *const AUDITION_TAB_POP_UP_NAME = @"audition_prompt_get_keys";
static NSString *const DAILY_POP_UP_SHOWN_COUNT = @"popUpShownCount";
static NSString *const DAILY_POP_UP_LAST_SHOWN = @"popUpLastShown";
static NSString *const DAILY_POP_UP_MSG = @"_pop_up_message";
static NSString *const DAILY_POP_UP_MSG_SHOW_COUNT = @"_pop_up_message_show_count";
static NSString *const DAILY_POP_UP_MSG_LIKES_COUNT = @"_pop_up_likes_count";
static NSString *const DAILY_POP_UP_MSG_WIN_KEY_COUNT = @"_pop_up_win_key_count";
static NSString *const CONTESTS_TAB_POP_UP_TYPE = @"contests_tab";
static NSString *const SHOWS_TAB_POP_UP_TYPE = @"shows_tab";
static NSString *const PLAYGROUND_TAB_POP_UP_TYPE = @"playground_tab";
static NSString *const CONTESTS_TAB_INFO_POP_UP_NAME = @"contests_tab_info_popup";
static NSString *const SHOWS_TAB_POP_UP_NAME = @"shows_tab_info_popup";
static NSString *const PLAYGROUND_TAB_POP_UP_NAME = @"playground_tab_info_popup";


static NSString *const ALPHA_BLENDING_ENABLED = @"alphaBlendingEnabled";

//Twitter sdk

static NSString *const TWITTER_CONSUMER_KEY = @"pxqcHWLEg2bOy6pFghDAFVltj";
static NSString *const TWITTER_CONSUMER_SECRET_KEY = @"FcSGpSfFcjNSWYsBO1nfWx3QR1ZY28TOvJfYYbyegtu5WsbBgq";

static NSString *const TIKTOK_INSTRUCTION_POPUP_COUNT = @"TIKTOK_INSTRUCTION_POPUP_COUNT";
static NSString *const TIKTOK_INSTRUCTION_POPUP = @"tiktok_instruction_popup";


static NSString *const TOTAL_SHARE_COUNT = @"TOTAL_SHARE_COUNT";
static NSString *const SHARE_COUNT_PER_APP = @"SHARE_COUNT_PER_APP";
static NSString *const SHARE_APP_SEQUENCE = @"SHARE_APP_SEQUENCE";
static NSString *const LAST_APP_SHARES = @"LAST_APP_SHARES";
static NSString *const LAST_BOOSTED_APP = @"LAST_BOOSTED_APP";
static NSString *const NEXT_BOOST_CHECK = @"NEXT_BOOST_CHECK";

static NSString *const SHARE_COUNT_FOR_GUEST_USER = @"SHARE_COUNT_FOR_GUEST_USER";


static NSString *const WALLET_RECHAGRE_VIEW = @"deposit_wallet";
static NSString *const WALLET_RECHAGRE_ADD_BALANCE = @"add_balance";
static NSString *const WALLET_RECHAGRE_ADD_BALANCE_SUCCESS = @"balance_add_success";
static NSString *const WALLET_RECHAGRE_ADD_BALANCE_FAILURE = @"balance_add_Failed";
static NSString *const INSUFFICIENT_BALANCE_VIEW = @"insufficient_balance";

static NSString *const STYLE_ATTRIBUTE = @"STYLE_ATTRIBUTE";
static NSString *const BASE_ATTRIBUTE = @"BASE_ATTRIBUTE";

#endif /* StringConstant_h */

static NSString *const API_RESPONSE = @"API_RESPONSE";

static NSString *const IS_DSI0_PLAYED_OC = @"IS_DSI0_PLAYED_OC";

static NSString *const IS_DSI0_PLAYED_OC_VERSION = @"IS_DSI0_PLAYED_OC_VERSION";

static NSString *const PROFILE_PIC_EDITOR_VIEW = @"profile_picture_editor";

static NSString *const OB_GET_STARTED_SCREEN = @"get_started_screen_view";

static NSString *const MATCH_MAKING_TIME_KEY = @"match_making_time";
