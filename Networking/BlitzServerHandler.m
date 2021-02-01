//
//  BlitzServerHandler.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzServerHandler.h"
#import "BlitzRequestBuilder.h"
#import "BlitzHttpExecutor.h"
#import "BlitzKWConcurrentDictionary.h"
#import "BlitzConstants.h"
#import "BlitzHttpResponseListener.h"
#import "BlitzConstants.h"

@implementation BlitzServerHandler
- (instancetype)init {
    if (self = [super init]) {
        blitzRequestRetry = [[BlitzKWConcurrentDictionary alloc] init];
        
        BLITZ_INTERNET_ERROR_CODES = @[@ - 1, @1, @2, @100, @101, @ - 1001, @ - 1003, @ - 1004, @ - 1005, @ - 1006, @ - 1009, @-1011, @ - 1018, @ - 1020];
        
        BLITZ_SERVER_ERROR_CODES = @[@121, @122, @123, @124, @300, @301, @303, @307, @308, @309, @310, @311, @ - 999, @ - 1002, @ - 1010, @ - 1011, @ - 1013, @ - 1015, @ - 1016, @ - 1017, @ - 1021, @ - 1201, @ - 1202, @ - 1203, @ - 1204, @ - 1205, @ - 1206];
        
        BLITZ_BAD_REQUEST_ERROR_CODES = @[@ - 1011];
        
        BLITZ_RECOVERABLE_ERROR_CODES = @[@110, @111, @112, @113, @120, @302, @304, @305, @306, @ - 998, @ - 999, @ - 1007, @ - 1008, @ - 1012, @ - 1014, @ - 1019, @ - 1200];
    }
    return self;
}

- (NSString *)getUniqueRequestId {
    return @"";
}

- (void)serverCall:(BlitzRequestBuilder *)requestBuilder withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *requestId = [self getUniqueRequestId];
        [requestBuilder setRequestId:requestId];
        [self->blitzRequestRetry setObject:[NSNumber numberWithInteger:0] forKey:requestId];
        [BlitzHttpExecutor executeRequest:requestBuilder listener:self];
        requestBuilder.responseBlock = ^(NSObject *data, NSError *error) {
            completionBlock(data,error);
        };
    });
}

- (void)onHttpResponse:(id)response forRequestBuilder:(BlitzRequestBuilder *)request error:(NSError *)err withStatusCode:(NSInteger)statusCode {
    NSString *reqId = request.requestId;
    
    if (request.reqType == APP_REQUEST|| request.reqType == PARALLEL_REQUEST) {
        NSLog(@"[BlitzBi] Got response for APP_REQUEST -- %@, %@  - Error= %@", request.baseUrl, request.path, err);
    }

    if (response == nil  || (err == nil && statusCode != 200)) {
        err = [NSError errorWithDomain:@"HTTPResponseNot200" code:statusCode userInfo:@{}];
    }

    if (err) {
        NSString *httpResponseCode;
        if (response && [response isKindOfClass:[NSDictionary class]]){
            NSDictionary *httpResponse = (NSDictionary *) response;
            httpResponseCode = [httpResponse objectForKey:@"code"];
        }
        if (httpResponseCode == nil && [[err localizedDescription] containsString:@"unauthorized (401)"]) {
            httpResponseCode = @"401";
        }
        if (httpResponseCode == nil && [[err localizedDescription] containsString:@"client error (451)"]) {
            httpResponseCode = @"451";
        }
        if (httpResponseCode == nil && [[err localizedDescription] containsString:@"precondition failed (412)"]) {
            httpResponseCode = @"412";
        }
        if (httpResponseCode == nil && [[err localizedDescription] containsString:@"forbidden (403)"]) {
            httpResponseCode = BLITZ_FORBIDDED_ERROR_CODE;
        }
        if (request.reqType == APP_REQUEST) {
            NSLog(@"[BlitzBi] Got error from APP_REQUEST -- %@, %@", request.baseUrl, request.path);
        }
        
        NSNumber *errorCode = [NSNumber numberWithInteger:[err code]];
        
        if (blitzPendingRequests == nil) {
            blitzPendingRequests = [[NSMutableArray alloc] init];
        }
        /*error codes is one of temporary error code or no-internet case*/
        if ([self arrayContains:BLITZ_RECOVERABLE_ERROR_CODES num:errorCode]) {
            /*first try few times to handle temp errors -- can be done using error codes too*/
            NSInteger retry = [[blitzRequestRetry objectForKey:reqId] integerValue];
            if (retry < BLITZ_MAX_RETRY) {
                retry++;
                
                [blitzRequestRetry setObject:[NSNumber numberWithInteger:retry] forKey:reqId];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, BLITZ_DELAY_PER_RETRY), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0ul), ^{
                    NSLog(@"[BlitzBi] Will retry again, retry count being %li", (long)retry);
                    [BlitzHttpExecutor executeRequest:request listener:self];
                });
                return;
            }
            
            /*after max retry add to pending requests and reset retry count*/
            [blitzRequestRetry setObject:[NSNumber numberWithInteger:0] forKey:reqId];
        }
        
        if ((httpResponseCode && ([httpResponseCode isEqualToString: @"401"] || [httpResponseCode isEqualToString: @"451"] || [httpResponseCode isEqualToString:BLITZ_FORBIDDED_ERROR_CODE])) || (request.reqType != BI_REQUEST && request.reqType != ERROR_FREE_REQUEST && request.reqType != PARALLEL_ERROR_FREE_REQUEST)) {
            
            @synchronized(self) {
                [blitzPendingRequests addObject:request];
            }
        }
        // This is done to pass HTTP response to caller
        NSInteger erroCode = err.code;
        if (httpResponseCode.length > 0) {
            erroCode = [httpResponseCode integerValue];
            err = [NSError errorWithDomain:@"HTTPResponse" code:erroCode userInfo:err.userInfo];
        }
    }
    
    if (request.responseBlock) {
        request.responseBlock(response, err);
    }
    
    if (request.reqType == BI_REQUEST || request.reqType == ERROR_FREE_REQUEST || request.reqType == PARALLEL_ERROR_FREE_REQUEST) {
        return;
    }
    
    if (err == nil && [blitzRequestRetry objectForKey:reqId]) {
        [blitzRequestRetry removeObjectForKey:reqId];
    }
}

- (void)retryPendingCalls {
    @synchronized(self) {
        for (BlitzRequestBuilder *req in blitzPendingRequests) {
            [req setPendingRequest:YES];
            [BlitzHttpExecutor executeRequest:req listener:self];
        }
        [blitzPendingRequests removeAllObjects];
    }
}

- (BOOL)arrayContains:(NSArray *)arr num:(NSNumber *)num {
    return [arr containsObject:num];
}

@end
