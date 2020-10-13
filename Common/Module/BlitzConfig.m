//
//  Config.m
//  ArVideoDemo
//
//  Created by Vikram on 17/11/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <BlitzConfig.h>
#import <BlitzCommon.h>
#import <BlitzFileHelper.h>
#import <BlitzCommonConstant.h>

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
        return self;
    }
    return nil;
}

- (void)setDebugEnabled:(BOOL)value {
    isDebugEnabled = value;
}

- (BOOL)isDebugEnabled {
    return isDebugEnabled;
}

@end
