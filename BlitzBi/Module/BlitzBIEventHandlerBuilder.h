//
//  BlitzBIEventHandlerBuilder.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import "PBlitzDataTransferService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBIEventHandlerBuilder : NSObject
@property (strong) int* batchSize;
@property (strong) NSString* baseUrl;
@property (strong) int* appId;
@property (strong) NSString* appToken;
@property (strong) PBlitzDataTransferService* networkService;
- (void)setParams:(Int*)batchSize
            withUrl: (NSString*)baseUrl
            withAppId:(Int*) appId
            withAppToken:(NSString*) appToken
            withService:(PBlitzDataTransferService*) networkService;
- (PBlitzBiEventSendHandler*) build;
@end

NS_ASSUME_NONNULL_END
