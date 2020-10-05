//
//  HttpExecutor.h
//  ArVideoDemo
//
//  Created by Mitesh on 20/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlitzHttpResponseListener.h"

@interface BlitzHttpExecutor : NSObject

+ (void)executeRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (void)executeAppRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (void)executeBIRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (NSURLSession *)getSessionManager;

@end
