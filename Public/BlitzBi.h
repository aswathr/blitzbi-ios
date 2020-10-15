//
//  BlitzBi.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
static NSString * _Nonnull const BlitzBiParameterRegistrationDetails = @"registrationDetails";
static NSString * _Nonnull const BlitzBiParameterOrderID = @"orderId";
static NSString * _Nonnull const BlitzBiParameterCurrency = @"currency";
static NSString * _Nonnull const BlitzBiParameterRenewalPeriod = @"renewalPeriod";
static NSString * _Nonnull const BlitzBiParameterTrialDays = @"trialDays";
static NSString * _Nonnull const BlitzBiParameterDiscountedPrice = @"discountedPrice";
static NSString * _Nonnull const BlitzBiParameterScreenName = @"screenName";
static NSString * _Nonnull const BlitzBiAction = @"action";

@interface BlitzBi : NSObject
/// Description: Initialize BlitzBi sdk with the app_id and app_token.
+ (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)andAppToken;

/// Description: Use this for logging custom event.
+ (void)sendEvent:(NSDictionary*)eventDict;

/// Description: Use this for logging custom events.
+ (void)sendEvents:(NSArray*)events;

/// Description: Log this event once the user in your app completes registration flow. (example: sign up using email, phone, etc.).
+ (void)logCompleteRegistrationEventWithMethod:(NSString *)registrationMethod
                                     andParams:(NSDictionary*)params;


/// Description: Log this event at the start of a paid subscription for a product or any service you offer.
+ (void)logSubscribeEventWithAmount:(double)price
                          andParams:(NSDictionary*)params;


/// Description: Log this event when a paid subscription for a product or service is renewed.
+ (void)logSubscriptionRenewalEventWithRenewalCount:(int)renewalCount
                                          andAmount:(double)price
                                          andParams:(NSDictionary*)params;

/// Description: Log this event when a paid subscription for a  product or service is cancelled.
+ (void)logSubscriptionCancelEventWithParams:(NSDictionary*)params;

/// Description: Log this event when a user makes an inapp purchase to some virtual currency.
+ (void)logPurchaseEventWithAmount:(double)price
                         andParams:(NSDictionary*)params;

/// Description: Log this event when a user visited any screen in the app.
+ (void)logScreenVisitedEventWithScreenName:(NSString*)screenName;


/// Description: Log this event when the user clicks on any widget in the app.
+ (void)logClickedEventWithWidgetName:(NSString*)widgetName
                            andParams:(NSDictionary*)params;

+ (void)logGenericEventWithParams:(NSDictionary*)params;

@end

NS_ASSUME_NONNULL_END
