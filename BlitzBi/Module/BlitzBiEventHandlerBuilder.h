//
//  BlitzBiEventHandlerBuilder.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
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
