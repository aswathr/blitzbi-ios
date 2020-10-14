//
//  BlitzHttpExecutor.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzHttpResponseListener.h>

@interface BlitzHttpExecutor : NSObject

+ (void)executeRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (void)executeAppRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (void)executeBIRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener;
+ (NSURLSession *)getNSURLSession;

@end
