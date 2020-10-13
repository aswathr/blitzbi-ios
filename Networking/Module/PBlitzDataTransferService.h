//
//  PBlitzDataTransferService.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

//#import "PBlitzServerConfig.h"
#import <BlitzServerConfig.h>
#import <BlitzServerHandler.h>

@protocol PBlitzDataTransferService <NSObject>
- (void) executeServerCallWithNoCallBack:(BlitzRequestBuilder *)requestBuilder;
- (void) executeServerCall:(BlitzRequestBuilder *)requestBuilder withCompletion:(void(^)(NSObject *, NSError *))completion;
@end
