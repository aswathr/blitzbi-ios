//
//  BlitzBi.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzBiParameterConstants.h>


NS_ASSUME_NONNULL_BEGIN
@interface BlitzBi : NSObject
/// Description: Initialize BlitzBi sdk with the app_id and app_token.
+ (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)andAppToken
         andAllowAdTracking:(BOOL)adTracking;

/// Description: Initialize device Identifier.
+ (void)setAppSpecificIdentifier:(NSString*)deviceIdentifier;

/// Description: Initialize device Identifier.
+ (void)setBlitzUserId:(NSString*)userIdentifier;

/// Description: Use this for logging custom event.
+ (void)sendEvent:(NSDictionary*)eventDict;

/// Description: Use this for logging custom events.
+ (void)sendEvents:(NSArray*)events;

/// Description: Use this to add common Params.
+ (void)addCommonParamsWithKey:(NSString *)key
                      andValue:(NSString *)value;

+ (long)getCurrentTime;

/// Description: Log this event once the user in your app completes registration flow. (example: sign up using email, phone, etc.).
+ (void)logCompleteRegistrationEventWithMethod:(NSString *)registrationMethod
                                     andParams:(NSDictionary*)params;


/// Description: Log this event at the start of a paid subscription for a product or any service you offer.
+ (void)logSubscribeEventWithAmount:(double)price
                  andSubscriptionId:(NSString*)subscriptionId
                          andParams:(NSDictionary*)params;


/// Description: Log this event when a paid subscription for a product or service is renewed.
+ (void)logSubscriptionRenewalEventWithRenewalCount:(int)renewalCount
                                  andSubscriptionId:(NSString*)subscriptionId
                                          andAmount:(double)price
                                          andParams:(NSDictionary*)params;

/// Description: Log this event when a paid subscription for a  product or service is cancelled.
+ (void)logSubscriptionCancelEventWithParams:(NSDictionary*)params
                           andSubscriptionId:(NSString*)subscriptionId;

/// Description: Log this event when a user makes an inapp purchase to some virtual currency.
+ (void)logPurchaseEventWithAmount:(double)price
                         andParams:(NSDictionary*)params;

/// Description: Log this event when a user visited any screen in the app.
+ (void)logScreenVisitedEventWithScreenName:(NSString*)screenName;


/// Description: Log this event when the user clicks on any widget in the app.
+ (void)logClickedEventWithWidgetName:(NSString*)widgetName
                            andParams:(NSDictionary*)params;

+ (void)logGenericEventWithParams:(NSDictionary*)params;

+ (void)logCustomEventWithEventName:(NSString *)eventName
                    andStringParams:(NSDictionary<NSString *, NSString *> *)strParams
                       andIntParams:(NSDictionary<NSString *, NSNumber *> *)intParams
                     andFloatParams:(NSDictionary<NSString *,NSNumber *> *)floatParams;

@end

NS_ASSUME_NONNULL_END
