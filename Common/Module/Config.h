//
//  Config.h
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonConstant.h>


@class Config;
extern Config *config;

@interface Config : NSObject

@property (nonatomic, assign) NSInteger USER_ID;
@property (nonatomic, strong) NSString *ASSETS_BASE_URL;

@property (nonatomic, strong) NSDictionary<NSNumber *, NSString *> *GAME_TYPE_TO_GAME_STRING;
@property (nonatomic, strong) NSDictionary<NSNumber *, NSString *> *ENV_TYPE_TO_ENV_STRING;

@property (nonatomic, strong) NSString *TUNE_ADVERTISER_ID;
@property (nonatomic, strong) NSString *TUNE_CONVERSION_KEY;

@property (nonatomic, strong) NSString *TEST_APP_VERSION;

@property (nonatomic, strong) NSString *PUBNUB_PUBLISH_KEY;
@property (nonatomic, strong) NSString *PUBNUB_SUBSCRIBE_KEY;
@property (nonatomic, readonly) NSString *ITUNES_APPLICATION_ID;

@property (nonatomic) NSInteger ENVIRONMENT;
@property (nonatomic) NSInteger INITIAL_ENVIRONMENT;

@property (nonatomic) BOOL IS_SINGLE_PLAYER_GAME;
@property (nonatomic) BOOL LOG_TO_FILE;

@property (nonatomic, strong) NSString *TAPLYTICS_KEY;

@property (nonatomic) BOOL IS_TRIVIA_GAME_ENABLED;
@property (nonatomic) BOOL IS_APP_CONTENT_PACKED;

+ (void)initConfig;

//- (NSString *)getDownloadBaseUrl:(GameType)gameType withEnvType:(EnvType)envType;
- (NSArray<NSString *> *)getSupportedEnviornments;
- (void)updateChatMode:(BOOL)isSinglePlayer;
- (void)updateFileLogging:(BOOL)enableFileLogging;

- (void)setDebugEnabled:(BOOL)value;
- (BOOL)isDebugEnabled;
- (NSString *)stringForEnvironment:(NSInteger)envType;

- (NSInteger)getEnvTypeFor:(NSString *)env;
- (void)shouldEnableTrivia:(BOOL)enabled;
@end
