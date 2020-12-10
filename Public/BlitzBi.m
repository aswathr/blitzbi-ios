//
//  BlitzBi.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBi.h>
#import <BlitzBiService.h>

@implementation BlitzBi
+ (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)appToken
         andAllowAdTracking:(BOOL)adTracking {
    [[BlitzBiService sharedService] setUp:appId :appToken :adTracking : NO];
}

+ (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)appToken
         andAllowAdTracking:(BOOL)adTracking
          andIsDebugEnabled:(BOOL)debugEnabled {
    [[BlitzBiService sharedService] setUp:appId :appToken :adTracking :debugEnabled];
}

+ (void)setAppSpecificIdentifier:(NSString*)identifier {
    [[BlitzBiService sharedService] setAppSpecificIdentifier:identifier];
}

+ (void)setBlitzUserId:(NSString*)userId {
    [[BlitzBiService sharedService] setBlitzUserId:userId];
}

+ (void)sendEvent:(NSDictionary*)event{
    [[BlitzBiService sharedService] sendEvent:event];
}

+ (void)sendEvents:(NSArray*)events {
    [[BlitzBiService sharedService] sendEvents:events];
}

+ (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value {
    [[BlitzBiService sharedService] addCommonParamsWithKey:key andValue:value];
}

+ (long)getCurrentTime {
    return [[BlitzBiService sharedService] getCurrentTime];
}

+ (void)logCompleteRegistrationEventWithMethod:(NSString *)registrationMethod andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_complete_registration" forKey:@"eventName"];
    [eventsMap setObject:registrationMethod forKey:@"registrationMethod"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logSubscribeEventWithAmount:(double)price
                  andSubscriptionId:(NSString*)subscriptionId
                          andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_subscribe" forKey:@"eventName"];
    [eventsMap setObject:subscriptionId forKey:@"subscriptionId"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logSubscriptionRenewalEventWithRenewalCount:(int)renewalCount
                                  andSubscriptionId:(NSString*)subscriptionId
                                          andAmount:(double)price
                                          andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_subscription_renewal" forKey:@"eventName"];
    [eventsMap setObject:subscriptionId forKey:@"subscriptionId"];
    [eventsMap setObject:[NSNumber numberWithInt:renewalCount] forKey:@"renewalCount"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logSubscriptionCancelEventWithParams:(NSDictionary*)params
                           andSubscriptionId:(NSString*)subscriptionId {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap setObject:@"blitz_subscription_cancel" forKey:@"eventName"];
    [eventsMap setObject:subscriptionId forKey:@"subscriptionId"];
    [eventsMap addEntriesFromDictionary:params];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logPurchaseEventWithAmount:(double)price
                         andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_inapp_purchase" forKey:@"eventName"];
    [eventsMap setObject:[NSNumber numberWithFloat:price] forKey:@"amount"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logScreenVisitedEventWithScreenName:(NSString*)screenName {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap setObject:@"blitz_screen_visited" forKey:@"eventName"];
    [eventsMap setObject:screenName forKey:@"screenName"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logClickedEventWithWidgetName:(NSString*)widgetName
                            andParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_clicked" forKey:@"eventName"];
    [eventsMap setObject:widgetName forKey:@"widgetName"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}


+ (void)logGenericEventWithParams:(NSDictionary*)params {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:params];
    [eventsMap setObject:@"blitz_generic_event" forKey:@"eventName"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}

+ (void)logCustomEventWithEventName:(NSString *)eventName
                    andStringParams:(NSDictionary<NSString *, NSString *> *)strParams
                       andIntParams:(NSDictionary<NSString *, NSNumber *> *)intParams
                     andFloatParams:(NSDictionary<NSString *,NSNumber *> *)floatParams {
    NSMutableDictionary *eventsMap = [[NSMutableDictionary alloc]init];
    [eventsMap addEntriesFromDictionary:strParams];
    
    NSEnumerator *enumerator = [intParams keyEnumerator];
    id key;
    // extra parens to suppress warning about using = instead of ==
    while((key = [enumerator nextObject]))
        [eventsMap setValue:[NSNumber numberWithInt:[[intParams objectForKey:key] intValue]] forKey:key];
    
    enumerator = [floatParams keyEnumerator];
    // extra parens to suppress warning about using = instead of ==
    while((key = [enumerator nextObject]))
        [eventsMap setValue:[NSNumber numberWithInt:[[floatParams objectForKey:key] floatValue]] forKey:key];
    
    [eventsMap setObject:[NSString stringWithFormat:@"%@_%@", @"bz", eventName] forKey:@"eventName"];
    [[BlitzBiService sharedService] sendEvent:eventsMap];
}
@end
