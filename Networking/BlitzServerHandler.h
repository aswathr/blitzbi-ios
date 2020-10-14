//
//  BlitzRequestBuilder.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzHttpResponseListener.h>
#import <BlitzConstants.h>

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
