//
//  AppTime.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BlitzAppTime;

extern BlitzAppTime *appTime;

@interface BlitzAppTime : NSObject

- (id)init;
- (void)initImmediateAfterValidUser;
- (BOOL)initImmediateAfterDiff:(long long)serverEpochTimeAtStart_;
- (void)initImmediateAfterPubNubInitialisation:(long long)serverEpochTimeAtStart_;

@property (nonatomic, assign) long long serverEpochTimeAtStartInMillis;
@property (nonatomic, assign) long long deviceTimeAtStart;// in seconds
@property (nonatomic, assign) long long deviceTimeAtStartInMillis;

- (long long)getCurrentEpochTime;
- (long long)getCurrentEpochTimeinMillis;
- (long long)getCurrentEpochTimeOnServer;
- (long long)getApproxCurrentEpochTimeOnServerinMillis;
- (long long)getCurrentEpochTimeOnServerinMillis;
- (long long)getEpochTimeOnServerAtStart;
@end
