//
//  BlitzBiEventHandlerBuilder.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzBiEventHandlerBuilder.h"
#import "BlitzBiEventSendHandler.h"
#import "BlitzFileHelper.h"
#import "BlitzBiEventRepository.h"

@implementation BlitzBiEventHandlerBuilder
- (void)setParams:(NSNumber*)batchSize
          withUrl: (NSString*)baseUrl
        withAppId:(NSString*)appId
     withAppToken:(NSString*) appToken
      withService:(id <PBlitzDataTransferService>) networkService
   withAdTracking:(BOOL)adTracking {
    self->batchSize = batchSize;
    self->baseUrl = baseUrl;
    self->appId = appId;
    self->appToken = appToken;
    self->networkService = networkService;
    self->adTracking = adTracking;
}

- (BlitzBiEventSendHandler*) build {
    return [[BlitzBiEventSendHandler alloc] init:batchSize :baseUrl :[[BlitzBiEventRepository alloc]init:appId :appToken :networkService] :adTracking];
}
@end
