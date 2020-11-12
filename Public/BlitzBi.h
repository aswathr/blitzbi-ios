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
static NSString * _Nonnull const BlitzBiParameterProductID = @"productId";
static NSString * _Nonnull const BlitzBiParameterCurrency = @"currency";
static NSString * _Nonnull const BlitzBiParameterRenewalPeriod = @"renewalPeriod";
static NSString * _Nonnull const BlitzBiParameterTrialDays = @"trialDays";
static NSString * _Nonnull const BlitzBiParameterDiscountedPrice = @"discountedAmount";
static NSString * _Nonnull const BlitzBiParameterScreenName = @"screenName";
static NSString * _Nonnull const BlitzBiAction = @"action";

static NSString * _Nonnull const BlitzBiParameterStringDetails1 = @"str_field0";
static NSString * _Nonnull const BlitzBiParameterStringDetails2 = @"str_field1";
static NSString * _Nonnull const BlitzBiParameterStringDetails3 = @"str_field2";
static NSString * _Nonnull const BlitzBiParameterStringDetails4 = @"str_field3";
static NSString * _Nonnull const BlitzBiParameterStringDetails5 = @"str_field4";
static NSString * _Nonnull const BlitzBiParameterStringDetails6 = @"str_field5";
static NSString * _Nonnull const BlitzBiParameterStringDetails7 = @"str_field6";
static NSString * _Nonnull const BlitzBiParameterStringDetails8 = @"str_field7";
static NSString * _Nonnull const BlitzBiParameterStringDetails9 = @"str_field8";
static NSString * _Nonnull const BlitzBiParameterStringDetails10 = @"str_field9";
static NSString * _Nonnull const BlitzBiParameterStringDetails11 = @"str_field10";
static NSString * _Nonnull const BlitzBiParameterStringDetails12 = @"str_field11";
static NSString * _Nonnull const BlitzBiParameterStringDetails13 = @"str_field12";
static NSString * _Nonnull const BlitzBiParameterStringDetails14 = @"str_field13";
static NSString * _Nonnull const BlitzBiParameterStringDetails15 = @"str_field14";
static NSString * _Nonnull const BlitzBiParameterIntDetails1 = @"int_field0";
static NSString * _Nonnull const BlitzBiParameterIntDetails2 = @"int_field1";
static NSString * _Nonnull const BlitzBiParameterIntDetails3 = @"int_field2";
static NSString * _Nonnull const BlitzBiParameterIntDetails4 = @"int_field3";
static NSString * _Nonnull const BlitzBiParameterIntDetails5 = @"int_field4";
static NSString * _Nonnull const BlitzBiParameterIntDetails6 = @"int_field5";
static NSString * _Nonnull const BlitzBiParameterIntDetails7 = @"int_field6";
static NSString * _Nonnull const BlitzBiParameterIntDetails8 = @"int_field7";
static NSString * _Nonnull const BlitzBiParameterIntDetails9 = @"int_field8";
static NSString * _Nonnull const BlitzBiParameterIntDetails10 = @"int_field9";
static NSString * _Nonnull const BlitzBiParameterIntDetails11 = @"int_field10";
static NSString * _Nonnull const BlitzBiParameterIntDetails12 = @"int_field11";
static NSString * _Nonnull const BlitzBiParameterIntDetails13 = @"int_field12";
static NSString * _Nonnull const BlitzBiParameterIntDetails14 = @"int_field13";
static NSString * _Nonnull const BlitzBiParameterIntDetails15 = @"int_field14";
static NSString * _Nonnull const BlitzBiParameterFloatDetails1 = @"float_field0";
static NSString * _Nonnull const BlitzBiParameterFloatDetails2 = @"float_field1";
static NSString * _Nonnull const BlitzBiParameterFloatDetails3 = @"float_field2";
static NSString * _Nonnull const BlitzBiParameterFloatDetails4 = @"float_field3";
static NSString * _Nonnull const BlitzBiParameterFloatDetails5 = @"float_field4";
static NSString * _Nonnull const BlitzBiParameterFloatDetails6 = @"float_field5";
static NSString * _Nonnull const BlitzBiParameterFloatDetails7 = @"float_field6";
static NSString * _Nonnull const BlitzBiParameterFloatDetails8 = @"float_field7";
static NSString * _Nonnull const BlitzBiParameterFloatDetails9 = @"float_field8";
static NSString * _Nonnull const BlitzBiParameterFloatDetails10 = @"float_field9";
static NSString * _Nonnull const BlitzBiParameterFloatDetails11 = @"float_field10";
static NSString * _Nonnull const BlitzBiParameterFloatDetails12 = @"float_field11";
static NSString * _Nonnull const BlitzBiParameterFloatDetails13 = @"float_field12";
static NSString * _Nonnull const BlitzBiParameterFloatDetails14 = @"float_field13";
static NSString * _Nonnull const BlitzBiParameterFloatDetails15 = @"float_field14";



@interface BlitzBi : NSObject
/// Description: Calling this will enabled the debug mode.
+ (void)enabledDebugMode;

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
