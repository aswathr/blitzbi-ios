//
//  BlitzBiEventRepository.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>
#import <BlitzRequestBuilder.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventRepository : NSObject {
    NSString* appId;
    NSString* appToken;
    id <PBlitzDataTransferService> networkService;
}

- (instancetype)init:(NSString*)appId
                    :(NSString*)appToken
                    :(id <PBlitzDataTransferService>)networkService;
- (void)processJsonRequest:(NSString*)url
                          :(NSData*)data
                          :(void(^)(NSObject *, NSError *))completion;
- (void)processJsonRequestWithoutResponse:(NSString*)url
                                         :(NSData*)data
                                         :(BOOL)isEmergency;
@end

NS_ASSUME_NONNULL_END
