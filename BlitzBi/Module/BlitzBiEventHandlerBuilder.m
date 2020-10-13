//
//  BlitzBIEventHandlerBuilder.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BlitzBiEventHandlerBuilder.h>

@implementation BlitzBiEventHandlerBuilder
- (void)setParams:(NSNumber*)batchSize
            withUrl: (NSString*)baseUrl
            withAppId:(NSNumber*)appId
            withAppToken:(NSString*) appToken
            withService:(id <PBlitzDataTransferService>) networkService {
    self->batchSize = batchSize;
    self->baseUrl = baseUrl;
    self->appId = appId;
    self->appToken = appToken;
    self->networkService = networkService;
}

- (BlitzBiEventSendHandler*) build {
    return [[BlitzBiEventSendHandler alloc] init:batchSize :baseUrl :networkService];;
}
@end
