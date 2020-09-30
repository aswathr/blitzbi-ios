//
//  BiConstants.h
//  ArVideoDemo
//
//  Created by Faizan on 12/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#ifndef BiConstants_h
#define BiConstants_h

static NSString *const EVENT_NAME_TAG = @"eventName";

#pragma Event_Names

static NSString *const JOIN_ROOM_EVENT_TAG = @"join_room";
static NSString *const POKE_ROOM_EVENT_TAG = @"poke_room";
static NSString *const POKE_FRIEND_EVENT_TAG = @"poke_friend";

static NSString *const EXIT_ROOM_EVENT_TAG = @"exit_room";
static NSString *const UPDATE_FILTER_EVENT_TAG = @"update_filter";
static NSString *const MUTE_STATUS_UPDATE_EVENT_TAG = @"mute_status_update";
static NSString *const CAMERA_STATUS_UPDATE_EVENT_TAG = @"camera_status_update";
static NSString *const LOCK_ROOM_UPDATE_EVENT_TAG = @"lock_room_update";
static NSString *const PROFILE_VIDEO_UPDATE_EVENT_TAG = @"profile_video_update";
static NSString *const HIGH_RESOLUTION_PROFILE_VIDEO_UPDATE_EVENT_TAG = @"high_resolution_profile_video_update";
static NSString *const NOTIFICATION_FIRED_EVENT_TAG = @"notification_fired";
static NSString *const NOTIFICATION_SENT_EVENT_TAG = @"notification_sent";
static NSString *const NOTIFICATION_CLICKED_EVENT_TAG = @"notification_clicked";
static NSString *const NOTIFICATION_SETTING_UPDATE_EVENT_TAG = @"notification_setting_update";
static NSString *const NOTIFICATION_RECEIVED_EVENT_TAG = @"notification_received";
static NSString *const SERVER_FAILURE = @"server_failure";
static NSString *const TAPLYTICS_DATA = @"taplytics_data";
static NSString *const VIDEO_FLOW = @"video_flow";
static NSString *const VIDEO_STAT_FPS = @"video_stat_fps";
static NSString *const NETWORK_STATS = @"network_stats";
static NSString *const FUE_START = @"fue_start";
static NSString *const FUE_TUTORIAL_COMPLETE = @"fue_tutorial_complete";
static NSString *const FUE_COMPLETE = @"fue_complete";
static NSString *const FUE_PHONE_NUMBER_VERIFIED = @"fue_phone_number_verified";
static NSString *const START_TURN = @"start_turn";
static NSString *const GAME_FLOW = @"game_flow";
static NSString *const END_TURN = @"end_turn";
static NSString *const END_ROUND = @"end_round";
static NSString *const FINISH_GAME = @"finish_game";
static NSString *const GENERIC_POPUP_SHOWN = @"generic_popup_shown";
static NSString *const GENERIC_VIEW_APPEAR = @"generic_view_appear";
static NSString *const GENERIC_VIEW_DISAPPEAR = @"generic_view_disappear";
static NSString *const APP_EXCEPTION = @"app_exception";
static NSString *const APP_EXTENSION_EXCEPTION_TAG = @"app_extension_exception";
static NSString *const ANIMATION_TRIGGERED = @"animation_triggered";
static NSString *const VIDEO_CALL_STARTED = @"video_call_start";
static NSString *const GAME_START = @"join_game";
static NSString *const END_GAME = @"end_game";
static NSString *const SERVER_TRIGGERED_EVENT = @"server_triggered_event";
static NSString *const AUDITION_LOG_EVENT = @"audition_log";

static NSString *const VIDEO_CALL_ENGAGED = @"video_call_engaged";
static NSString *const VIDEO_CALL_ENDED = @"video_call_end";
static NSString *const LAUNCHPAD_STATUS = @"launchpad_status";
static NSString *const SCREENSHOT_CAPTURE = @"screenshot_capture";
static NSString *const SCREENSHOT_SHARE = @"screenshot_share";
static NSString *const INAPP_TUTORIAL = @"inapp_tutorial";

static NSString *const TOKBOX_TIMER_EXPIRED = @"tokbox_timer_expired";

static NSString *const SUBSCRIBER_CALL_STARTED = @"subscriber_call_started";
static NSString *const SUBSCRIBER_CALL_CONNECTED = @"subscriber_call_connected";

static NSString *const LAUNCHPAD_DISPLAY = @"launchpad_display";

static NSString *const DIRECT_MEDIA_STATS = @"direct_media_stats";

#pragma Event field names

static NSString *const GENERIC_DATA_TAG = @"genericData";

static NSString *const ROOM_ID_TAG = @"roomId";
static NSString *const SOURCE_TAG = @"source";
static NSString *const FILTER_NAME_TAG = @"filterName";
static NSString *const FILTER_NAMES_TAG = @"filterNames";
static NSString *const ROOM_USER_IDS_TAG = @"roomUserIds";
static NSString *const USER_COUNT_TAG = @"userCount";
static NSString *const STATUS_TAG = @"status";
static NSString *const TARGET_USER_ID_TAG = @"targetUserId";
static NSString *const CONTACT_NUMBERS_TAG = @"contact_numbers";
static NSString *const DURATION_TAG = @"duration";
static NSString *const REASON_TAG = @"reason";
static NSString *const IS_SUCCESS_TAG = @"isSuccess";
static NSString *const IS_VIMOJI_TAG = @"isVimoji";
static NSString *const ROOM_STATUS_TAG = @"roomStatus";
static NSString *const PREVIOUS_STATUS_TAG = @"prevStatus";
static NSString *const NEW_STATUS_TAG = @"newStatus";
static NSString *const NOTIFICATION = @"notification";
static NSString *const NOTIFICATION_ID_TAG = @"notificationId";
static NSString *const NOTIFICATION_ALERT_TAG = @"alert";
static NSString *const NOTIFICATION_TYPE_TAG = @"notificationType";
static NSString *const NOTIFICATION_SUB_TYPE_TAG = @"notificationSubType";
static NSString *const NOTIFICATION_INTERACTIVE_FLAG_TAG = @"interactive_flag";
static NSString *const NOTIFICATION_OPT_IN_FLAG_TAG = @"optInFlag";
static NSString *const NOTIFICATION_IS_CHECK_FLAG_TAG = @"isCheck";
static NSString *const FUE_PHONE_NUMBER_REGISTERED = @"phoneNumberRegistered";
static NSString *const OLD_FILTER_TAG = @"oldFilter";
static NSString *const NEW_FILTER_TAG = @"newFilter";
static NSString *const NEW_FILTER_POSITION = @"newFilterPosition";
static NSString *const NO_FILTER_TAG = @"noFilter";
static NSString *const IS_USER_TRIGGERED_TAG = @"isUserTriggered";
static NSString *const TITLE_TAG = @"title";
static NSString *const MESSAGE_TAG = @"message";
static NSString *const FOLLOWER_COUNT = @"followers_count";
static NSString *const fOLLOWING_COUNT = @"following_count";

static NSString *const MUTE_TAG = @"mute";
static NSString *const UNMUTE_TAG = @"unmute";
static NSString *const SHOW_FRONT_CAMERA_TAG = @"showFrontCamera";
static NSString *const SHOW_REAR_CAMERA_TAG = @"showRearCamera";

static NSString *const VIDEO_FLOW_TYPE = @"type";
static NSString *const VIDEO_FLOW_STATUS = @"status";
static NSString *const VIDEO_FLOW_USERID = @"userId";
static NSString *const VIDEO_FLOW_PARTNER_USERID = @"partnerUserId";
static NSString *const VIDEO_FLOW_SESSIONID = @"sessionId";
static NSString *const VIDEO_FLOW_EXTRAINFO = @"extraInfo";
static NSString *const VIDEO_FLOW_FPS = @"fps";
static NSString *const TOKBOX_SESSIONID = @"tokboxSessionId";
static NSString *const TOKBOX_CONNECTIONID = @"tokboxConnectionId";
static NSString *const TOKBOX_SESSIONUSERS = @"tokboxSessionUsers";

static NSString *const PARTICIPANT_VIDEO_CALL_TYPE = @"call_type";
static NSString *const PARTICIPANT_VIDEO_CALL_STATUS = @"call_status";
static NSString *const PARTICIPANT_VIDEO_CALL_GAME_TYPE = @"game_type";
static NSString *const PARTICIPANT_VIDEO_CALL_STATUS_TIME = @"call_status_time";

static NSString *const PARTY_ROOM_HOST = @"party_room_host";
static NSString *const PHONE_NUMBER = @"phone_number";

static NSString *const SERVER_REQUEST_FAILURE_TYPE = @"failureType";
static NSString *const SERVER_REQUEST_ID = @"requestId";
static NSString *const SERVER_REQUEST_PATH = @"path";
static NSString *const SERVER_REQUEST_TIME = @"requestTime";
static NSString *const SERVER_REQUEST_ERROR = @"error";

static NSString *const TAPLYTICS_VARIABLE_NAME = @"variableName";
static NSString *const TAPLYTICS_VARIABLE_VALUE = @"variableValue";

static NSString *const NETWORK_VIDEO_BITRATE = @"video_bitrate";
static NSString *const NETWORK_VIDEO_PACKET_LOSS = @"video_packet_loss";

static NSString *const NETWORK_AUDIO_BITRATE = @"audio_bitrate";
static NSString *const NETWORK_AUDIO_PACKET_LOSS = @"audio_packet_loss";

static NSString *const NETWORK_TYPE = @"network_type";

static NSString *const FUE_TUTORIAL_COMPLETE_MODE = @"mode";
static NSString *const FUE_TUTORIAL_COMPLETE_SCREEN_NAME = @"screenName";
static NSString *const GENERIC_POPUP_TYPE = @"popupType";
static NSString *const GENERIC_POPUP_NAME = @"popupName";
static NSString *const GENERIC_POPUP_EXTRAINFO = @"extraInfo";
static NSString *const GENERIC_POPUP_EXTRAINFO_1 = @"extra_info_1";
static NSString *const GENERIC_POPUP_EXTRAINFO_2 = @"extra_info_2";
static NSString *const GENERIC_POPUP_EXTRAINFO_3 = @"extra_info_3";
static NSString *const GENERIC_POPUP_EXTRAINFO_4 = @"extra_info_4";
static NSString *const GENERIC_POPUP_EXTRAINFO_5 = @"extra_info_5";
static NSString *const GENERIC_POPUP_EXTRAINFO_6 = @"extra_info_6";
static NSString *const GENERIC_POPUP_EXTRAINFO_7 = @"extra_info_7";
static NSString *const GENERIC_POPUP_EXTRAINFO_8 = @"extra_info_8";
static NSString *const GENERIC_POPUP_EXTRAINFO_9 = @"extra_info_9";
static NSString *const GENERIC_POPUP_EXTRAINFO_10 = @"extra_info_10";
static NSString *const GENERIC_POPUP_EXTRAINFO_11 = @"extra_info_11";
static NSString *const GENERIC_POPUP_EXTRAINFO_12 = @"extra_info_12";
static NSString *const GENERIC_POPUP_EXTRAINFO_13 = @"extra_info_13";
static NSString *const GENERIC_POPUP_EXTRAINFO_14 = @"extra_info_14";
static NSString *const GENERIC_POPUP_EXTRAINFO_15 = @"extra_info_15";
static NSString *const GENERIC_POPUP_EXTRAINFO_16 = @"extra_info_16";
static NSString *const GENERIC_POPUP_EXTRAINFO_17 = @"extra_info_17";
static NSString *const GENERIC_POPUP_EXTRAINFO_18 = @"extra_info_18";
static NSString *const GENERIC_POPUP_EXTRAINFO_19 = @"extra_info_19";
static NSString *const GENERIC_POPUP_EXTRAINFO_26 = @"extra_info_26";
static NSString *const GENERIC_POPUP_EXTRAINFO_27 = @"extra_info_27";
static NSString *const GENERIC_POPUP_EXTRAINFO_28 = @"extra_info_28";
static NSString *const GENERIC_POPUP_EXTRAINFO_29 = @"extra_info_29";
static NSString *const GENERIC_POPUP_EXTRAINFO_30 = @"extra_info_30";//field_43
static NSString *const GENERIC_VIEW_APPEAR_NAME = @"viewName";
static NSString *const GENERIC_VIEW_DISAPPEAR_NAME = @"viewName";
static NSString *const GENERIC_CLICK_EVENT = @"generic_click";
static NSString *const GENERIC_CLICK_BUTTON_NAME = @"buttonName";
static NSString *const GENERIC_CLICK_VIEW_NAME = @"viewName";
static NSString *const GENERIC_CLICK_FIELD_1 = @"clickDetailsOne";
static NSString *const GENERIC_CLICK_FIELD_2 = @"clickDetailsTwo";
static NSString *const GENERIC_CLICK_FIELD_3 = @"clickDetailsThree";
static NSString *const GENERIC_CLICK_FIELD_4 = @"clickDetailsFour";
static NSString *const GENERIC_CLICK_FIELD_5 = @"clickDetailsFive";
static NSString *const GENERIC_CLICK_FIELD_6 = @"clickDetailsSix";
static NSString *const GENERIC_CLICK_FIELD_7 = @"clickDetailsSeven";
static NSString *const GENERIC_CLICK_FIELD_8 = @"clickDetailsEight";
static NSString *const GENERIC_CLICK_FIELD_9 = @"clickDetailsNine";
static NSString *const GENERIC_CLICK_FIELD_10 = @"clickDetailsTen";
static NSString *const GENERIC_CLICK_FIELD_11 = @"clickDetailsEleven";
static NSString *const GENERIC_CLICK_FIELD_12 = @"clickDetailsTweleve";
static NSString *const GENERIC_CLICK_FIELD_13 = @"clickDetailsThirteen";
static NSString *const GENERIC_CLICK_FIELD_14 = @"clickDetailsFourteen";
static NSString *const GENERIC_CLICK_FIELD_15 = @"clickDetailsFifteen";
static NSString *const GENERIC_CLICK_FIELD_16 = @"clickDetailsSixteen";
static NSString *const GENERIC_CLICK_FIELD_17 = @"clickDetailsSeventeen";
static NSString *const GENERIC_CLICK_FIELD_18 = @"clickDetailsEighteen";
static NSString *const GENERIC_CLICK_FIELD_19 = @"clickDetailsNineteen";
static NSString *const GENERIC_CLICK_FIELD_20 = @"clickDetailsTwenty";
static NSString *const GENERIC_CLICK_FIELD_26 = @"clickDetailsTwentySix";
static NSString *const GENERIC_CLICK_FIELD_27 = @"clickDetailsTwentySeven";
static NSString *const GENERIC_CLICK_FIELD_28 = @"clickDetailsTwentyEight";
static NSString *const GENERIC_CLICK_FIELD_29 = @"clickDetailsTwentyNine";
static NSString *const GENERIC_CLICK_FIELD_30 = @"clickDetailsThirty";
static NSString *const GENERIC_CLICK_FIELD_31 = @"clickDetailsThirtyOne";//field_43
static NSString *const GENERIC_CLICK_FIELD_32 = @"device_id";


static NSString *const EXCEPTION_NAME = @"exceptionName";
static NSString *const EXCEPTION_REASON = @"exceptionReason";
static NSString *const EXCEPTION_STACK_TRACE = @"stackTrace";
static NSString *const EXCEPTION_HANDLED = @"handled";
static NSString *const TRIGGER_NAME = @"triggerName";
static NSString *const ASSETS_RENDERED = @"assets_rendered";
static NSString *const BI_SELF_INITIATED_KEY = @"biSelfInitiatedKey";
static NSString *const GAME_USER_ROLE = @"userRole";
static NSString *const GAME_ID = @"gameId";
static NSString *const GAME_NAME = @"gameName";
static NSString *const GENRE_KEY = @"genre";
static NSString *const GAME_STATUS = @"status";
static NSString *const USER_COUNT = @"userCount";
static NSString *const NAME = @"name";
static NSString *const IS_IN_PARTY_ROOM = @"isparty_call";
static NSString *const VIEW_DETAILS_1 = @"viewDetails1";
static NSString *const VIEW_DETAILS_2 = @"viewDetails2";
static NSString *const VIEW_DETAILS_3 = @"viewDetails3";
static NSString *const VIEW_DETAILS_4 = @"viewDetails4";
static NSString *const VIEW_DETAILS_5 = @"viewDetails5";
static NSString *const VIEW_DETAILS_6 = @"viewDetails6";
static NSString *const VIEW_DETAILS_7 = @"viewDetails7";
static NSString *const VIEW_DETAILS_8 = @"viewDetails8";
static NSString *const VIEW_DETAILS_9 = @"viewDetails9";
static NSString *const SOURCE_VIEW_NAMES = @"source_view_names";
static NSString *const SOURCE_VIEW_DETAILS_1 = @"source_view_details1";
static NSString *const SOURCE_VIEW_DETAILS_2 = @"source_view_details2";
static NSString *const SOURCE_VIEW_DETAILS_4 = @"source_view_details4";
static NSString *const CURRENT_PROMPT_TYPE = @"current_prompt_type";
static NSString *const TRIGGER_SOURCE = @"trigger_source";
static NSString *const VIDEO_CALL_PERMISSION_TRIGGER = @"vc_permission_trigger";
static NSString *const LOCATION_PERMISSION_TRIGGER = @"location_permission_trigger";
static NSString *const USER_RESPONSE = @"user_response";
static NSString *const PREV_PROMPT_TYPE = @"prev_prompt_type";
static NSString *const RATING_PROMPT = @"rating_prompt";
static NSString *const SURVEY_PROMPT = @"survey_prompt";
static NSString *const FEEDBACK_PROMPT = @"feedback_prompt";
static NSString *const FEEDBACK_EMAIL_PAGE = @"feedback_email_page";
static NSString *const RATE_APP_PAGE = @"rate_app_page";
static NSString *const SHOW_RATING_PROMPT = @"show_rating_prompt";
static NSString *const SHOW_FEEDBACK = @"show_feedback";
static NSString *const SHOW_EMAIL = @"show_email";
static NSString *const SHOW_RATING_PAGE = @"show_rating_page";
static NSString *const DISMISS_RATING = @"dismiss_rating";
static NSString *const USER_STAR_RATING = @"user_star_rating";
static NSString *const IS_HOST_ACTIVE = @"is_host_active";
static NSString *const NUM_ROUNDS = @"num_rounds";

static NSString *const POPUP_TITLE = @"popup_title";
static NSString *const POPUP_DESC = @"popup_desc";

static NSString *const SPECIAL_FITERS_SECTION = @"special_filters_section";
static NSString *const GAME_MENU = @"game_menu";

static NSString *const CALL_DURATION = @"duration";
static NSString *const CALL_USER_COUNT = @"userCount";
static NSString *const CALL_USERID_LIST = @"userList";
static NSString *const CALL_ACTIVE_USERID_LIST = @"activeUserList";
static NSString *const CALL_PASSIVE_USERID_LIST = @"passiveUserList";
static NSString *const CALL_FRIENDS_USERID_LIST = @"friendUserIds";
static NSString *const CALL_INITIATED = @"callInitiated";
static NSString *const CALL_MODE = @"mode";
static NSString *const IS_ALONE = @"isAlone";
static NSString *const IS_YT_LIVE = @"isYtLive";
static NSString *const IS_PARTY_CALL = @"isparty_call";
static NSString *const HOST_FLAG = @"host_flag";
static NSString *const IS_LIVE_STREAMING = @"is_live_streaming";
static NSString *const VIDEO_CALL_START_TIME = @"video_call_start_time";
static NSString *const GAME_START_TIME = @"game_start_time";
static NSString *const MATCH_MAKING_PARAMS = @"match_making_params";
static NSString *const MATCH_MAKING_FLAG = @"match_making_flag";

static NSString *const ONLINE_COUNT = @"onlineCount";
static NSString *const OFFLINE_COUNT = @"offlineCount";

static NSString *const MEDIUM_TAG = @"medium";
static NSString *const IS_USER_TRIGGERED = @"isUserTriggered";
static NSString *const DEEPLINK_SUFFIX_TAG = @"deeplinkSuffix";

static NSString *const PN_MESSAGE_SENT_EVENT_NAME = @"pubnub_message_sent";
static NSString *const PN_MESSAGE_RECEIVED_EVENT_NAME = @"pubnub_message_received";
static NSString *const PN_MESSAGE_CLICKED_EVENT_NAME = @"pubnub_message_clicked";

static NSString *const PN_EVENT_NAME = @"pubnub";
static NSString *const PN_ACTION = @"action";
static NSString *const PN_RESULT = @"result";
static NSString *const PN_RESULT_SUCCESS = @"success";
static NSString *const PN_RESULT_FAILURE = @"failure";

static NSString *const PN_ADD_CHANNEL_TO_GROUP = @"addChannelToGroup";
static NSString *const PN_REMOVE_CHANNELS_FROM_GROUP = @"removeChannelFromGroup";
static NSString *const PN_GET_CHANNELS_FROM_GROUP = @"getChannelsFromGroup";
static NSString *const PN_GET_HERE_NOW_FOR_GROUP = @"getHereNowForGroup";
static NSString *const PN_SUBSCRIPTION_OPERATION = @"PNSubscribeOperation";
static NSString *const PN_UNSUBSCRIPTION_OPERATION = @"PNUnsubscribeOperation";
static NSString *const PN_HEARTBEAT_OPERATION = @"PNHeartbeatOperation";
static NSString *const PN_PUBLISH = @"publish";
static NSString *const PN_SET_STATE = @"setState";
static NSString *const PN_GET_STATE = @"getState";
static NSString *const PN_HERENOW_CHANNEL = @"hereNowChannel";

static NSString *const PN_CHANNEL_NAME = @"channelName";
static NSString *const PN_CHANNEL_GROUP_NAME = @"channelGroupName";
static NSString *const PN_MESSAGE = @"message";
static NSString *const PN_UUID = @"uuid";
static NSString *const PN_RETRY_COUNT = @"retryCount";
static NSString *const PN_ERROR_CATEGORY = @"errorCategory";
static NSString *const PN_ERROR_DESCRIPTION = @"errorDescription";

static NSString *const JOIN_TAG = @"join";
static NSString *const LEAVE_TAG = @"leave";
static NSString *const HERE_NOW_INITIATE_TAG = @"here_now_initiate_tag";
static NSString *const SET_SERVER_TIME_TAG = @"set_server_time";
static NSString *const SET_SERVER_TIME_FROM_DIFF_TAG = @"set_server_time_from_diff";
static NSString *const GLOBAL_HERE_NOW_INITIATE_TAG = @"global_here_now_initiate_tag";
static NSString *const HERE_NOW_TAG = @"here_now";
static NSString *const GLOBAL_HERE_NOW_TAG = @"global_here_now";
static NSString *const HERE_NOW_STATE = @"here_now_state";
static NSString *const RESULT_TAG = @"result";
static NSString *const STATE_TAG = @"state";
static NSString *const RECEIVE_TAG = @"receive";
static NSString *const ONLINE_USER_IDS_TAG = @"onlineUserIds";
static NSString *const OFFLINE_USER_IDS_TAG = @"offlineUserIds";
static NSString *const FOLLOWERS_COUNT = @"followers_count";
static NSString *const FOLLOWING_COUNT = @"following_count";
static NSString *const TIMEOUT_TAG = @"timeout";
static NSString *const EVENT_TYPE_TAG = @"eventType";
static NSString *const FOR_USER_ID_TAG = @"forUserId";
static NSString *const TO_USER_ID_TAG = @"toUserId";

static NSString *const VIEW_NAME_TAG = @"viewName";
static NSString *const IS_SAVED_TO_GALLERY_TAG = @"isSavedToGallery";
static NSString *const IS_SHARED_TAG = @"isShared";

static NSString *const ROOM_TYPE = @"room_type";

static NSString *const INVITE_TAG = @"invite";
static NSString *const IS_GROUP_INVITE_TAG = @"is_groupinvite";
static NSString *const IS_INVITED_TAG = @"is_invited";
static NSString *const INVITEES_COUNT_TAG = @"invitees_count";
static NSString *const INVITEE_NAME_TAG = @"invitee_name";
static NSString *const INVITE_UUID_TAG = @"invite_uuid";
static NSString *const CATEGORY_TAG = @"category";
static NSString *const FAILURE_CODE_TAG = @"failure_code";
static NSString *const CARD_POSITION = @"card_position";
static NSString *const LOBBY_CONTENT_TAG = @"lobby_content";

static NSString *const PLATFORM_TYPE_TAG = @"platform_type";
static NSString *const PLATFORM_SUB_TYPE_TAG = @"platform_sub_type";

static NSString *const GUE = @"GUE";
static NSString *const GUE_CURRENT_STATE = @"currentState";
static NSString *const GUE_PREVIOUS_STATE = @"previousState";
static NSString *const GUE_STATE_USER_TRIGGERED = @"user_triggered";
static NSString *const GUE_LAST_ACTION = @"lastAction";
static NSString *const GUE_EXTRA_DATA = @"extraData";

static NSString *const EVENT_START_STREAM = @"start_stream_live";
static NSString *const EVENT_STOP_STREAM = @"stop_stream_live";
static NSString *const EVENT_STREAM_API = @"youtube_api";
static NSString *const EVENT_STREAM_FLOW = @"youtube_live_flow";
static NSString *const EVENT_STREAM_SETTINGS = @"live_settings";

static NSString *const STREAM_TO_FACEBOOK = @"stream_to_facebook";
static NSString *const STREAM_TO_YOUTUBE = @"stream_to_youtube";
static NSString *const OVERFLOW_MENU_STREAM_TO_FACEBOOK = @"overflow_menu_stream_to_fb";
static NSString *const OVERFLOW_MENU_STREAM_TO_YOUTUBE = @"overflow_menu_stream_to_yt";
static NSString *const STREAMING_TO_FACEBOOK = @"streaming_to_facebook";
static NSString *const OVERFLOW_MENU_STREAMING_TO_FACEBOOK = @"overflow_menu_streaming_to_fb";
static NSString *const STREAMING_TO_YOUTUBE = @"streaming_to_youtube";
static NSString *const OVERFLOW_MENU_STREAMING_TO_YOUTUBE = @"overflow_menu_streaming_to_yt";
static NSString *const STREAM_ACTIVE_BUTTON = @"stream_active_button";

static NSString *const LIVE_STREAM_ID = @"streamId";
static NSString *const LIVE_STREAM_DURATION = @"duration";
static NSString *const LIVE_STREAM_SUCCESS = @"success";
static NSString *const LIVE_STREAM_API_TYPE = @"api_type";
static NSString *const LIVE_STREAM_PLATFORM = @"platform";
static NSString *const LIVE_STREAM_RESPONSE = @"response";
static NSString *const LIVE_STREAM_EXTRA = @"extra";
static NSString *const LIVE_STREAM_TOKBOX = @"tokbox_session";
static NSString *const LIVE_STREAM_STATE = @"current_state";
static NSString *const LIVE_STREAM_USER_ACTION = @"user_action";
static NSString *const LIVE_STREAM_ENABLED = @"enabled_flag";

static NSString *const RECOMMENDED_FRIENDS_POPUP = @"invite_friends_recommended_popup";
static NSString *const RECOMMENDED_FRIENDS_TO_IMESSAGE = @"invite_friends_recommended_through_imessage";
static NSString *const CONTACT_PICKER_POPUP = @"invite_friends_contact_picker";
static NSString *const FRIEND_CENTER_POPUP = @"invite_friends_friend_center";
static NSString *const FIRE_STARTER_CONTACT_PICKER_POPUP = @"fire_starter_contact_picker";

static NSString *const LOCK_ROOM_TAG = @"lock_room";
static NSString *const IS_LOCKED_TAG = @"is_locked";
static NSString *const SEARCH_TERM_TAG = @"search_term";
static NSString *const BI_APP_RATING = @"app_rating";

static NSString *const SESSION_ID_TAG = @"session_id";
static NSString *const SESSION_JOIN_TAG = @"session_join";
static NSString *const SESSION_LEAVE_TAG = @"session_leave";
static NSString *const SESSION_TIMEOUT_TAG = @"session_timeout";
static NSString *const SESSION_RECEIVE_TAG = @"session_receive";

static NSString *const BLOCK_BUTTON_TOP_PARTY_CALL = @"party_call";
static NSString *const BLOCK_BUTTON_TOP_BLOCK = @"block";
static NSString *const BLOCK_BUTTON_TOP_MENU = @"top_menu";
static NSString *const BLOCK_BUTTON_OVERFLOW = @"overflow_button";
static NSString *const JRTOP_MENU_TAG = @"jrtop_menu";
static NSString *const PROFILE_EDIT_TAG = @"profile_edit";

static NSString *const BLOCKED_BY_USER_ID_FORM_GLOBAL_CHAT_ROOM = @"blockeruserId";
static NSString *const DISCONNECTED_BEFORE_CALL_CONNECTS = @"disconnected_before_call_connects";

static NSString *const NOT_LIVE = @"-1";
static NSString *const YT_LIVE = @"1";
static NSString *const FB_LIVE = @"2";

static NSString *const DIRECT_CALL = @"0";
static NSString *const PARTY_CALL_WITH_HOST = @"1";
static NSString *const PARTY_CALL_WITHOUT_HOST = @"2";
static NSString *const GAME_SHOW_CALL = @"3";
static NSString *const GAME_SHOW_TEAM_CALL = @"4";

static NSString *const IN_CALL = @"call";
static NSString *const IN_GAME = @"game";

static NSString *const IS_ALONE_IN_CALL = @"1";
static NSString *const IS_NOT_ALONE_IN_CALL = @"0";

static NSString *const IS_GLOBAL_CHAT_ROOM_HOST = @"1";
static NSString *const IS_NOT_GLOBAL_CHAT_ROOM_HOST = @"0";

static NSString *const IS_PASSIVE = @"passive";
static NSString *const IS_PROACTIVE = @"proactive";
static NSString *const IS_ACTIVE = @"active";

static NSString *const JUMP_IN_BUTTON_CLICKED = @"jumpin";
static NSString *const GIF_CLICKED = @"gif_click";
static NSString *const ENTER_ROOM_CLICKED = @"enter_room";
static NSString *const AUTO_ENTERED_IN_PARTY_ROOM = @"auto";

static NSString *const CALL_CONNECTED = @"0";
static NSString *const DISCONNECTED_BEFORE_CONNECTING = @"1";

static NSString *const PARTY_ROOM_ID = @"party_room_id";
static NSString *const PARTY_ROOM_NAME = @"party_room_name";

static NSString *const SUCCESS_TEXT = @"success";
static NSString *const FAILURE_TEXT = @"failure";

static NSString *const APP_RETURNED = @"app_returned";
static NSString *const DEEP_LINK_URL_FOR_BI = @"deepLinkUrl";

static NSString *const JOIN_LIVE_STREAM_POP_UP = @"join_livestream_warning_popup";
static NSString *const PERMISSION_POP_UP = @"permissions_pop_up";
static NSString *const LIVE_STREAMING_USER_ID = @"livestreaming_user_id";
static NSString *const EXTRA_INFO_POPUP = @"extra_info";

static NSString *const PHONE_NUMBER_KEY = @"phoneNumber";

static NSString *const USER_MY_FRIEND = @"1";
static NSString *const USER_NOT_MY_FRIEND = @"0";

static NSString *const ERROR_POPUP = @"error_popup";
static NSString *const USER_PROFILE = @"user_profile";

static NSString *const USER_STATE = @"user_state";
static NSString *const USER_STATE_NO_CALL = @"-1";
static NSString *const USER_STATE_DIRECT_CALL = @"0";
static NSString *const USER_STATE_PARTY_CALL_ALONE = @"1";
static NSString *const USER_STATE_PARTY_CALL_NOT_ALONE = @"2";
static NSString *const INVITE_MESSAGE = @"invite_message";
static NSString *const INVITE_URL = @"invite_url";
static NSString *const TOP_VIEW_NAME = @"view_name";
static NSString *const CUSTOM_MF_MESSAGE_COMPOSE_VIEW_NAME = @"Custom MF Message Composition View";
static NSString *const SCREENSHOT_VIEW_NAME = @"Screenshot_View";
static NSString *const LAUNCHPAD_VIEW_NAME = @"Launchpad_View";
static NSString *const TOP_MENU = @"top_menu";
static NSString *const SHOW_CHAT = @"show_chat";
static NSString *const FRIEND_CENTER_VIEW_NAME = @"Friend_Center";
static NSString *const SETTINGS_VIEW_NAME = @"settings_view";
static NSString *const GLOBAL_ROOM_VIEW_NAME = @"Global_Room";
static NSString *const SELFIE_VIEW_NAME = @"Selfie_View";
static NSString *const VIDEO_CALL_VIEW_NAME = @"Video_Call_View";//VIEW_NAME for popup has suffix  '_popup'
static NSString *const POPUP_SUFFIX_VIEW_NAME = @"_Popup";
static NSString *const VOICE_ERROR_POPUP_VIEW_NAME = @"Voice_Error_Popup";
static NSString *const USER_PROFILE_POPUP_VIEW_NAME = @"User_Profile_Popup";
static NSString *const OTHER_USER_PROFILE_POPUP_VIEW_NAME = @"Other_User_Profile_Popup";
static NSString *const CONFIRM_EDUCATION_POPUP_VIEW_NAME = @"Confirm_Education_Popup";
static NSString *const ON_BLOCKED_FROM_GLOBAL_ROOM_POPUP_VIEW_NAME = @"On_Blocked_Popup";
static NSString *const ON_BANNED_POPUP_VIEW_NAME = @"On_Banned_Popup";
static NSString *const ON_REMOTE_DISCONNECT_REQUEST_POPUP_VIEW_NAME = @"On_Remote_Disconnect_Popup";
static NSString *const USER_BANNED_POPUP_VIEW_NAME_DURING_DIFF = @"Banned_user_popup";
static NSString *const FULL_ROOM_POPUP_VIEW_NAME = @"Full Room Popup";
static NSString *const NOT_ALLOWED_IN_DEMO_ENV_POPUP_VIEW_NAME = @"Not Allowed In Demo Env Popup";
static NSString *const LOGIN_VALIDATION_FAILED_POPUP_VIEW_NAME = @"Login Validation Failed Popup";
static NSString *const UNDERAGE_POPUP_VIEW_NAME = @"Under Age popup";
static NSString *const OPTIONAL_UPDATE_POPUP_VIEW_NAME = @"Optional Update popup";
static NSString *const RESTART_APPLICATION_POPUP_VIEW_NAME = @"Restart Application  popup";
static NSString *const NOTIFICATION_PERMISSION_POPUP_VIEW_NAME = @"Notification Permission  popup";
static NSString *const SPEECH_RECOGNITION_RESULT_POPUP_VIEW_NAME = @"Speech Recognition Result  popup";
static NSString *const CONTACT_FETCH_FAIL_POPUP_VIEW_NAME = @"Contact Fetch Fail  popup";
static NSString *const ON_BLOCKED_SUCCESS_POPUP_VIEW_NAME = @"On Blocked Success popup";
static NSString *const SMS_NOT_SUPPORTED_POPUP_VIEW_NAME = @"SMS Not Supported popup";
static NSString *const FORCED_UPDATE_POPUP_VIEW_NAME = @"Forced Update popup";
static NSString *const LOCKED_ROOM_POPUP_VIEW_NAME = @"Locked Room Popup";
static NSString *const CHAT_MUTE_POPUP_VIEW_NAME = @"User Chat Muted Popup";
static NSString *const EDUCATION_HISTORY_ERROR_POPUP_VIEW_NAME = @"Education History Error Popup";
static NSString *const PARTY_ROOM_GUE_INIT_POPUP_VIEW_NAME = @"Party Room GUE Initial Popup";
static NSString *const PREFIX_FOR_GAME_BANNER_POPUP = @"Game_Banner_";
static NSString *const PREFIX_FOR_PRE_ASK_POPUP_FOR_PERMISSION = @"Pre_Ask_";
static NSString *const PREFIX_FOR_BLOCKING_POPUP_FOR_PERMISSION = @"Blocking_";
static NSString *const PREFIX_FOR_NON_BLOCKING_POPUP_FOR_PERMISSION = @"Non_Blocking_";
static NSString *const CONTACT_PERMISSION_VIEW_NAME = @"Contact Permission Popup";
static NSString *const VIDEO_PERMISSION_VIEW_NAME = @"Video Permission Popup";
static NSString *const LOCATION_PERMISSION_VIEW_NAME = @"Location Permission Popup";
static NSString *const AUDIO_PERMISSION_VIEW_NAME = @"Audio Permission Popup";
static NSString *const NOTIFICATION_PERMISSION_VIEW_NAME = @"Notification Permission Popup";
static NSString *const NPS_RATING_POPUP_VIEW_NAME = @"Nps_Rating_Popup";
static NSString *const SAVE_FILE_PERMISSION_VIEW_NAME = @"Save File Permission Popup";
static NSString *const ADMIN_MODE_TOGGLE_POPUP_VIEW_NAME = @"Admin Mode Toggle";
static NSString *const FRIEND_LIMIT_EXCEEDED  = @"Friend_Limit_Exceeded";


//random collectable generator
static NSString *const COLLECTABLE_SPIN = @"collectible_game";

static NSString *const MINI_GAME_POPUP_TYPE = @"mini_game_popup";
static NSString *const COLLECTABLE_GENERATOR_POPUP_TYPE = @"collectable_gen_popup";
static NSString *const RANDOM_GENERATOR_POPUP = @"random_gen_popup";
static NSString *const QUIZZO_GENERATOR_POPUP = @"quizzo_mini_game_popup";


static NSString *const CHALLENGER_POPUP_TYPE = @"challenger_popup";
static NSString *const CHALLENGER_INTRO_POPUP = @"challenger_prompt";
static NSString *const CHALLENGER_SUCCESS_POPUP = @"challenger_success";
static NSString *const CHALLENGER_RATING_POPUP = @"challenger_rating_popup";
static NSString *const CHALLENGER_INTRO_BUTTON = @"challenger_request";
static NSString *const CHALLENGER_RATING_POPUP_AUTO = @"challenger_rating_popup_auto";

static NSString *const CREATE_SHOW_POPUP_TYPE = @"create_show";
static NSString *const CREATE_SHOW_LP_POPUP_TYPE = @"create_show_lp";
static NSString *const CREATE_SHOW_INTRO_POPUP = @"create_show_intro_popup";
static NSString *const CREATE_SHOW_SELECT_POPUP = @"create_show_select_popup";
static NSString *const CREATE_SHOW_THEME_POPUP = @"create_show_theme_popup";
static NSString *const CREATE_SHOW_WEB_LOGIN_POPUP = @"create_show_web_login_popup";
static NSString *const CREATE_SHOW_CONFIG_POPUP = @"show_config_select_popup";
static NSString *const CREATE_SHOW_URL_POPUP = @"create_show_url_popup";
static NSString *const CREATE_SHOW_START_TIMER_POPUP = @"create_show_start_timer";
static NSString *const SHOW_RATING_POPUP_TYPE = @"show_rating_popup";
static NSString *const COMPENSATION_REWARD_POPUP_TYPE = @"compensation_reward_popup";
static NSString *const COMPENSATION_REWARD_CONGRATS = @"compensation_reward_congrats_popup";
static NSString *const COMPENSATION_REWARD_AGREEMENT = @"compensation_reward_agreement_popup";
static NSString *const COMPENSATION_REWARD_ACCEPT = @"compensation_reward_accept_popup";
static NSString *const COMPENSATION_REWARD_REJECT = @"compensation_reward_rejects_popup";
static NSString *const COMPENSATION_PARTNER_APPLICATION = @"compensation_partner_application_popup";
static NSString *const COMPENSATION_APPLICATION_SUBMIT = @"compensation_application_submit_popup";
static NSString *const COMPENSATION_PARTNER_APPLICATION_SUBMIT = @"compensation_partner_application_submit_popup";
static NSString *const CREATE_SHOW_BROADCASTER_TIER = @"create_show_broadcaster_tier_popup";
static NSString *const CREATE_SHOW_BROADCASTER_TIER_CHANGE_VIEW = @"create_show_broadcaster_tier_change_view_popup";
static NSString *const ACHIEVEMENT_DESCRIPTION_POPUP = @"achievement_description_view_popup";

static NSString *const WALLET_TNC_POPUP_TYPE = @"wallet_tnc_popup";
static NSString *const WALLET_TNC_AGREEMENT = @"wallet_tnc_agreement_popup";

static NSString *const CREATE_SHOW_UPDATE_GIF_VIEW = @"create_show_update_gif_view_popup";

static NSString *const SNAP_GROW_AUDIANCE_POPUP_TYPE = @"snap_grow_audiance_popup";
static NSString *const SNAP_GROW_COMPLETE_POPUP_TYPE = @"snap_grow_complete_popup";
static NSString *const SNAP_VIDEO_CAPTURE_POPUP_TYPE = @"snap_video_capture_popup";
static NSString *const SNAP_VIDEO_SHARE_POPUP_TYPE = @"snap_video_share_popup";
static NSString *const VIDEO_REC_FAIL_POPUP = @"snap_video_capture_fail_popup";
static NSString *const RECORD_AUDITION_GUIDELINE_POPUP_TYPE = @"audition_guideline";
static NSString *const RECORD_SNAP_GUIDELINE_POPUP_TYPE = @"snap_native_guideline";

static NSString *const AGREEMENT_ACCEPTED = @"ACCEPTED";
static NSString *const AGREEMENT_REJECTED = @"REJECTED";
static NSString *const AGREEMENT_NOT_SEEN = @"NOT_SEEN";

//reward service related popups
static NSString *const STREAK_REWARD_SERVICE_POPUP_TYPE = @"STREAK_REWARDS_VIEW";
static NSString *const STREAK_CHEST_INFO_POPUP_NAME = @"streakChestInfoPopup";
static NSString *const STREAK_REWARD_SERVICE_VIEW_NAME = @"STREAK_REWARDS_VIEW";
static NSString *const LAUNCHPAD_STREAK_REWARD_SERVICE_VIEW_NAME = @"LAUNCHPAD_STREAK_REWARDS_VIEW";

//product purchase popups
static NSString *const PURCHASE_CONFIRM_POPUP_TYPE = @"inapp_purchase_popup";
static NSString *const PURCHASE_RECEIPT_POPUP_TYPE = @"inapp_purchase_receipt_popup";
static NSString *const PURCHASE_RECEIPT_SENT_SUCCESS_POPUP_NAME = @"inapp_purchase_receipt_sent_success";
static NSString *const PURCHASE_RECEIPT_SENT_FAILURE_POPUP_NAME = @"inapp_purchase_receipt_sent_failure";
static NSString *const PURCHASE_RECEIPT_NOT_FOUND_POPUP_NAME = @"inapp_purchase_receipt_not_found";
static NSString *const PURCHASE_RECEIPT_REFRESH_FAIL_POPUP_NAME = @"inapp_purchase_receipt_refresh_fail";
static NSString *const PURCHASE_CONFIRMATION_POPUP_NAME = @"purchase_confirmation_popup";//for consumable
static NSString *const CREATOR_PURCHASE_CONFIRMATION_POPUP_NAME = @"purchase_creator_confirmation_popup";//for consumable
static NSString *const PURCHASE_SUBSCRIPTION_CONFIRMATION_POPUP_NAME = @"purchase_subscription_confirmation_popup";
static NSString *const PURCHASE_CREATOR_SUBSCRIPTION_CONFIRMATION_POPUP_NAME = @"purchase_creator_subscription_popup";
static NSString *const PURCHASE_SUBSCRIPTION_ONBOARDING_POPUP_NAME = @"purchase_subscription_onboarding_popup";
static NSString *const RESUBS_PITCH_POPUP = @"restore_subscription_popup";
static NSString *const PURCHASE_SUCCESS_POPUP_NAME = @"purchase_success_popup";
static NSString *const PURCHASE_FAIL_POPUP_NAME = @"purchase_fail_popup";
static NSString *const PURCHASE_SUCCESS_SYSTEM_POPUP_NAME = @"purchase_success_system_popup";
static NSString *const PURCHASE_HACK = @"purchase_potential_hacking";
static NSString *const PURCHASE_DISABLED_POPUP_NAME = @"purchase_disabled_popup";

//Live streaming constants for popups
static NSString *const DEFAULT_START_STREAM_POPUP_VIEW_NAME = @"Start_Stream_Popup";
static NSString *const FACEBOOK_START_STREAM_POPUP_VIEW_NAME = @"FB_Start_Stream_Popup";
static NSString *const LOBBY_FACEBOOK_STREAM_POPUP_SUCCESS_VIEW_NAME = @"Lobby_facebook_stream_popup_success";
static NSString *const LOBBY_FACEBOOK_STREAM_API_ERROR_POPUP_VIEW_NAME = @"Lobby_facebook_stream_api_error_popup";

//Live streaming constants for actions
static NSString *const START_STREAM = @"start_stream";
static NSString *const SETTINGS = @"settings";
static NSString *const CANCEL = @"cancel";
static NSString *const DISMISSAL = @"Dismissal";
static NSString *const SHARE_STREAM = @"share_stream";
static NSString *const END_STREAM = @"end_stream";
static NSString *const SKIP = @"skip";
static NSString *const RETRY_BTN = @"retry";

static NSString *const LIVE_STREAM_POPUP = @"Live_stream_popup";

static NSString *const LAUNCHPAD_LIVE_STREAM_WARNING_POPUP_VIEW_NAME = @"Launchpad_Live_Stream_Warning_Popup";

static NSString *const LIVE_STREAM_SHARE_POPUP_VIEW_NAME = @"share_livestream_popup";

static NSString *const STREAMER_POPUP_VIEW_NAME = @"Streamer_Popup";
static NSString *const NON_STREAMER_POPUP_VIEW_NAME = @"Non_Streamer_Popup";
static NSString *const STREAM_ERROR_POPUP_VIEW_NAME = @"Stream_Error_Popup";
static NSString *const STOP_STREAM_POPUP_VIEW_NAME = @"Stop_Stream_Popup";
static NSString *const ERROR_HANDLER_POPUP_VIEW_NAME = @"Error_Handler_Popup";
static NSString *const SESSION_DEBUG_POPUP_VIEW_NAME = @"Session_Debug_Popup";
static NSString *const BAN_AND_BLOCK_POPUP_VIEW_NAME = @"Ban_Block_Popup";
static NSString *const BLOCK_POPUP_VIEW_NAME = @"Block_Popup";
static NSString *const BAN_POPUP_VIEW_NAME = @"Ban_Popup";
static NSString *const GAME_NOT_AVAILABLE_VIEW_NAME = @"Game_Not_Available";
static NSString *const GAME_FACE_OFF_VIEW_NAME = @"Game_Face_Off";
static NSString *const GAME_FEAT_VIEW_NAME = @"Game_Feat";
static NSString *const GAME_JOYRIDE_VIEW_NAME = @"Game_Joyride";
static NSString *const GAME_TRIVIA_VIEW_NAME = @"Game_Trivia";
static NSString *const GAME_HEADSHOT_VIEW_NAME = @"Game_HeadShot";
static NSString *const GAME_POPTRIVIA_VIEW_NAME = @"Game_Pop_Trivia";
static NSString *const GAME_AUDIOTRIVIA_VIEW_NAME = @"Game_Audio_Trivia";
static NSString *const GAME_SHOWTRIVIA_VIEW_NAME = @"Game_Show_Trivia";
static NSString *const GAME_SHOW_VIEW_NAME = @"Game_Show_View";
static NSString *const GAME_FAMILYFEUD_VIEW_NAME = @"Game_Family_Feud";
static NSString *const HELP_NO_EMAIL_POPOP_VIEW_NAME = @"help_no_email_popup";
static NSString *const HELP_DRAFT_POPOP_VIEW_NAME = @"help_draft_popup";
static NSString *const HELP_SUCCESS_POPOP_VIEW_NAME = @"help_success_popup";
static NSString *const HELP_FAIL_POPOP_VIEW_NAME = @"help_fail_popup";
static NSString *const AUTH_FAIL_POPOP_VIEW_NAME = @"AUTH_FAIL_POPOP_VIEW_NAME";
static NSString *const BG_APP_REFRESH_FAIL_POPOP_VIEW_NAME = @"BG_APP_REFRESH_FAIL_POPOP_VIEW_NAME";

static NSString *const BUY_BUTTON_NAME = @"buy";
static NSString *const TOP_MENU_KEY_BUTTON_NAME = @"top_menu_key_buy";
static NSString *const SHOW_CARD_VIEW = @"show_card_view";
static NSString *const LOBBY_VIEW = @"lobby_view";
static NSString *const LONG_PRESS = @"long_press";
static NSString *const VIEW_TAP = @"VIEW_TAP";
static NSString *const SELFIE_VIEW_NAME_FOR_BI = @"selfie_view";
static NSString *const LAUNCHPAD_VIEW = @"launchpad_view";
static NSString *const USER_PROFILE_VIEW_LONG_PRESS = @"user_profile";
static NSString *const PARTY_CALL_VIEW_NAME_FOR_BI = @"party_call";
static NSString *const DIRECT_CALL_VIEW_NAME_FOR_BI = @"direct_call";
static NSString *const IS_FRIEND = @"1";
static NSString *const NOT_MY_FRIEND = @"0";
static NSString *const CANCEL_BUTTON = @"CANCEL";
static NSString *const BAN_BUTTON = @"BAN";
static NSString *const BLOCK_BUTTON = @"BLOCK";
static NSString *const FRIEND_TEXT = @"_FRIENDS";
static NSString *const KEYS_TEXT = @"Keys";
static NSString *const LAUNCHPAD_CARD_VIEW = @"launchpad_card";
static NSString *const LAUNCHPAD_TOP_HEADER_VIEW = @"launchpad_top_header_view";


#pragma matchMaking
static NSString *const USER_GROUP_AGE_MEAN = @"mean";
static NSString *const USER_GROUP_AGE_VARIANCE = @"variance";
static NSString *const USER_GROUP_AGE_MEAN_TOLERANCE_FINAL_PERCENTAGE = @"mean_tolerance";//final tolerance used for mean
static NSString *const USER_GROUP_AGE_MEAN_TOLERANCE_CHANGE_ITERATION_COUNT = @"mean_tol_change_count";
static NSString *const USER_GROUP_GEO_COUNTRY_FOR_JOINING_USER = @"geo_country";
static NSString *const USER_GROUP_GEO_PERCENTAGE = @"geo_percentage";

#pragma onboarding
static NSString *const ONBOARDING_EVENT_TAG = @"onboarding";
static NSString *const ONBOARDING_SCREEN_NAME = @"screenName";
static NSString *const ONBOARDING_DETAILS_ONE = @"detailsOne";
static NSString *const ONBOARDING_DETAILS_TWO = @"detailsTwo";
static NSString *const ONBOARDING_DETAILS_THREE = @"detailsThree";
static NSString *const ONBOARDING_DETAILS_FOUR = @"detailsFour";
static NSString *const ONBOARDING_DETAILS_FIVE = @"detailsFive";
static NSString *const ONBOARDING_DETAILS_SIX = @"detailsSix";
static NSString *const ONBOARDING_DETAILS_SEVEN = @"detailsSeven";
static NSString *const ONBOARDING_DETAILS_EIGHT = @"detailsEight";
static NSString *const ONBOARDING_DETAILS_NINE= @"detailsNine";
static NSString *const ONBOARDING_DETAILS_TEN = @"detailsTen";
static NSString *const ONBOARDING_ERROR_EVENT_TAG = @"onboarding_error";
static NSString *const ONBOARDING_ERROR_MESSAGE = @"errorMessage";
static NSString *const ONBOARDING_ERROR_CODE = @"errorCode";
static NSString *const ONBOARDING_VIEW_VISIBLE = @"view_visible";
static NSString *const ONBOARDING_VIEW_GONE = @"view_gone";
static NSString *const ONBOARDING_FORWARD_DIRECTION = @"done";
static NSString *const ONBOARDING_BACKWARD_DIRECTION = @"back";
static NSString *const ONBOARDING_NO_DIRECTION = @"";
static NSString *const ONBOARDING_CODE_ERROR = @"code_error";
static NSString *const ONBOARDING_PHONE_STEP = @"phone_step";
static NSString *const ONBOARDING_OTP_STEP = @"otp_step";
static NSString *const ONBOARDING_USERNAME_STEP = @"username_step";
static NSString *const ONBOARDING_SOURCE = @"source";
static NSString *const ONBOARDING_OTP_RESEND = @"otp_resend";

static NSString *const BI_DELIMITER = @"::";

#pragma partner_calls
static NSString *const PARTNER_CALLS_EVENT_TAG = @"partner_calls";
static NSString *const PARTNER_CALLS_DETAILS = @"call_details";

#pragma mark App Level
static NSString *const DIFF_SUCCESS_EVENT = @"diff_success";
static NSString *const DIFF_SUCCESS_ERROR = @"error";

static NSString *const PARTIAL_DIFF_SUCCESS_EVENT = @"partial_diff_success";
static NSString *const PARTIAL_DIFF_TYPE = @"partial_diff_type";

#pragma mark fb_party_rooms
static NSString *const SCHOOL_CONFIRMATION_POPUP = @"school_confirmation_popup";
static NSString *const GENERIC_EDUCATION_POPUP_TYPE = @"education_popup";
static NSString *const FB_EDUCATION_INFO_ERROR_POPUP = @"error_fetching_education_info_popup";
static NSString *const FB_NO_EDUCATION_INFO_POPUP = @"missing_education_info_popup";

#pragma mark rating_popups
static NSString *const NEW_RATING_POPUP_TYPE = @"rating_popup";
static NSString *const NPS_FEEDBACK_POPUP = @"nps_feedback_popup";// it can have just submit button or submitbutton with textView depending on nps rating
static NSString *const NPS_FEEDBACK_POPUP_TEXT_VIEW = @"nps_feedback_popup_text_view";
static NSString *const NPS_RATING_POPUP = @"nps_rating_popup";
static NSString *const SYSTEM_RATING_POPUP = @"system_rating_popup";

#pragma mark extra_fields
static NSString *const VIDEO_CHAT_LOAD_TIME = @"video_chat_load_time";
static NSString *const APP_LOAD_INIT = @"app_load_init";
static NSString *const APP_LOAD_COMPLETE = @"app_load_complete";
static NSString *const LOAD_TIME = @"load_time";
static NSString *const NEW_ENGAGED = @"new_engaged";
static NSString *const USER_ENGAGED = @"user_engaged";
static NSString *const SESSION_START = @"session_start";
static NSString *const CLOSE_MODE = @"close_mode";
static NSString *const CDN_ASSETS = @"cdn_assets";
static NSString *const ACTION_TYPES = @"action_type";
static NSString *const FILE_NAME_TAG = @"filename";
static NSString *const GENERIC_VIEW_OPEN = @"generic_view_open";
static NSString *const GENERIC_VIEW_CLOSE = @"generic_view_close";
static NSString *const BUTTON_CLICK = @"button_click";
static NSString *const BLOCKED_USER_ID = @"blocked_user_id";
static NSString *const PARTY_ROOM = @"party_room";
static NSString *const ADD_FRIEND_TAG = @"add_friend";
static NSString *const VIDEO_VIEW = @"video_view";
static NSString *const DEEP_LINK = @"deep_link";

#pragma mark launchpad display fields
static NSString *const LAUNCHPAD_VIEW_STRING = @"launchpad_view_string";
static NSString *const USERGROUP = @"usergroup";
static NSInteger const LAUNCHPAD_AUTO_INTERVAL = 10;
static NSString *const TRIGGER_SOURCE_AUTO = @"auto";
static NSString *const TRIGGER_SOURCE_FIRST_OPEN = @"first_open";

#pragma mark permission hub
static NSString *const ALL_PERMISSION_VIEW_TAG = @"all_permission_view";
static NSString *const PERMISSION_CONTACTS_TAG = @"permission_contacts";
static NSString *const PERMISSION_MICROPHONE_TAG = @"permission_microphone";
static NSString *const PERMISSION_CAMERA_TAG = @"permission_camera";
static NSString *const PERMISSION_NOTIFICATIONS_TAG = @"permission_notifications";
static NSString *const PERMISSION_VIDEO_CALL_TAG = @"permission_video_call";
static NSString *const PERMISSION_LOCATION_TAG = @"permission_location";
static NSString *const PERMISSION_SAVEFILE_TAG = @"permission_savefile";

#pragma mark game_show
static NSString *const SHOW_SHARE = @"show_share";
static NSString *const SHOW_JOIN = @"show_join";
static NSString *const SHOW_LANG = @"show_language";
static NSString *const USER_LANG = @"user_language";
static NSString *const SHOW_EXIT = @"show_exit";
static NSString *const SHOW_END = @"show_end";
static NSString *const SHOW_START = @"show_start";
static NSString *const SHOW_TURN_START = @"show_turn_start";
static NSString *const SHOW_TURN_END = @"show_turn_end";
static NSString *const SHOW_LIVE_CHAT = @"show_live_chat";
static NSString *const INAPP_CURRENCY = @"inapp_currency";
static NSString *const GAME_SHOW_SHARE = @"game_show_share";
static NSString *const GAME_SHOW_WINNER_SHARE = @"game_show_winner_share";
static NSString *const GAME_SHOW_GAME_OVER_INVITE = @"game_show_game_over_invite";
static NSString *const KEY_INVITE_POPUP = @"key_invite_popup";
static NSString *const MANUAL = @"manual";
static NSString *const EXIT_BUTTON = @"exit_button";
static NSString *const GAME_SHOW_FULL = @"GAME_SHOW_FULL";
static NSString *const GAME_SHOW_FULL_POPUP = @"On_Game_Show_Full_Popup";
static NSString *const VIEW_NAME = @"viewName";
static NSString *const SUB_VIEW_NAME = @"subViewName";
static NSString *const ALLOTED_TIME = @"alloted_time";
static NSString *const SHOW_USER_TAP = @"show_user_tap";
static NSString *const TEAM_KEY_BI = @"team_id";
static NSString *const QUESTION_TYPE = @"question_type";
static NSString *const PRIZE_OF_SHOW = @"prize_per_show";
static NSString *const CUTOFF_SCORE = @"cutoff_score";
static NSString *const LANGUAGE_CODE = @"language_code";
static NSString *const WEB_URL = @"web_url";
static NSString *const CURRENT_CROWN = @"current_crown";
static NSString *const ANSWERED_USER = @"this_user_answered";
static NSString *const IS_KEY_USED = @"is_key_used";
static NSString *const IS_TEST_SHOW = @"is_test_show";
static NSString *const LOBBY_MESSAGES_TAG = @"lobbyMessages";
static NSString *const LOBBY_SHARE_CARD_TAG = @"lobbyShareCard";
static NSString *const CHALLENGER_LOBBY_MESSAGES_TAG = @"challengerLobbyMessage";
static NSString *const CHALLENGER_LOBBY_SHARE_CARD_TAG = @"challengerLobbyShareCard";
static NSString *const CHALLENGER_SHARE_CREATED_SHOW_TAG = @"challenger_create_show_popup_share_on_start";

static NSString *const GAME_SHOW_SHARE_UPCOMING = @"game_show_share_upcoming";
static NSString *const GAME_SHOW_INVITE_FRIENDS_TAP = @"game_show_invite_friends_tap";
static NSString *const GAME_SHOW_PRE_START_INVITE = @"game_show_pre_start";
static NSString *const TOURNAMENT_SHOW_MIN_FRIENDS_INVITE = @"tournament_show_min_friends";

#pragma mark broadcast events
static NSString *const BROADCAST_FLOW_EVENT = @"broadcast_flow";
static NSString *const BROADCAST_MESSAGE_EVENT = @"broadcast_message";
static NSString *const BROADCAST_MESSAGE_DELAY_EVENT = @"broadcast_message_delay";
static NSString *const CLIENT_LOG_EVENT = @"client_log";
static NSString *const CONNECTION_EVENT = @"connection_event";
static NSString *const BROADCAST_STATS_EVENT = @"broadcast_stats";
static NSString *const CONNECTION_MESSAGE = @"connection_message";
static NSString *const SHOW_ID = @"show_id";
static NSString *const BROADCAST_ROLE = @"role";
static NSString *const STATS = @"stats";
static NSString *const BROADCAST_MESSAGE_TYPE = @"type";
static NSString *const BROADCAST_MESSAGE = @"message";
static NSString *const R5P_SUBSCRIBER = @"SUBSCRIBER";
static NSString *const MESSAGE_SEND = @"SEND";
static NSString *const MESSAGE_RECEIVE = @"RECEIVE";
static NSString *const BROADCAST_COMMAND = @"command";
static NSString *const BROADCAST_SOURCE = @"source";
static NSString *const BROADCAST_ISIGNORED = @"isIgnored";
static NSString *const CLIENT_LOG = @"message";
static NSString *const CREATED_TIME = @"created_time";
static NSString *const RECEIVED_TIME = @"received_time";
static NSString *const IS_SNAPSHOT = @"is_snapshot";

static NSString *const BATTERY_LEVEL = @"battery_level";

#pragma mark lightstreamer events
static NSString *const LS_CLIENT_FLOW_EVENT = @"ls_client_flow";
static NSString *const LS_SERVER_ADDRESS = @"ls_server_address";
static NSString *const LS_SESSION_ID = @"ls_session_id";
static NSString *const LS_CALLBACK_TYPE = @"ls_callback_type";
static NSString *const LS_CALLBACK_DATA = @"ls_callback_data";

#pragma mark broadcast stats name
static NSString *const BUFFERED_TIME = @"buffered_time";
static NSString *const SUBSCRIBE_QUEUE_SIZE = @"subscribe_queue_size";
static NSString *const NB_AUDIO_FRAMES = @"nb_audio_frames";
static NSString *const NB_VIDEO_FRAMES = @"nb_video_frames";
static NSString *const PKTS_RECEIVED = @"pkts_received";
static NSString *const PKTS_SENT = @"pkts_sent";
static NSString *const PKTS_VIDEO_DROPPED = @"pkts_video_dropped";
static NSString *const PKTS_AUDIO_DROPPED = @"pkts_audio_dropped";
static NSString *const PUBLISH_PKTS_DROPPED = @"publish_pkts_dropped";
static NSString *const TOTAL_BYTES_RECEIVED = @"total_bytes_received";
static NSString *const TOTAL_BYTES_SENT = @"total_bytes_sent";
static NSString *const SUBSCRIBE_BITRATE = @"subscribe_bitrate";
static NSString *const PUBLISH_BITRATE = @"publish_bitrate";
static NSString *const SOCKET_QUEUE_SIZE = @"socket_queue_size";
static NSString *const BITRATE_SEND_SMOOTHED = @"bitrate_sent_smoothed";
static NSString *const BITRATE_RECEIVED_SMOOTHED = @"bitrate_received_smoothed";
static NSString *const SUBSCRIBE_LATENCY = @"subscribe_latency";

#pragma Quest Service call names
static NSString *const DAY_0_RETENTION_EVENT_STRING = @"returning_user_jrgames";
static NSString *const DAY_1_RETENTION_EVENT_STRING = @"retention_dsi1_jrgames";
static NSString *const DAY_3_RETENTION_EVENT_STRING = @"retention_dsi3_jrgames";
//static NSString *const REGISTERED_QUEST = @"REGISTERED_QUEST";
static NSString *const JOYRIDE_FRIENDS_QUEST = @"hasfriends_jrgames";
static NSString *const JOYRIDE_FRIENDS_NTH_QUEST = @"hasnfriends_jrgames";
//static NSString *const INVITE_INITIATE_QUEST = @"INVITE_INITIATE_QUEST";
//static NSString *const INVITE_SENT_QUEST = @"INVITE_SENT_QUEST";
static NSString *const GAME_SHOW_JOIN_QUEST = @"GAME_SHOW_JOIN_QUEST";
static NSString *const LP_OPEN_QUEST = @"registration_jrgames";
static NSString *const LIVE_CALL_DURATION_QUEST = @"LIVE_CALL_DURATION_QUEST";
//static NSString *const LIVE_SHOW_DURATION_QUEST = @"LIVE_SHOW_DURATION_QUEST";
static NSString *const PRIVATE_CALL_DURATION_QUEST = @"PRIVATE_CALL_DURATION_QUEST";
//static NSString *const GAME_DURATION_QUEST = @"GAME_DURATION_QUEST";
static NSString *const FIRST_TIME_SUBSCRIBER_PAYER_QUEST_V3 = @"FIRST_TIME_SUBSCRIBER_PAYER_QUEST_V3";
//static NSString *const ALL_CALL_DURATION_QUEST = @"ALL_CALL_DURATION_QUEST";
static NSString *const BUY_KEY_SUBSCRIPTION_QUEST = @"BUY_KEY_SUBSCRIPTION_QUEST";
static NSString *const BUY_KEY_CONSUMABLE_QUEST = @"BUY_KEY_CONSUMABLE_QUEST";
static NSString *const RETAINING_TRIALS = @"RETAINING_TRIALS";

static NSString *const CREATE_SHOW_JRGAMES_STRING = @"create_show_jrgames";
static NSString *const PLAYGROUND_ENGAGEMENT_JRGAMES_STRING = @"playground_engagement_jrgames";
static NSString *const SHOW_ENGAGEMENT_JRGAMES_STRING = @"show_engagement_jrgames";
static NSString *const BATTLE_ENGAGEMENT_JRGAMES_STRING = @"battle_engagement_jrgames";
static NSString *const CONTEST_ENGAGEMENT_JRGAMES_STRING = @"contest_engagement_jrgames";
static NSString *const PLAYGROUND_ENGAGEMENT_NTH_JRGAMES_STRING = @"playground_engagement_nth_jrgames";
static NSString *const SHOW_ENGAGEMENT_NTH_JRGAMES_STRING = @"show_engagement_nth_jrgames";
static NSString *const BATTLE_ENGAGEMENT_NTH_JRGAMES_STRING = @"battle_engagement_nth_jrgames";
static NSString *const CONTEST_ENGAGEMENT_NTH_JRGAMES_STRING = @"contest_engagement_nth_jrgames";
static NSString *const CREATE_SHOW_NTH_JRGAMES_STRING = @"create_show_nth_jrgames";

static NSString *const PAYER_JRGAMES = @"payer_jrgames";

static NSString *const INTERACTIVE_ONBOARDING_VIEW_TAG = @"interactive_onboarding_view";

static NSString *const INFINITE_CLICKER_TAG = @"launchpad_view_infinite_clicker";
static NSString *const HALF_CARD_CLICKER_TAG = @"launchpad_view_half_card_clicker";

static NSString *const LAUNCHPAD_VIEW_APP_RESUME = @"Launchpad_View_App_Resume";

static NSString *const PRIZE_PER_USER = @"prize_per_user";
static NSString *const WINNER_COUNT = @"winner_count";

static NSString *const DIFF_STARTED = @"diff_started";
static NSString *const DIFF_FIRED = @"diff_fired";
static NSString *const DIFF_CONTINUED = @"diff_continued";
static NSString *const DIFF_EVENT = @"diff_event";
static NSString *const IS_FORCED = @"isForced";
static NSString *const USER_DIFF_FIRED = @"diff_user";

static NSString *const NOTIFICATION_MESSAGE_TAG = @"notification_message";
static NSString *const REJECTED_REASON = @"rejected_reason";

static NSString *const APP_FREEZE_EVENT = @"app_freeze";
static NSString *const APP_FREEZE_THRESHOLD = @"threshold";

static NSString *const QUEST_EVENT = @"quest";
static NSString *const RAW_EVENT_NAME = @"questName";
static NSString *const RAW_EVENT_DETAIL_ONE = @"detailOne";
static NSString *const RAW_EVENT_DETAIL_TWO = @"detailTwo";
static NSString *const RAW_EVENT_DETAIL_THREE = @"detailThree";
static NSString *const RAW_EVENT_DETAIL_FOUR = @"detailFour";
static NSString *const EVENT_SUCCESS = @"success";
static NSString *const EVENT_FAILURE = @"failure";

static NSString *const QUIZ_QUESTION_COUNT = @"quiz_question_count";
static NSString *const IS_CORRECT_ANSWER = @"is_correct_answer";
static NSString *const ANSWERED_OPTION = @"ANSWERED_OPTION";
static NSString *const IS_PLAYER = @"is_player";
static NSString *const RESULT_ARRAY = @"result_array";
static NSString *const COMPRESSED_RESULT_ARRAY = @"compressed_result_array";
static NSString *const ACTIVE_PLAYER_COUNT_TAG = @"active_players_count";
static NSString *const COMMAND_TAG = @"command";
static NSString *const HOST_ID_TAG = @"host_id";

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

static NSString *const GAME_SHOW_POPUP_TYPE = @"game_show_popup";
static NSString *const ELIMINATED_POPUP = @"eliminated_popup";
static NSString *const EXIT_BUTTON_AUTO = @"exit_button_auto";
static NSString *const BONUS_ROUND_POPUP = @"bonus_round";

static NSString *const CAMERA_PERMISSION = @"camera_permission";
static NSString *const MIC_PERMISSION = @"mic_permission";
static NSString *const CONTACT_PERMISSION = @"contact_permission";
static NSString *const NOTIFICATION_PERMISSION = @"notification_permission";

//Crashlytics error custom codes
static NSInteger const BI_JSON_DATA_ERROR_CODE = 10001;
static NSInteger const BI_SERVER_ERROR_CODE = 10002;
static NSInteger const BI_ARCHIVE_DATA_FAILURE_CODE = 10003;
static NSInteger const BI_ARCHIVE_DATA_EXCEPTION_CODE = 10004;
static NSInteger const BI_EXCLUDING_FROM_BACKUP_ERROR_CODE = 10005;
static NSInteger const BI_FILE_NOT_EXISTS_ERROR_CODE = 10006;
static NSInteger const BI_UNARCHIVE_DATA_ERROR_CODE = 10007;
static NSInteger const BI_FILE_REMOVAL_FAILURE_CODE = 10008;

static NSInteger const APP_FREEZE_EVENT_CODE = 20001;

static NSString *const CLICK_DETAILS_ONE = @"click_details_one";
static NSString *const CLICK_DETAILS_TWO = @"click_details_two";
static NSString *const CLICK_DETAILS_THREE = @"click_details_three";
static NSString *const CLICK_DETAILS_FOUR = @"click_details_four";
static NSString *const CLICK_DETAILS_FIVE = @"click_details_five";
static NSString *const CLICK_DETAILS_SEVEN = @"click_details_seven";
static NSString *const CLICK_DETAILS_EIGHT = @"click_details_eight";
static NSString *const CLICK_DETAILS_NINE = @"click_details_nine";
static NSString *const CLICK_DETAILS_TEN = @"click_details_ten";
static NSString *const CLICK_DETAILS_FIFTEEN = @"clickDetailsFifteen";
static NSString *const CLICK_DETAILS_SEVENTEEN = @"clickDetailsSeventeen";

static NSString *const FETCH_FRIEND_NETWORK_DATA_EVENT = @"fetch_friend_network_data";
static NSString *const FRIEND_NETWORK_DATA_TAG = @"friend_network_data";
static NSString *const FRIENDS_TAG = @"friends";
static NSString *const FRIEND_REQUESTS_RECEIVED_TAG = @"friendRequestsReceived";
static NSString *const FRIEND_REQUESTS_SENT_TAG = @"friendRequestsSent";
static NSString *const IN_APP_CONTACTS_TAG = @"inAppContacts";

static NSString *const RESOURCE_DEDUCTION_TOURNAMENT_ENTRY = @"tournament_entry";
static NSString *const KEYS_DEDUCTION_BONUS_ROUND_ENTRY = @"bonus_round";
static NSString *const EXTRA_INFO = @"extra_info";
static NSString *const TAB_HIGHLIGHT = @"tab_highlight";
static NSString *const EXTRA_INFO_2 = @"extra_info_2";

static NSString *const BONUS_ROUND_ENTRY_KEYS = @"bonus_round_entry_keys";
static NSString *const BONUS_ROUND_ELIMINATION = @"bonus_round_elimination";
static NSString *const INVITE_EXTRA_DATA = @"field_10";

static NSString *const KEY_DEDUCTION_CHALLENGER = @"challenger_entry";

static NSString *const GUEST_DETAIL_POPUP = @"guest_detail_popup";
static NSString *const CHALLENGER_ID = @"challenger_id";

static NSString *const EXPECTED_START_TIME = @"expected_start_time";
static NSString *const ACTUAL_START_TIME = @"actual_start_time";
static NSString *const DELAY_START_TIME = @"delay_start_time";
static NSString *const BI_FIELD_8 = @"field_8";

static NSString *const DIFF_COUNT = @"diff_count";

static NSString *const GAME_SHOW_VIEW = @"game_show_view";
static NSString *const SHOW_SUMMARY = @"show_summary";

static NSString *const CUSTOMER_INFO_BI_EVENT = @"customer_info";

static NSString *const VIDEO_PREVIEW_PLAYBACK_ERROR = @"video_preview_playback_error";

static NSString *const SPEECH_DETECTION_LOGS = @"speech_detection_logs";
static NSString *const SPEECH_DETECTION_RESULT = @"speech_detection_result";

//Hosted = 1**
//Automated = 2**
//UserCreated = 3**
//Guest = *1*
//Challenger = *2*
typedef NS_ENUM(NSInteger, ShowTypeSubtype) {
    HostedDefault = 100,
    HostedWithGuest = 110,
    HostedWithChallenger = 120,
    AutomatedDefault = 200,
    AutomatedWithGuest = 210,
    AutomatedWithChallenger = 220,
    UserCreatedWithChallenger = 320
};

#endif /* BiConstants_h */
