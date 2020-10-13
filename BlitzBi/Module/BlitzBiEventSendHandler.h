//
//  BlitzBiEventSendHandler.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <BlitzBIEventRepository.h>
#import <BlitzRequestBuilder.h>
#import <BlitzBiConstants.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventSendHandler : NSObject
- (instancetype)init:(NSNumber*) batchSize withBaseUrl:(NSString*) baseUrl withEventRepository:(BlitzBIEventRepository*)eventRepository;
- (void)setBlitzdeviceId:(NSNumber*)appId withDeviceId:(NSString*)deviceId;

- (void)sendEvents:(NSArray *)events;
- (void)sendEvent:(NSDictionary *)eventDict;
@end

NS_ASSUME_NONNULL_END
