//
//  Config.h
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlitzCommonConstant.h"


@class BlitzConfig;
extern BlitzConfig *config;

@interface BlitzConfig : NSObject

@property (nonatomic, assign) NSInteger USER_ID;

@property (nonatomic, strong) NSDictionary<NSNumber *, NSString *> *ENV_TYPE_TO_ENV_STRING;

@property (nonatomic, strong) NSString *TEST_APP_VERSION;

@property (nonatomic) NSInteger ENVIRONMENT;
@property (nonatomic) NSInteger INITIAL_ENVIRONMENT;

@property (nonatomic) BOOL LOG_TO_FILE;

@property (nonatomic, strong) NSString *TAPLYTICS_KEY;

@property (nonatomic) BOOL IS_APP_CONTENT_PACKED;

+ (void)initConfig;

- (void)updateFileLogging:(BOOL)enableFileLogging;

- (void)setDebugEnabled:(BOOL)value;
- (BOOL)isDebugEnabled;
- (NSString *)stringForEnvironment:(NSInteger)envType;

- (NSInteger)getEnvTypeFor:(NSString *)env;
@end
