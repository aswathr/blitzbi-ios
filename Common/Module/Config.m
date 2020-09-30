//
//  Config.m
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "Config.h"

#import "JrxCommon.h"
#import "FileHelper.h"
#import "UserDefaultsUtil.h"
#import "StringConstant.h"
#import "CommonConstant.h"
#import <BI/BI-Swift.h>

//#import "BI-Swift.h"

@interface Config () {
    BOOL isDebugEnabled;
}
@end

@implementation Config

Config *config;

+ (void)initConfig {
    config = [[Config alloc] init];
}

- (id)init {
    if (self = [super init]) {
//        _DROPBOX_APP_KEY = @"99w6ldshfswgt7c";
//        _DROPBOX_APP_SECRET = @"zrpc0zll1466slx";
        //_DROPBOX_ACCESS_TYPE = kDBRootDropbox;
//        _TEST_APP_VERSION = @"DEBUG_VERSION";

        _ENV_TYPE_TO_ENV_STRING = @{
            [NSNumber numberWithInt:EnvTypeQa]: @"qa",
            [NSNumber numberWithInt:EnvTypeProd]: @"prod",
            [NSNumber numberWithInt:EnvTypeProd2]: @"prod2",
            [NSNumber numberWithInt:EnvTypeDev]: @"dev",
            [NSNumber numberWithInt:EnvTypeMercury]: @"mercury",
            [NSNumber numberWithInt:EnvTypeJupiter]: @"jupiter",
            [NSNumber numberWithInt:EnvTypeSun]: @"sun",
            [NSNumber numberWithInt:EnvTypeStage]: @"stage",
            [NSNumber numberWithInt:EnvTypeDemo]: @"demo",
            [NSNumber numberWithInt:EnvTypeAndroid]: @"android",
            [NSNumber numberWithInt:EnvTypeLocal]: @"local",
            [NSNumber numberWithInt:EnvTypeVenus]: @"venus",
            [NSNumber numberWithInt:EnvTypeMars]: @"mars",
            [NSNumber numberWithInt:EnvTypePluto]: @"pluto",
            [NSNumber numberWithInt:EnvTypeAuto]: @"auto",
            [NSNumber numberWithInt:EnvTypeWebdev]: @"webdev"
        };

        _TUNE_ADVERTISER_ID = @"190423";
        _TUNE_CONVERSION_KEY = @"df6677a21c7caa79aab3958275de8c9d";

        _PUBNUB_PUBLISH_KEY = @"pub-c-61000aa5-89ff-49e3-95c8-aecd1ec1ccca";
        _PUBNUB_SUBSCRIBE_KEY = @"sub-c-afcb742e-00d9-11e8-a55d-d67d19117359";

        _TAPLYTICS_KEY = @"d0c73c0769443388d16ae2012495cb696508cb7f";//@"5bfa37e929e8dba2075c72d6df7d3576df2b4515";

        _ITUNES_APPLICATION_ID = @"1185835397";
//        if ([[CIConfig sharedInstance] isSetInCI] && ![[[CIConfig sharedInstance] getEnvironment] isEqualToString:@"buildEnv"]) {
//            _INITIAL_ENVIRONMENT = [self getEnvTypeFor:[[[CIConfig sharedInstance] getEnvironment] lowercaseString]];
//        }
//        else {
//            _INITIAL_ENVIRONMENT = [EnvConfig environment];
//        }
        
        NSString *environmentString = [[UserDefaultsUtil sharedInstance] valueForCommonKey:ENVIRONMENT_KEY];
        if (environmentString != nil) {
            NSUInteger environment = [environmentString integerValue];
            _ENVIRONMENT = environment;
        }
        else {
            _ENVIRONMENT = _INITIAL_ENVIRONMENT;
        }

        //[[TaplyticsHandler sharedInstance] appendCustomData:@{ @"env": [self stringForEnvironment:_ENVIRONMENT] }];

        [self updateChatMode:YES];
        self.IS_TRIVIA_GAME_ENABLED = [[UserDefaultsUtil sharedInstance] boolForKey:IS_TRIVIA_GAME_ENABLED];

        BOOL logToFile = [[UserDefaultsUtil sharedInstance] boolForKey:LOG_TO_FILE_KEY];
        [self updateFileLogging:logToFile];
        
        _IS_APP_CONTENT_PACKED = YES;
        
        if (_INITIAL_ENVIRONMENT == EnvTypeProd2) {
            isDebugEnabled = NO;
        }
        else {
            isDebugEnabled = YES;
        }
        return self;
    }
    return nil;
}

- (EnvType)getEnvTypeFor:(NSString *)env {
    for (NSNumber *eType in[_ENV_TYPE_TO_ENV_STRING keyEnumerator]) {
        if ([env isEqualToString:[_ENV_TYPE_TO_ENV_STRING objectForKey:eType]]) {
            return [eType integerValue];
        }
    }
    return -1;
}

- (NSArray<NSString *> *)getSupportedEnviornments {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = EnvTypeQa; i <= EnvTypeSun; i++) {
        [array addObject:[self stringForEnvironment:i]];
    }
    return array;
}

- (NSString *)stringForEnvironment:(EnvType)envType {
    NSString *string = _ENV_TYPE_TO_ENV_STRING[[NSNumber numberWithInt:envType]];
    return string;
}

- (void)shouldEnableTrivia:(BOOL)enabled {
    [[UserDefaultsUtil sharedInstance] setBool:enabled forKey:IS_TRIVIA_GAME_ENABLED];
}

- (void)updateChatMode:(BOOL)isSinglePlayer {
    _IS_SINGLE_PLAYER_GAME = NO;
}

- (void)updateFileLogging:(BOOL)enableFileLogging {
    _LOG_TO_FILE = enableFileLogging;
    [[UserDefaultsUtil sharedInstance] setBool:enableFileLogging forKey:LOG_TO_FILE_KEY];
}

- (void)setDebugEnabled:(BOOL)value {
    isDebugEnabled = value;
}

- (BOOL)isDebugEnabled {

    return isDebugEnabled;
}

@end
