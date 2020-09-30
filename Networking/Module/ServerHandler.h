//
//  ServerHandler.h
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HttpResponseListener.h>

static NSString *const PHONE_MACRO_IN_URL = @":phone";
static NSString *const ROOM_ID_MACRO_IN_URL = @":roomId";
static NSString *const USER_ID_MACRO_IN_URL = @":userId";
static NSString *const DEVICE_TYPE_MACRO_IN_URL = @":deviceType";

static NSString *const KIWI_DOMAIN = @"onsequel.com";
static NSString *const LOCAL_IP_PREFIX = @"172.16.";
static NSString *const LOCAL_IP_PREFIX2 = @"192.168.";

static NSString *const RUMMY_DOMAIN = @"blackrummy.com";

#pragma method types
static NSString *const POST_METHOD = @"POST";
static NSString *const GET_METHOD = @"GET";
static NSString *const PUT_METHOD = @"PUT";
static NSString *const DELETE_METHOD = @"DELETE";

@class RequestBuilder;

@protocol ResponseListener
- (void)success:(NSObject *)data;
- (void)failure:(NSError *)error extraInfo:(NSString *)channelId;
@end

@protocol DiffServiceResponseListener<ResponseListener>
- (void)success:(NSObject *)data withRequestTime:(NSTimeInterval)totalTime;
@end

@protocol ResponseObjectSerializable
- (id<ResponseObjectSerializable> )init:(NSObject *)response;
@end

@protocol ResponseCollectionSerializable<ResponseObjectSerializable>
- (NSArray *)collection:(NSArray *)response;
@end

@protocol PServerHandler
- (void)serverCall:(RequestBuilder *)requestBuilder withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock;
@end

@interface ServerHandler : NSObject<HttpResponseListener,PServerHandler>
+ (id)serverHandler;
- (void)retryPendingCalls;

@end
