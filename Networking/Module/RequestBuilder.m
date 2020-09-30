//
//  BaseRouter.m
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//


#import "RequestBuilder.h"
#import "StringConstant.h"
#import "CommonConstant.h"
#import "UserDefaultsUtil.h"
#import "StringUtils.h"
#import "KiwiParser.h"

@implementation RequestBuilder

//Will Add up these details
static NSString *const KIWI2_P_D1_C1 = @"0wab";
static NSString *const KIWI2_P_D2_C1 = @"4K";
static NSString *const K2_PARSER_D1_C2= @"sPKA";
static NSString *const K2_PARSER_D2_C2= @"Fj";
static NSString *const K2_P_DETAILS1_C3= @"7cS9";
static NSString *const K2_P_DETAILS2_C3= @"No";
static NSString *const K2_P_D1_CHUNK4= @"2Bs4";
static NSString *const K2_P_D2_CHUNK4= @"X8";

- (NSString *)getMethod {
    if (self.method) {
        return self.method;
    }
    NSException *e = [NSException
                      exceptionWithName:@"UndefinedHttpMethodException"
                                 reason:@"*** Http method not defined"
                               userInfo:nil];
    @throw e;
}

- (NSString *)getPath {
    if (self.path) {
        return self.path;
    }
    NSException *e = [NSException
                      exceptionWithName:@"UndefinedHttpPathException"
                                 reason:@"*** Http path not defined"
                               userInfo:nil];
    @throw e;
}

- (RequestType)getReqType {
    if (self.reqType) {
        return self.reqType;
    }
    return APP_REQUEST;
}

- (NSMutableDictionary *)getParameters {
    if (self.parameters) {
        return self.parameters;
    }
    NSException *e = [NSException
                      exceptionWithName:@"UndefinedHttpParameterException"
                                 reason:@"*** Http params not defined"
                               userInfo:nil];
    @throw e;
}

- (NSMutableDictionary *)getHeaders {
    if (self.headers) {
        return self.headers;
    }
    return nil;
}

- (NSString *)getBaseUrl {
//    if (self.baseUrl == nil) {
//        self.baseUrl = serverConfig.BASE_URL;
//    }
//    if (ERROR_FREE_REQUEST == self.reqType || PARALLEL_ERROR_FREE_REQUEST == self.reqType) {
//        self.baseUrl = [self.baseUrl stringByReplacingOccurrencesOfString:serverConfig.BASE_URL
//                                                               withString:serverConfig.ERROR_FREE_REQUEST_BASE_URL];
//    }
//    if (SECONDARY_APP_REQUEST == self.reqType) {
//        self.baseUrl = [self.baseUrl stringByReplacingOccurrencesOfString:serverConfig.BASE_URL
//                                                               withString:serverConfig.SECONDARY_APP_REQUEST_BASE_URL];
//    }
//    if (MINI_GAME_REQUEST == self.reqType) {
//        self.baseUrl = [self.baseUrl stringByReplacingOccurrencesOfString:serverConfig.BASE_URL
//                                                               withString:serverConfig.MINI_GAME_BASE_URL];
//    }
//    if (FACE_SWAP_REQUEST == self.reqType) {
//        self.baseUrl = [self.baseUrl stringByReplacingOccurrencesOfString:serverConfig.BASE_URL
//        withString:serverConfig.FACE_SWAP_BASE_URL];
//    }
    return self.baseUrl;
}

- (NSData *)getHttpBody {
    if (_httpBody) {
        return _httpBody;
    }
    NSString *str = @"{}";
    NSData *data = [NSData dataWithBytes:str.UTF8String length:str.length];
    return data;
}

- (NSString *)getContentType {
    if (_contentType) {
        return _contentType;
    }
    return @"application/json";
}

- (NSString *)getUrlParam {
    NSString *urlParamString = @"";
    if (self.parameters && (int)[self.getParameters count] != 0) {
        for (id key in self.getParameters) {
            urlParamString = [urlParamString stringByAppendingFormat:@"&%@=%@", key, self.getParameters[key]];
        }
        urlParamString = [urlParamString stringByRemovingPercentEncoding];
    }
    return urlParamString;
}

- (NSMutableURLRequest *)generateRequest {
    NSString *urlPath = self.getBaseUrl;
    urlPath = [urlPath stringByAppendingString:self.getPath];

    if (self.parameters && (int)[self.getParameters count] != 0) {
        urlPath = [urlPath stringByAppendingFormat:@"?%@", [self.getUrlParam stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]]];
    }

    NSURL *url = [NSURL URLWithString:urlPath];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [request setHTTPMethod:self.getMethod];
    
    [request setAllHTTPHeaderFields:[self getHeaders]];

    if ([self.getContentType isEqual:@"multipart/form-data"]) {
        NSString *boundary = [self generateBoundaryString];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[self createBodyWithBoundary:boundary]];
    }
    else if (![self.getMethod isEqual:@"GET"]) {
        NSData *httpBodyToSet = [self getHttpBody];
        NSString *contentType = [self getContentType];
        if (_shouldEncryptRequestBody) {
            NSString *str = [[NSString alloc] initWithData:httpBodyToSet encoding:NSUTF8StringEncoding];
            NSData *wrappedBody = [KiwiParser wrap:str withDetailsOne:[self detailsOne] andDetailsTwo:[self detailsTwo]];
            if (wrappedBody) {
                str = [wrappedBody base64EncodedStringWithOptions:0];
                httpBodyToSet = [str dataUsingEncoding:NSUTF8StringEncoding];
                [request addValue:@"enabled" forHTTPHeaderField:@"Kiwi-Decryption"];
                contentType = @"text/plain";
            }
        }
        [request setHTTPBody:httpBodyToSet];
        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    }

//    NSString *sessionId = [[BiEventManager biEventManager] getPreviousSessionId].stringValue;
//    [request setValue:sessionId forHTTPHeaderField:@"kiwiSessionIdForBi"];

   // NSString *appVersion = [DeviceUtils getAppVersion];
   // [request setValue:appVersion forHTTPHeaderField:@"appVersion"];

   // NSString *kiwiDeviceId = [DeviceUtils getKiwiDeviceId];
   // [request setValue:kiwiDeviceId forHTTPHeaderField:@"kiwiDeviceId"];

//    [AppTime initialize];
//    NSString *serverEpochTime = [NSString stringWithFormat:@"%lld", [appTime getEpochTimeOnServerAtStart]];
//    [request setValue:serverEpochTime forHTTPHeaderField:@"serverEpochTime"];
    

//    UserModel *uModel = [[UserService sharedInstance] retrieveUser];
//    NSInteger userId = -1;
//    if (uModel) {
//        userId = uModel.userId;
//    }
    [request setValue:[NSString stringWithFormat:@"%ld", 1] forHTTPHeaderField:USER_ID];
    
    BOOL isAdminModeDisabled = [[UserDefaultsUtil sharedInstance] boolForKey:IS_ADMIN_MODE_DISABLED];
    NSString *isAdminMode = isAdminModeDisabled?@"true":@"false";
    [request setValue:isAdminMode forHTTPHeaderField:IS_ADMIN_MODE_DISABLED];
    
//    NSString *userLangGroup = [[AppManager sharedInstance].languageManager getUserSelectedLanguageGroupOrAssignDefault];
//    [request setValue:userLangGroup forHTTPHeaderField:@"countryGroup"];

    if ([self isWhitelisted:urlPath]
        || [urlPath containsString:LOCAL_IP_PREFIX] || [urlPath containsString:LOCAL_IP_PREFIX2]) {
        NSString *jwtToken = [[UserDefaultsUtil sharedInstance] stringForKey:JWT];
        if (jwtToken.length > 0) {
            [request setValue:jwtToken forHTTPHeaderField:AUTH_TOKEN_V2];
        }
        NSString *authToken = [self getAuthHeaderForUserId:1];
        if (authToken) {
            [request setValue:authToken forHTTPHeaderField:AUTH_TOKEN];
        } else {
            NSString *log = [NSString stringWithFormat:@"AuthDebug:: Empty token for user %ld for url %@", 1, urlPath];
          //  [Utility sendLogToBI:log];
        }
    } else {
        NSString *log = [NSString stringWithFormat:@"AuthDebug:: %@ not in kiwi domain for user %ld", urlPath, 1];
       // [Utility sendLogToBI:log];
    }

//    [request setValue:[DeviceUtils getPlatformCode] forHTTPHeaderField:PLATFORM_CODE];
    
//    [request setValue:[[AppManager sharedInstance].languageManager getUserSelectedLanguageGroupOrAssignDefault] forHTTPHeaderField:COUNTRY_GROUP];

    return request;
}

- (BOOL)isWhitelisted:(NSString *)url {
    NSArray<NSString *> *whiteListedDomains = @[KIWI_DOMAIN, RUMMY_DOMAIN];
    
    for (NSString *domain in whiteListedDomains) {
        if ([url rangeOfString:domain].location != NSNotFound)
            return YES;
    }
    return NO;
}

- (NSString *)getAuthHeaderForUserId:(NSInteger) userId {
    
    long long timeInMilliSeconds = (long long) [[NSDate date] timeIntervalSince1970] * 1000;

    NSString *idNonce = [NSString stringWithFormat:@"%ld|%@|%lld", userId, [[NSUUID UUID] UUIDString], timeInMilliSeconds];
    NSString *base64Nonce = [[idNonce dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];

    NSString * salt = [[UserDefaultsUtil sharedInstance] stringForKey:HASH_KEY];
    if(salt){
        NSString * base64Hash = [StringUtils MD5Base64String:[NSString stringWithFormat:@"%@|%@",idNonce, salt]];

        base64Hash = [base64Hash stringByReplacingOccurrencesOfString:@"/"
                                                               withString:@"_"];

        base64Hash = [base64Hash stringByReplacingOccurrencesOfString:@"+"
                                                               withString:@"-"];
        return [NSString stringWithFormat:@"%@.%@", base64Nonce, base64Hash];
    }
    return @"";
}

- (NSData *)createBodyWithBoundary:(NSString *)boundary {
    NSMutableData *httpBody = [NSMutableData data];

    // add params (all params are strings)
    NSDictionary *multipartParameters = self.multipartParameters;
    NSDictionary *multipartData = self.multipartData;

    [multipartParameters enumerateKeysAndObjectsUsingBlock:^(NSString *parameterKey, NSString *parameterValue, BOOL *stop) {
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", parameterKey] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"%@\r\n", parameterValue] dataUsingEncoding:NSUTF8StringEncoding]];
    }];

    // add image data

    [multipartData enumerateKeysAndObjectsUsingBlock:^(NSString *parameterKey, NSDictionary *parameterDict, BOOL *stop) {
        NSString *filename = parameterKey;
        NSString *fieldName = [parameterKey componentsSeparatedByString:@"."][0];
        NSData *data = [parameterDict valueForKey:@"data"];
        NSString *mimetype = [parameterDict valueForKey:@"mimeType"];

        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, filename] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", mimetype] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:data];
        [httpBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }];

    [httpBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    return httpBody;
}

- (NSString *)generateBoundaryString {
    return [NSString stringWithFormat:@"Boundary-%@", [[NSUUID UUID] UUIDString]];
}


//The following can vary with request to request, so adding them as class methods
- (NSString *)detailsOne {
    NSString *detail = KIWI_P_D1_C1;
    detail = [[detail stringByAppendingString:K_PARSER_D1_C2] stringByAppendingFormat:@"%@%@",K_P_DETAILS1_C3,K_P_D1_CHUNK4];
    detail = [[detail stringByAppendingFormat:@"%@",KIWI2_P_D1_C1] stringByAppendingString:K2_PARSER_D1_C2];
    detail = [[detail stringByAppendingString:K2_P_DETAILS1_C3] stringByAppendingString:K2_P_D1_CHUNK4];
    return detail;
}

- (NSString *)detailsTwo {
    NSString *detail = KIWI_P_D2_C1;
    detail = [[detail stringByAppendingString:K_PARSER_D2_C2] stringByAppendingFormat:@"%@%@",K_P_DETAILS2_C3,K_P_D2_CHUNK4];
    detail = [[detail stringByAppendingFormat:@"%@",KIWI2_P_D2_C1] stringByAppendingString:K2_PARSER_D2_C2];
    detail = [[detail stringByAppendingString:K2_P_DETAILS2_C3] stringByAppendingString:K2_P_D2_CHUNK4];
    return detail;
}

@end
