//
//  HttpExecutor.h
//  ArVideoDemo
//
//  Created by Mitesh on 20/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <HttpResponseListener.h>

@interface HttpExecutor : NSObject

+ (void)executeRequest:(RequestBuilder *)requestBuilder listener:(id<HttpResponseListener> )listener;
+ (void)executeAppRequest:(RequestBuilder *)requestBuilder listener:(id<HttpResponseListener> )listener;
+ (void)executeBIRequest:(RequestBuilder *)requestBuilder listener:(id<HttpResponseListener> )listener;
+ (AFURLSessionManager *)getSessionManager;

@end
