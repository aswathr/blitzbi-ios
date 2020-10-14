//
//  PBlitzDataTransferService.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzServerConfig.h>
#import <BlitzServerHandler.h>

@protocol PBlitzDataTransferService <NSObject>
- (void) executeServerCallWithNoCallBack:(BlitzRequestBuilder *)requestBuilder;
- (void) executeServerCall:(BlitzRequestBuilder *)requestBuilder withCompletion:(void(^)(NSObject *, NSError *))completion;
@end
