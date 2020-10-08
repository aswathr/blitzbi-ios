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
#import "BlitzBi-Swift.h"

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
            [NSNumber numberWithInt:BlitzEnvTypeDev]: @"dev",
            [NSNumber numberWithInt:BlitzEnvTypeStage]: @"stage",
            [NSNumber numberWithInt:BlitzEnvTypeLocal]: @"local"
        };

        _TAPLYTICS_KEY = @"d0c73c0769443388d16ae2012495cb696508cb7f";//@"5bfa37e929e8dba2075c72d6df7d3576df2b4515";

        _IS_APP_CONTENT_PACKED = YES;
        
        if (_INITIAL_ENVIRONMENT == BlitzEnvTypeProd) {
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

- (NSString *)stringForEnvironment:(BlitzEnvType)envType {
    NSString *string = _ENV_TYPE_TO_ENV_STRING[[NSNumber numberWithInt:envType]];
    return string;
}

- (void)updateFileLogging:(BOOL)enableFileLogging {
    _LOG_TO_FILE = enableFileLogging;
//    [[UserDefaultsUtil sharedInstance] setBool:enableFileLogging forKey:LOG_TO_FILE_KEY];
}

- (void)setDebugEnabled:(BOOL)value {
    isDebugEnabled = value;
}

- (BOOL)isDebugEnabled {
    return isDebugEnabled;
}

@end
