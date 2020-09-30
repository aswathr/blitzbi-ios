//
//  NSNotificationHelper.m
//  ArVideoDemo
//
//  Created by Anuj on 08/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "NSNotificationHelper.h"

@implementation NSNotificationHelper

+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo {
    [NSNotificationHelper sendNotification:notificationName withUserInfo:uInfo withObject:nil];
}

+ (void)sendNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)uInfo withObject:(id)object {
    NSNotification *notification = [[NSNotification alloc]
                                    initWithName:notificationName
                                          object:object
                                        userInfo:uInfo];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
