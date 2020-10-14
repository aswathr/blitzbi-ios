//
//  BlitzBi.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBi.h>
#import "BlitzBiService.h"

@interface BlitzBi ()
+ (BlitzBiService*)sharedService;
@end

@implementation BlitzBi
+ (BlitzBiService*)sharedService {
    static BlitzBiService *sharedInstance = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[BlitzBiService alloc] init];
    });
    return sharedInstance;
}

+ (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)appToken {
    [self.sharedService setUp:appId :appToken];
}

+ (void)sendEvent:(NSDictionary*)event{
    [self.sharedService sendEvent:event];
}

+ (void)sendEvents:(NSArray*)events {
    [self.sharedService sendEvents:events];
}

+ (void)BlitzBiEventCompletedRegistration:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventSubscribeWithAmount:(double)price
                              andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"price"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventSubscriptionRenewalWithRenewalCount:(int)renewalCount
                                                 amount:(double)price
                                              andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:[NSNumber numberWithInt:renewalCount] forKey:@"renewalCount"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"price"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventSubscriptionCancelWithParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventPurchaseWithAmount:(double)price
                             andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"price"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventScreenVisitedWithScreenName:(NSString*)screenName {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap setObject:screenName forKey:@"screenName"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)BlitzBiEventClickedWithWidgetnName:(NSString*)widgetName
                                 andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:widgetName forKey:@"widgetName"];
    [self.sharedService sendEvent:eventsMap];
}
@end
