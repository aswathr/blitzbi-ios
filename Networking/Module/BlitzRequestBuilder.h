//
//  BaseRouter.h
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlitzServerHandler.h"

typedef enum {
    APP_REQUEST,
    BI_REQUEST,
    ERROR_FREE_REQUEST,
    PARALLEL_REQUEST,
    PARALLEL_ERROR_FREE_REQUEST
} RequestType;

typedef void (^HTTPRequestResponseBlock)(NSObject *response, NSError *error);

@interface BlitzRequestBuilder : NSObject

@property (nonatomic) NSString *method;
@property NSString *path; // url extension after base url
@property NSString *baseUrl;
@property NSString *contentType;
@property NSMutableDictionary *parameters;
@property NSData *httpBody;
@property NSString *extraInfo;
@property NSString *requestId;
@property Boolean pendingRequest;
@property NSMutableDictionary *multipartParameters;
@property NSMutableDictionary *multipartData;
@property BOOL shouldEncryptRequestBody;
@property BOOL isShowForbiddenError; // This is for error free requests to show 4xx generic response popup

@property (nonatomic, assign) RequestType reqType;
@property (weak) id<ResponseListener> responseListener;
@property HTTPRequestResponseBlock responseBlock;

@property NSTimeInterval startTime;
@property NSTimeInterval requestTotalTime;

@property NSMutableDictionary *headers;

- (NSMutableURLRequest *)generateRequest;

- (NSString *)detailsOne;
- (NSString *)detailsTwo;

@end