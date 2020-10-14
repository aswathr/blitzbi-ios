//
//  BlitzBiEventHandlerBuilder.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PBlitzDataTransferService.h>
#import <BlitzBiEventSendHandler.h>
#import <BlitzFileHelper.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventHandlerBuilder : NSObject {
    NSNumber* batchSize;
    NSString* baseUrl;
    NSString* appId;
    NSString* appToken;
    id <PBlitzDataTransferService> networkService;
}

- (void)setParams:(NSNumber*)batchSize
          withUrl:(NSString*)baseUrl
        withAppId:(NSString*) appId
     withAppToken:(NSString*) appToken
      withService:(id <PBlitzDataTransferService>) networkService;
- (BlitzBiEventSendHandler*) build;
@end

NS_ASSUME_NONNULL_END
