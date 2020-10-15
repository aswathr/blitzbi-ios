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
+ (BlitzBiService *)sharedService;
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

+ (void)logCompleteRegistrationEventWithMethod:(NSString *)registrationMethod andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_complete_registration" forKey:@"eventName"];
    [eventsMap setObject:registrationMethod forKey:@"registrationMethod"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logSubscribeEventWithAmount:(double)price
                          andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_subscribe" forKey:@"eventName"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logSubscriptionRenewalEventWithRenewalCount:(int)renewalCount
                                          andAmount:(double)price
                                          andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_subscription_renewal" forKey:@"eventName"];
    [eventsMap setObject:[NSNumber numberWithInt:renewalCount] forKey:@"renewalCount"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logSubscriptionCancelEventWithParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap setObject:@"blitz_subscription_cancel" forKey:@"eventName"];
    [eventsMap addEntriesFromDictionary:params];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logPurchaseEventWithAmount:(double)price
                             andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_inapp_purchase" forKey:@"eventName"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logScreenVisitedEventWithScreenName:(NSString*)screenName {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap setObject:@"blitz_screen_visited" forKey:@"eventName"];
    [eventsMap setObject:screenName forKey:@"screenName"];
    [self.sharedService sendEvent:eventsMap];
}

+ (void)logClickedEventWithWidgetName:(NSString*)widgetName
                                 andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_clicked" forKey:@"eventName"];
    [eventsMap setObject:widgetName forKey:@"widgetName"];
    [self.sharedService sendEvent:eventsMap];
}


+ (void)logGenericEventWithParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_generic_event" forKey:@"eventName"];
    [self.sharedService sendEvent:eventsMap];
}
@end
