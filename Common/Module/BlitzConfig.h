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

@property (nonatomic, strong) NSString *TEST_APP_VERSION;

@property (nonatomic) BOOL LOG_TO_FILE;

+ (void)initConfig;

- (void)updateFileLogging:(BOOL)enableFileLogging;

- (void)setDebugEnabled:(BOOL)value;
- (BOOL)isDebugEnabled;
@end
