//
//  AppTime.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "AppTime.h"


AppTime *appTime = nil;

@implementation AppTime

+ (void)initialize {
    @synchronized(appTime) {
        if (appTime == nil) {
            appTime = [[AppTime alloc] init];
        }
    }
}

- (id)init {
    if (self = [super init]) {
        // Initialize the below values appropriately

        _deviceTimeAtStart = [self getCurrentEpochTime];

        _deviceTimeAtStartInMillis = [self getCurrentEpochTimeinMillis];

        // Get the time from server and initialize
        _serverEpochTimeAtStartInMillis = 0;// Dummy init
        return self;
    }
    return nil;
}

- (void)initImmediateAfterValidUser {}

//If call is From diff - conditionally overwrite, only if pubnub has not initialised the fields
- (BOOL)initImmediateAfterDiff:(long long)serverEpochTimeAtStart_ {
    @synchronized(self) {
        //TODO:Anuj : Check with Harsha why this check was ==0 and not != 0
            
        if (_serverEpochTimeAtStartInMillis != 0) {
            
          //  long long thresholdForCorrection = [[AppParamModel getSharedInstance] getThresholdErrorInServerTimeForCorrection] * 1000;
       //     BOOL needToCorrectTime = [[AppParamModel getSharedInstance] shouldCorrectTimeViaDiff]
         //       && llabs([self getCurrentEpochTimeOnServerinMillis] - serverEpochTimeAtStart_) > thresholdForCorrection;

         //   if (!needToCorrectTime) {
          //      return NO;
         //   }
         //   else {//
                NSString *timeChangeLog = (@"Time: corrected by diffTime");
           //     [Utility sendLogToBI:timeChangeLog];
          //  }
            
        }
        
        [self intAppTimeFields:serverEpochTimeAtStart_];
        return YES;
        
        
    }
}

//If call is From pubnub - always overwrite
- (void)initImmediateAfterPubNubInitialisation:(long long)serverEpochTimeAtStart_ {
    @synchronized(self) {
        [self intAppTimeFields:serverEpochTimeAtStart_];
    }
}

- (void)intAppTimeFields:(long long)serverEpochTimeAtStart_ {
    _serverEpochTimeAtStartInMillis = serverEpochTimeAtStart_;
    _deviceTimeAtStart = [self getCurrentEpochTime];
    _deviceTimeAtStartInMillis = [self getCurrentEpochTimeinMillis];
}

- (long long)getCurrentEpochTime {
    return [@(floor([[NSDate date] timeIntervalSince1970]))longLongValue];
}

- (long long)getCurrentEpochTimeinMillis {
    return [@(floor([[NSDate date] timeIntervalSince1970] * 1000))longLongValue];
}

- (long long)getCurrentEpochTimeOnServer {
    return [@(floor((_serverEpochTimeAtStartInMillis) / 1000))longLongValue] + ([self getCurrentEpochTime] - _deviceTimeAtStart);
}

- (long long)getApproxCurrentEpochTimeOnServerinMillis {
    if (_serverEpochTimeAtStartInMillis == 0) {
        return [self getCurrentEpochTimeinMillis];
    }
    return [self getCurrentEpochTimeOnServerinMillis];
}

- (long long)getCurrentEpochTimeOnServerinMillis {
    return _serverEpochTimeAtStartInMillis + ([self getCurrentEpochTimeinMillis] - _deviceTimeAtStartInMillis);
}

- (long long)getEpochTimeOnServerAtStart {
    return [@(floor((_serverEpochTimeAtStartInMillis) / 1000))longLongValue];
}

@end
