//
//  HttpResponseListener.h
//  ArVideoDemo
//
//  Created by Mitesh on 20/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#ifndef HttpResponseListener_h
#define HttpResponseListener_h

@class RequestBuilder;

@protocol HttpResponseListener<NSObject>

- (void)onHttpResponse:(id)response forRequestBuilder:(RequestBuilder *)request error:(NSError *)err withStatusCode:(NSInteger)statusCode;

@end

#endif /* HttpResponseListener_h */
