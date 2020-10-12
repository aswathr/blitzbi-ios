//
//  BlitzBiService.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import "BaseUrls.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiService : NSObject
@property BaseUrls* baseUrls;
@property id <PBlitzDataTransferService> biNetworkService;
@property id <PBlitzBiEventSendHandler> biBuilder;
@property (strong) NSString* baseUrl;

- (void)setUp:(Int*)appId withAppToken:(NSString*)appToken;
- (void)sendEvents:(NSArray *)events;
- (void)sendEvent:(NSDictionary *)eventDict;
@end

NS_ASSUME_NONNULL_END
