//
//  BlitzHttpExecutor.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzHttpExecutor.h"
#import "BlitzRequestBuilder.h"
#import "BlitzParser.h"

@implementation BlitzHttpExecutor

+ (NSURLSession *)getNSURLSession {
    static NSURLSession *session = nil;
    @synchronized(self) {
        if (session == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.HTTPMaximumConnectionsPerHost = 1;
            [configuration setTimeoutIntervalForRequest:30];
            session = [NSURLSession sessionWithConfiguration:configuration];
        }
    }
    return session;
}

+ (NSURLSession *)getNSURLSessionWithNoConnectionLimit {
    static NSURLSession *session = nil;
    @synchronized(self) {
        if (session == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            [configuration setTimeoutIntervalForRequest:30];
            session = [NSURLSession sessionWithConfiguration:configuration];
        }
    }
    return session;
}

+ (NSURLSession *)getBINSURLSession {
    static NSURLSession *biSession = nil;
    @synchronized(self) {
        if (biSession == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.HTTPMaximumConnectionsPerHost = 1;
            [configuration setTimeoutIntervalForRequest:60];
            biSession = [NSURLSession sessionWithConfiguration:configuration];
        }
    }
    return biSession;
}

+ (void)executeRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    switch (requestBuilder.reqType) {
        case APP_REQUEST:
        case ERROR_FREE_REQUEST:
        case BI_REQUEST: {
            [self executeAppRequest:requestBuilder listener:listener];
            break;
        }
        case PARALLEL_REQUEST:
        case PARALLEL_ERROR_FREE_REQUEST: {
            [self executeParallelRequest:requestBuilder listener:listener];
            break;
        }
            
        default: {
            break;
        }
    }
}

+ (void)executeParallelRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    NSURLSession *session = [self getNSURLSessionWithNoConnectionLimit];
    [BlitzHttpExecutor fire:session withRequest:requestBuilder listener:listener];
}

+ (void)executeAppRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    NSURLSession *session = [self getNSURLSession];
    [BlitzHttpExecutor fire:session withRequest:requestBuilder listener:listener];
}

+ (void)executeBIRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    NSURLSession *biSession = [self getBINSURLSession];
    [BlitzHttpExecutor fire:biSession withRequest:requestBuilder listener:listener];
}

+ (void)fire:(NSURLSession *)session withRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    NSMutableURLRequest *request = requestBuilder.generateRequest;
    
    // Send request id to track each and every request.
    if (requestBuilder.requestId) {
        [request setValue:requestBuilder.requestId forHTTPHeaderField:@"X-APP-REQUESTID"];
    }
    
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"v1" forHTTPHeaderField:@"Blitz-Encoding"];
    
    if (requestBuilder.headers) {
        for (NSString *key in requestBuilder.headers) {
            [request setValue:[requestBuilder.headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    [requestBuilder setStartTime:[[NSDate date] timeIntervalSince1970]];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSInteger statusCode = 0;
        if ([response isKindOfClass:NSHTTPURLResponse.class]) {
            statusCode = ((NSHTTPURLResponse *)response).statusCode;
        }
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData* newData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonOutput = [NSJSONSerialization JSONObjectWithData:newData options:0 error:nil];
        [requestBuilder setRequestTotalTime:([[NSDate date] timeIntervalSince1970] - requestBuilder.startTime)];
        NSObject *responseObjectToSubmit = [self getParsedData:response withRequest:requestBuilder withResponseObject:jsonOutput andError:error];
        [listener onHttpResponse:responseObjectToSubmit forRequestBuilder:requestBuilder error:error withStatusCode:statusCode];
    }] resume];
}

+ (NSObject *)getParsedData:(NSURLResponse *)response withRequest:(BlitzRequestBuilder *)requestBuilder withResponseObject:(id)responseObject andError:(NSError *)error {
    NSObject *responseObjectToSubmit = responseObject;
    
    //Get headers
    NSDictionary *headers = [[NSDictionary alloc] init];
    if ([response isKindOfClass:NSHTTPURLResponse.class] && ((NSHTTPURLResponse *)response).allHeaderFields) {
        headers = ((NSHTTPURLResponse *)response).allHeaderFields;
    }
    
    //check if the response body is encrypted using response headers
    NSString *blitzEncryptionHeader = (NSString *)[headers objectForKey:@"Blitz-Encryption"];
    if (error == nil
        && blitzEncryptionHeader
        && [blitzEncryptionHeader isEqualToString:@"enabled"]
        && [responseObject isKindOfClass:NSArray.class] && [(NSArray *)responseObject count] > 0) {
        
        //Decrypt the body
        NSString *encryptedResponseObjectStr = (NSString *)[(NSArray *)responseObject objectAtIndex:0];
        NSData *responseData = [BlitzParser parse:encryptedResponseObjectStr withDetailsOne:[requestBuilder detailsOne] andDetailsTwo:[requestBuilder detailsTwo]];
        responseObjectToSubmit = [NSJSONSerialization JSONObjectWithData:responseData
                                                                 options:kNilOptions
                                                                   error:&error];
    }
    return responseObjectToSubmit;
    
}

@end
