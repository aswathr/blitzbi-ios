//
//  NSNotificationHelper.m
//  ArVideoDemo
//
//  Created by Anuj on 08/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzNSNotificationHelper.h"

@implementation BlitzNSNotificationHelper

+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo {
    [BlitzNSNotificationHelper sendNotification:notificationName withUserInfo:uInfo withObject:nil];
}

+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo withObject:(id)object {
    NSNotification *notification = [[NSNotification alloc]
                                    initWithName:notificationName
                                          object:object
                                        userInfo:uInfo];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
