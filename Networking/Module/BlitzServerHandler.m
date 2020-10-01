//
//  ServerHandler.m
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//

#import "BlitzServerHandler.h"
//#import "NSNotificationHelper.h"
//#import "NotificationNameConstant.h"
//#import "AppManager.h"
//#import "ErrorType.h"
#import "BlitzRequestBuilder.h"
#import "BlitzHttpExecutor.h"
//#import "ErrorHandler.h"
//#import "BiConstants.h"
//#import "DiffService.h"
#import "BlitzKWConcurrentDictionary.h"
#import <BlitzCommonConstant.h>
#import <BlitzStringConstant.h>
//#import "UserService.h"

@implementation BlitzServerHandler

BlitzKWConcurrentDictionary *requestRetry;
NSMutableArray *pendingRequests;
NSArray<NSNumber *> *INTERNET_ERROR_CODES;
NSArray<NSNumber *> *SERVER_ERROR_CODES;
NSArray<NSNumber *> *RECOVERABLE_ERROR_CODES;
NSArray<NSNumber *> *BAD_REQUEST_ERROR_CODES;
static NSInteger const MAX_RETRY = 2;//meaning three tries in total
static NSInteger const DELAY_PER_RETRY = NSEC_PER_SEC;//in ns translates to 1s currently
static NSString * const FORBIDDED_ERROR_CODE = @"403";

+ (instancetype)serverHandler {
    static BlitzServerHandler *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[BlitzServerHandler alloc] init];
    });
    return sharedInstace;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        requestRetry = [[BlitzKWConcurrentDictionary alloc] init];

        INTERNET_ERROR_CODES = @[@ - 1, @1, @2, @100, @101, @ - 1001, @ - 1003, @ - 1004, @ - 1005, @ - 1006, @ - 1009, @-1011, @ - 1018, @ - 1020];

        SERVER_ERROR_CODES = @[@121, @122, @123, @124, @300, @301, @303, @307, @308, @309, @310, @311, @ - 999, @ - 1002, @ - 1010, @ - 1011, @ - 1013, @ - 1015, @ - 1016, @ - 1017, @ - 1021, @ - 1201, @ - 1202, @ - 1203, @ - 1204, @ - 1205, @ - 1206];

        BAD_REQUEST_ERROR_CODES = @[@ - 1011];

        RECOVERABLE_ERROR_CODES = @[@110, @111, @112, @113, @120, @302, @304, @305, @306, @ - 998, @ - 999, @ - 1007, @ - 1008, @ - 1012, @ - 1014, @ - 1019, @ - 1200];
    }
    return self;
}

- (NSString *)getUniqueRequestId {
    return @"";
//    UserModel *userModel = [UserService.sharedInstance retrieveUser];
//    NSInteger currentTime = [[NSDate date] timeIntervalSince1970];
//    if (userModel) {
//        return [[@(userModel.userId)stringValue] stringByAppendingString:[@(currentTime)stringValue]];
//    }
//    return [@(currentTime)stringValue];
}

- (void)serverCall:(BlitzRequestBuilder *)requestBuilder withCompletionBlock:(void(^)(NSObject *, NSError *))completionBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *requestId = [self getUniqueRequestId];
        [requestBuilder setRequestId:requestId];
        [requestRetry setObject:[NSNumber numberWithInteger:0] forKey:requestId];
        [BlitzHttpExecutor executeRequest:requestBuilder listener:self];
        requestBuilder.responseBlock = ^(NSObject *data, NSError *error) {
            completionBlock(data,error);
        };
    });
}
//- (void)serverCall:(RequestBuilder *)requestBuilder {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *requestId = [self getUniqueRequestId];
//        [requestBuilder setRequestId:requestId];
//        [requestRetry setObject:[NSNumber numberWithInteger:0] forKey:requestId];
//        [HttpExecutor executeRequest:requestBuilder listener:self];
//    });
//}

- (void)onHttpResponse:(id)response forRequestBuilder:(BlitzRequestBuilder *)request error:(NSError *)err withStatusCode:(NSInteger)statusCode {
    BOOL isDownTime = statusCode == KIWI_DOWN_TIME_STATUS_CODE;
    [self onHttpResponse:response forRequestBuilder:request error:err withAlertVisibility:!isDownTime];
    if (isDownTime) {
//        NSString *url = [[AppParamModel getSharedInstance] getDownTimeUrl];
//        if (response && [response isKindOfClass:NSDictionary.class]) {
//            NSDictionary *responseDict = (NSDictionary *)response;
//            NSObject *htmlView = [responseDict valueForKey:@"html_view"];
//            if (htmlView && [htmlView isKindOfClass:NSString.class]) {
//                url = (NSString *)htmlView;
//            }
//        }
       // [[AppManager sharedInstance] showDownTimeUX:url];//
    }
    else {
//[[AppManager sharedInstance] hideDownTimeUX];
    }
}

- (void)onHttpResponse:(id)response forRequestBuilder:(BlitzRequestBuilder *)request error:(NSError *)err withAlertVisibility:(BOOL)visiblityFlag {
    NSString *reqId = request.requestId;

    if (request.reqType == APP_REQUEST|| request.reqType == PARALLEL_REQUEST) {
        NSLog(@"Got response for APP_REQUEST -- %@, %@  - Error= %@", request.baseUrl, request.path, err);
    }

    if (err) {
        NSString *httpResponseCode;
        if (response != nil && [response isKindOfClass:[NSDictionary class]]){
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
            httpResponseCode = FORBIDDED_ERROR_CODE;
        }
        if (request.reqType == APP_REQUEST) {
            NSLog(@"Got error from APP_REQUEST -- %@, %@", request.baseUrl, request.path);
        }

        NSNumber *errorCode = [NSNumber numberWithInteger:[err code]];

        if (pendingRequests == nil) {
            pendingRequests = [[NSMutableArray alloc] init];
        }
        /*error codes is one of temporary error code or no-internet case*/
        if ([self arrayContains:RECOVERABLE_ERROR_CODES num:errorCode]) {
            /*first try few times to handle temp errors -- can be done using error codes too*/
            NSInteger retry = [[requestRetry objectForKey:reqId] integerValue];
            if (retry < MAX_RETRY) {
                retry++;

                [requestRetry setObject:[NSNumber numberWithInteger:retry] forKey:reqId];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, DELAY_PER_RETRY), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0ul), ^{
                    NSLog(@"will retry again, retry count being %li", (long)retry);
                    [BlitzHttpExecutor executeRequest:request listener:self];
                    [self sendFailueOrRetryEvent:request error:err isRetry:YES];
                    //                    [weakSelf submitRequest:request forAction:[request actionName]];
                });
                return;
            }

            /*after max retry add to pending requests and reset retry count*/
            [requestRetry setObject:[NSNumber numberWithInteger:0] forKey:reqId];
        }
        
        if (request.reqType != BI_REQUEST && request.reqType != LOG_REQUEST) {
            [self sendFailueOrRetryEvent:request error:err isRetry:NO];
        }

        // If the request is a BI REQUEST, we have done enough retries and processing, return here
        // No need to add to pendingrequests, ignoring this request is the best case we can do
        if ((/*([request.baseUrl hasPrefix: serverConfig.BASE_URL] || request.isShowForbiddenError) &&*/ httpResponseCode != nil && ([httpResponseCode isEqualToString: @"401"] || [httpResponseCode isEqualToString: @"451"] || [httpResponseCode isEqualToString:FORBIDDED_ERROR_CODE])) || (request.reqType != BI_REQUEST && request.reqType != LOG_REQUEST && request.reqType != ERROR_FREE_REQUEST && request.reqType != PARALLEL_ERROR_FREE_REQUEST && request.reqType != MINI_GAME_REQUEST && request.reqType != FACE_SWAP_REQUEST)) {

            /*show connection error dialog*/
            
            BOOL shouldAddToPendingRequest = NO;
            if (response==nil || ![response isKindOfClass:[NSDictionary class]]) {
                shouldAddToPendingRequest = [self callShowAlert:err forRequest:request forResponseCode: httpResponseCode withResponse:nil withAlertVisibility:visiblityFlag];
            } else {
                shouldAddToPendingRequest = [self callShowAlert:err forRequest:request forResponseCode: httpResponseCode withResponse:response withAlertVisibility:visiblityFlag];
            }

            if (shouldAddToPendingRequest) {
                @synchronized(self) {
                    [pendingRequests addObject:request];
                }
            }
        }
        // This is done to pass HTTP response to caller
        NSInteger erroCode = err.code;
        if (httpResponseCode.length > 0) {
            erroCode = [httpResponseCode integerValue];
            err = [NSError errorWithDomain:@"HTTPResponse" code:erroCode userInfo:err.userInfo];
        }
    }

    if (request.responseBlock != nil) {
        request.responseBlock(response, err);
    }

    /* the success of failure call back will on the same thread. Any main thread specifics should be handled in the listener itself */
    if (request.responseListener != nil) {
        if (err != nil) {
            if (response != nil) {
                NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:err.userInfo];
                dict[API_RESPONSE] = response;
                NSError *responseError = [NSError errorWithDomain:err.domain code:err.code userInfo:dict];
                err = responseError;
            }
            [request.responseListener failure:err extraInfo:request.extraInfo];
        }
        else {
            if ([((id)(request.responseListener)) respondsToSelector:@selector(success:withRequestTime:)]) {
                [((id)(request.responseListener)) success:response withRequestTime:request.requestTotalTime];
            }
            else {
                [request.responseListener success:response];
            }
        }
    }

    if (request.reqType == BI_REQUEST || request.reqType == LOG_REQUEST || request.reqType == ERROR_FREE_REQUEST || request.reqType == PARALLEL_ERROR_FREE_REQUEST) {
        return;
    }

    if (err == nil && [requestRetry objectForKey:reqId]) {
        [requestRetry removeObjectForKey:reqId];
    }

    if (err == nil && request.pendingRequest == YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:SERVER_CALL_SENT_NOTIFICATION object:nil];
    }
}

/*show connection error dialog*/
- (BOOL)callShowAlert:(NSError *)err forRequest:(BlitzRequestBuilder *)request forResponseCode:(NSString *) responseCode withResponse:(NSDictionary*) response withAlertVisibility:(BOOL)showAlert {
//    NSNumber *errorCode = [NSNumber numberWithInteger:[err code]];
//    ErrorHandler *errorHandler = [[ErrorHandler alloc] init];
//    if (request.reqType == USER_PROFILE_REQUEST) {
//        //400 error code, user name taken
//        if ([self arrayContains:BAD_REQUEST_ERROR_CODES num:errorCode]) {
//            return NO;
//        }
//    }
//
//    if ([responseCode isEqualToString:@"401"]) {
//        if (showAlert) {
//            [errorHandler showErrorAlert:ErrorTypeAuth withError:err withResponse:response];
//        }
//        return NO;
//    }
//    if ([responseCode isEqualToString:@"451"]) {
//        if (showAlert) {
//          //  [ErrorHandler.sharedInstance showErrorAlert:ErrorTypeUnavailable withError:err withResponse:response];
//        }
//        return NO;
//    }
//    else if ([responseCode isEqualToString:FORBIDDED_ERROR_CODE]) {
//        if (showAlert) {
//          //  [ErrorHandler.sharedInstance showErrorAlert:ErrorTypeForbidded withError:err withResponse:response];
//        }
//        return NO;
//    } else if ([responseCode isEqualToString:@"412"]) {
//        if (showAlert) {
//            if (response != nil) {
//                NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:err.userInfo];
//                userInfo[API_RESPONSE] = response;
//                NSError *error = [NSError errorWithDomain:err.domain code:err.code userInfo:userInfo];
//                err = error;
//            }
//          //  [ErrorHandler.sharedInstance showErrorAlert:ErrorTypeMultipleUsersLogin withError:err];
//        }
//    }
//    else if (showAlert) {
//        if ([self arrayContains:INTERNET_ERROR_CODES num:errorCode]) {
//            [errorHandler showErrorAlert:ErrorTypeInternet withError:err withResponse:response];
//        }
//        else if ([self arrayContains:RECOVERABLE_ERROR_CODES num:errorCode]) {
//            [errorHandler showErrorAlert:ErrorTypeServerTimeout withError:err withResponse:response];
//        }
//        else {
//           // [ErrorHandler.sharedInstance showErrorAlert:ErrorTypeServer withError:err withResponse:response];
//        }
//    }
    return YES;
}

- (void)retryPendingCalls {
    @synchronized(self) {
        for (BlitzRequestBuilder *req in pendingRequests) {
            [req setPendingRequest:YES];
            [BlitzHttpExecutor executeRequest:req listener:self];
        }
        [pendingRequests removeAllObjects];
    }
}

- (BOOL)arrayContains:(NSArray *)arr num:(NSNumber *)num {
    return [arr containsObject:num];
}

- (void)sendFailueOrRetryEvent:(BlitzRequestBuilder *)requestBuilder error:(NSError *)error isRetry:(BOOL)isRetry {
    
    if (requestBuilder.reqType == BI_REQUEST || requestBuilder.reqType == LOG_REQUEST) {
        return;
    }

    NSString *errorStr = [[error.localizedDescription stringByAppendingString:@", code: "] stringByAppendingString:[@(error.code)stringValue]];

//    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
//    [userInfo setValue:isRetry ? @"Retry" : @"Failure" forKey:SERVER_REQUEST_FAILURE_TYPE];
//    [userInfo setValue:requestBuilder.requestId forKey:SERVER_REQUEST_ID];
//    [userInfo setValue:[requestBuilder.baseUrl stringByAppendingString:requestBuilder.path] forKey:SERVER_REQUEST_PATH];
//    [userInfo setValue:errorStr forKey:SERVER_REQUEST_ERROR];
//    NSInteger requestTotalTime = round(requestBuilder.requestTotalTime);
//    [userInfo setValue:[NSString stringWithFormat:@"%ld", (long)requestTotalTime] forKey:SERVER_REQUEST_TIME];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//    //    [NSNotificationHelper sendNotification:NOTIFICATION_SERVER_RETRY_FAILUE withUserInfo:userInfo withObject:nil];
//    });
}

@end
