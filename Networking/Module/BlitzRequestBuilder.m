//
//  BaseRouter.m
//  ArVideoDemo
//
//  Created by Mitesh on 24/10/16.
//  Copyright © 2016 Twilio, Inc. All rights reserved.
//

#import "BlitzRequestBuilder.h"
#import "BlitzStringConstant.h"
#import "BlitzCommonConstant.h"
#import "BlitzStringUtils.h"
#import "BlitzParser.h"

@implementation BlitzRequestBuilder

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

    if (![self.getMethod isEqual:@"GET"]) {
        NSData *httpBodyToSet = [self getHttpBody];
        NSString *contentType = [self getContentType];
        if (_shouldEncryptRequestBody) {
            NSString *str = [[NSString alloc] initWithData:httpBodyToSet encoding:NSUTF8StringEncoding];
            NSData *wrappedBody = [BlitzParser wrap:str withDetailsOne:[self detailsOne] andDetailsTwo:[self detailsTwo]];
            if (wrappedBody) {
                str = [wrappedBody base64EncodedStringWithOptions:0];
                httpBodyToSet = [str dataUsingEncoding:NSUTF8StringEncoding];
                [request addValue:@"enabled" forHTTPHeaderField:@"Blitz-Decryption"];
                contentType = @"text/plain";
            }
        }
        [request setHTTPBody:httpBodyToSet];
        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    }

    [request setValue:[NSString stringWithFormat:@"%ld", 1] forHTTPHeaderField:USER_ID];
    return request;
}

- (BOOL)isWhitelisted:(NSString *)url {
    NSArray<NSString *> *whiteListedDomains = @[];
    
    for (NSString *domain in whiteListedDomains) {
        if ([url rangeOfString:domain].location != NSNotFound)
            return YES;
    }
    return NO;
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
    NSString *detail = BLITZ_P_D1_C1;
    detail = [[detail stringByAppendingString:K_PARSER_D1_C2] stringByAppendingFormat:@"%@%@",K_P_DETAILS1_C3,K_P_D1_CHUNK4];
    detail = [[detail stringByAppendingFormat:@"%@",KIWI2_P_D1_C1] stringByAppendingString:K2_PARSER_D1_C2];
    detail = [[detail stringByAppendingString:K2_P_DETAILS1_C3] stringByAppendingString:K2_P_D1_CHUNK4];
    return detail;
}

- (NSString *)detailsTwo {
    NSString *detail = BLITZ_P_D2_C1;
    detail = [[detail stringByAppendingString:K_PARSER_D2_C2] stringByAppendingFormat:@"%@%@",K_P_DETAILS2_C3,K_P_D2_CHUNK4];
    detail = [[detail stringByAppendingFormat:@"%@",KIWI2_P_D2_C1] stringByAppendingString:K2_PARSER_D2_C2];
    detail = [[detail stringByAppendingString:K2_P_DETAILS2_C3] stringByAppendingString:K2_P_D2_CHUNK4];
    return detail;
}

@end
