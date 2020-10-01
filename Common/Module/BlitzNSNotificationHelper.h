//
//  NSNotificationHelper.h
//  ArVideoDemo
//
//  Created by Anuj on 08/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlitzNSNotificationHelper.h"

@interface BlitzNSNotificationHelper : NSObject

+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo;
+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo withObject:(id)object;

@end
