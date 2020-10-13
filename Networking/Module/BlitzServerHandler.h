//
//  ServerHandler.h
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzHttpResponseListener.h>

#pragma method types
static NSString *const POST_METHOD = @"POST";
static NSString *const GET_METHOD = @"GET";
static NSString *const PUT_METHOD = @"PUT";
static NSString *const DELETE_METHOD = @"DELETE";

@class BlitzRequestBuilder;

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
- (void)serverCall:(BlitzRequestBuilder *)requestBuilder withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock;
@end

@interface BlitzServerHandler : NSObject<BlitzHttpResponseListener,PServerHandler>
+ (id)serverHandler;
- (void)retryPendingCalls;
@end
