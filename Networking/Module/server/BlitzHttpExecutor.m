//
//  HttpExecutor.m
//  ArVideoDemo
//
//  Created by Mitesh on 20/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzHttpExecutor.h"
#import "BlitzRequestBuilder.h"
#import "BlitzConfig.h"
#import "BlitzKiwiParser.h"


@implementation BlitzHttpExecutor

+ (AFURLSessionManager *)getSessionManager {
    static AFURLSessionManager *manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.HTTPMaximumConnectionsPerHost = 1;
            [configuration setTimeoutIntervalForRequest:30];
    
            manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
            [BlitzHttpExecutor applyPinningToSessionManager:manager];
            [manager setCompletionQueue:dispatch_queue_create("HttpExecutorQueue",
                                                              DISPATCH_QUEUE_SERIAL)];
        }
    }
    return manager;
}

+ (void)applyPinningToSessionManager:(AFURLSessionManager *)manager {
    NSString *cerPath = [[NSBundle bundleForClass:self] pathForResource:@"onsequel" ofType:@"cer"];
    //[[NSBundle mainBundle] pathForResource:@"onsequel" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    NSString *certPathAmazon = [[NSBundle bundleForClass:self] pathForResource:@"onsequel-am" ofType:@"cer"];
    NSData *certAmazonData = [NSData dataWithContentsOfFile:certPathAmazon];
    
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    policy.validatesDomainName = NO;
    
    policy.pinnedCertificates = @[certData, certAmazonData];
    [policy setAllowInvalidCertificates:YES];
    manager.securityPolicy = policy;
}

+ (AFURLSessionManager *)getSessionManagerWithNoConnectionLimit {
    static AFURLSessionManager *manager = nil;
    @synchronized(self) {
        if (manager == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            [configuration setTimeoutIntervalForRequest:30];
            manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
            [BlitzHttpExecutor applyPinningToSessionManager:manager];
            [manager setCompletionQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
        }
    }
    return manager;
}

+ (AFURLSessionManager *)getBISessionManager {
    static AFURLSessionManager *biManager = nil;
    @synchronized(self) {
        if (biManager == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.HTTPMaximumConnectionsPerHost = 1;
            [configuration setTimeoutIntervalForRequest:60];
            biManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
            
            [BlitzHttpExecutor applyPinningToSessionManager:biManager];
            [biManager setCompletionQueue:dispatch_queue_create("HttpExecutorBIQueue",
                                                              DISPATCH_QUEUE_SERIAL)];
        }
    }
    return biManager;
}

+ (AFURLSessionManager *)getLogSessionManager {
    static AFURLSessionManager *logManager = nil;
    @synchronized(self) {
        if (logManager == nil) {
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.HTTPMaximumConnectionsPerHost = 1;
            [configuration setTimeoutIntervalForRequest:60];
            logManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
            [BlitzHttpExecutor applyPinningToSessionManager:logManager];
            [logManager setCompletionQueue:dispatch_queue_create("HttpExecutorLogQueue",
                                                                DISPATCH_QUEUE_SERIAL)];
        }
    }
    return logManager;
}

+ (void)executeRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    switch (requestBuilder.reqType) {
        case APP_REQUEST:
        case ERROR_FREE_REQUEST:
        case SECONDARY_APP_REQUEST:
        case MINI_GAME_REQUEST:
        case FACE_SWAP_REQUEST:
        case USER_PROFILE_REQUEST: {
            [self executeAppRequest:requestBuilder listener:listener];
            break;
        }
        case PARALLEL_REQUEST:
        case PARALLEL_ERROR_FREE_REQUEST: {
            [self executeParallelRequest:requestBuilder listener:listener];
            break;
        }

        case BI_REQUEST: {
            [self executeBIRequest:requestBuilder listener:listener];
            break;
        }
            
        case LOG_REQUEST: {
            [self executeLogRequest:requestBuilder listener:listener];
            break;
        }

        default: {
            break;
        }
    }
}

+ (void)executeParallelRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {

    AFURLSessionManager *manager = [self getSessionManagerWithNoConnectionLimit];
    [BlitzHttpExecutor fire:manager withRequest:requestBuilder listener:listener];
}

+ (void)executeAppRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    @try {
        NSLog(@"App Request: %d, %@, %@, %@", requestBuilder.reqType, requestBuilder.method, requestBuilder.baseUrl, requestBuilder.path);
    }
    @catch (NSException *ex) {
        NSLog(@"Caught exception = %@", ex);
    }

    AFURLSessionManager *manager = [self getSessionManager];
    
    [BlitzHttpExecutor fire:manager withRequest:requestBuilder listener:listener];
}

+ (void)executeBIRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    AFURLSessionManager *biManager = [self getBISessionManager];
    [BlitzHttpExecutor fire:biManager withRequest:requestBuilder listener:listener];
}

+ (void)executeLogRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    AFURLSessionManager *logManager = [self getLogSessionManager];
    [BlitzHttpExecutor fire:logManager withRequest:requestBuilder listener:listener];
}

+ (void)fire:(AFURLSessionManager *)manager withRequest:(BlitzRequestBuilder *)requestBuilder listener:(id<BlitzHttpResponseListener> )listener {
    NSMutableURLRequest *request = requestBuilder.generateRequest;

    // Send request id to track each and every request.
    if (requestBuilder.requestId) {
        [request setValue:requestBuilder.requestId forHTTPHeaderField:@"X-APP-REQUESTID"];
    }
    
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"v1" forHTTPHeaderField:@"Kiwi-Encoding"];

    if (requestBuilder.headers) {
        for (NSString *key in requestBuilder.headers) {
            [request setValue:[requestBuilder.headers objectForKey:key] forHTTPHeaderField:key];
        }
    }

    if (config.isDebugEnabled) {
        NSLog(@"[Server][ServerHandler] making request(type: %d) to URL: %@",requestBuilder.reqType, request.URL);
    }

    [requestBuilder setStartTime:[[NSDate date] timeIntervalSince1970]];
    [[manager dataTaskWithRequest:request
                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                    
                    NSInteger statusCode = 0;
                    if ([response isKindOfClass:NSHTTPURLResponse.class]) {
                        statusCode = ((NSHTTPURLResponse *)response).statusCode;
                    }
                    [requestBuilder setRequestTotalTime:([[NSDate date] timeIntervalSince1970] - requestBuilder.startTime)];
                    NSObject *responseObjectToSubmit = [self getParsedData:response withRequest:requestBuilder withResponseObject:responseObject andError:error];
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
    NSString *kiwiEncryptionHeader = (NSString *)[headers objectForKey:@"Kiwi-Encryption"];
    if (error == nil
        && kiwiEncryptionHeader
        && [kiwiEncryptionHeader isEqualToString:@"enabled"]
        && [responseObject isKindOfClass:NSArray.class] && [(NSArray *)responseObject count] > 0) {

        //Decrypt the body
        NSString *encryptedResponseObjectStr = (NSString *)[(NSArray *)responseObject objectAtIndex:0];
        NSData *responseData = [BlitzKiwiParser parse:encryptedResponseObjectStr withDetailsOne:[requestBuilder detailsOne] andDetailsTwo:[requestBuilder detailsTwo]];
        responseObjectToSubmit = [NSJSONSerialization JSONObjectWithData:responseData
                                                                 options:kNilOptions
                                                                   error:&error];
    }
    return responseObjectToSubmit;

}


@end
