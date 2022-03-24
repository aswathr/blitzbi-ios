//
//  BlitzHttpResponseListener.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#ifndef HttpResponseListener_h
#define HttpResponseListener_h

@class BlitzRequestBuilder;

@protocol BlitzHttpResponseListener<NSObject>
- (void)onHttpResponse:(id)response forRequestBuilder:(BlitzRequestBuilder *)request error:(NSError *)err withStatusCode:(NSInteger)statusCode;
@end

#endif
