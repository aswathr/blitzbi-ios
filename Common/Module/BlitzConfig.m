//
//  Config.m
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzConfig.h"

#import "BlitzCommon.h"
#import "BlitzFileHelper.h"
#import "BlitzStringConstant.h"
#import "BlitzCommonConstant.h"
#import <BI/BI-Swift.h>

@interface BlitzConfig () {
    BOOL isDebugEnabled;
}
@end

@implementation BlitzConfig

BlitzConfig *config;

+ (void)initConfig {
    config = [[BlitzConfig alloc] init];
}

- (id)init {
    if (self = [super init]) {
        _ENV_TYPE_TO_ENV_STRING = @{
            [NSNumber numberWithInt:BlitzEnvTypeQa]: @"qa",
            [NSNumber numberWithInt:BlitzEnvTypeProd]: @"prod",
            [NSNumber numberWithInt:BlitzEnvTypeProd2]: @"prod2",
            [NSNumber numberWithInt:BlitzEnvTypeDev]: @"dev",
            [NSNumber numberWithInt:BlitzEnvTypeMercury]: @"mercury",
            [NSNumber numberWithInt:BlitzEnvTypeJupiter]: @"jupiter",
            [NSNumber numberWithInt:BlitzEnvTypeSun]: @"sun",
            [NSNumber numberWithInt:BlitzEnvTypeStage]: @"stage",
            [NSNumber numberWithInt:BlitzEnvTypeDemo]: @"demo",
            [NSNumber numberWithInt:BlitzEnvTypeAndroid]: @"android",
            [NSNumber numberWithInt:BlitzEnvTypeLocal]: @"local",
            [NSNumber numberWithInt:BlitzEnvTypeVenus]: @"venus",
            [NSNumber numberWithInt:BlitzEnvTypeMars]: @"mars",
            [NSNumber numberWithInt:BlitzEnvTypePluto]: @"pluto",
            [NSNumber numberWithInt:BlitzEnvTypeAuto]: @"auto",
            [NSNumber numberWithInt:BlitzEnvTypeWebdev]: @"webdev"
        };

        _TUNE_ADVERTISER_ID = @"190423";
        _TUNE_CONVERSION_KEY = @"df6677a21c7caa79aab3958275de8c9d";

        _PUBNUB_PUBLISH_KEY = @"pub-c-61000aa5-89ff-49e3-95c8-aecd1ec1ccca";
        _PUBNUB_SUBSCRIBE_KEY = @"sub-c-afcb742e-00d9-11e8-a55d-d67d19117359";

        _TAPLYTICS_KEY = @"d0c73c0769443388d16ae2012495cb696508cb7f";//@"5bfa37e929e8dba2075c72d6df7d3576df2b4515";

        _ITUNES_APPLICATION_ID = @"1185835397";

//        BOOL logToFile = [[BlitzUserDefaultsUtil sharedInstance] boolForKey:LOG_TO_FILE_KEY];
//        [self updateFileLogging:logToFile];
        
        _IS_APP_CONTENT_PACKED = YES;
        
        if (_INITIAL_ENVIRONMENT == BlitzEnvTypeProd2) {
            isDebugEnabled = NO;
        }
        else {
            isDebugEnabled = YES;
        }
        return self;
    }
    return nil;
}

- (BlitzEnvType)getEnvTypeFor:(NSString *)env {
    for (NSNumber *eType in[_ENV_TYPE_TO_ENV_STRING keyEnumerator]) {
        if ([env isEqualToString:[_ENV_TYPE_TO_ENV_STRING objectForKey:eType]]) {
            return [eType integerValue];
        }
    }
    return -1;
}

- (NSArray<NSString *> *)getSupportedEnviornments {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = BlitzEnvTypeQa; i <= BlitzEnvTypeSun; i++) {
        [array addObject:[self stringForEnvironment:i]];
    }
    return array;
}

- (NSString *)stringForEnvironment:(BlitzEnvType)envType {
    NSString *string = _ENV_TYPE_TO_ENV_STRING[[NSNumber numberWithInt:envType]];
    return string;
}

- (void)updateChatMode:(BOOL)isSinglePlayer {
    _IS_SINGLE_PLAYER_GAME = NO;
}

- (void)updateFileLogging:(BOOL)enableFileLogging {
    _LOG_TO_FILE = enableFileLogging;
//    [[BlitzUserDefaultsUtil sharedInstance] setBool:enableFileLogging forKey:LOG_TO_FILE_KEY];
}

- (void)setDebugEnabled:(BOOL)value {
    isDebugEnabled = value;
}

- (BOOL)isDebugEnabled {

    return isDebugEnabled;
}

@end
