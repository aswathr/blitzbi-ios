//
//  BlitzBiEventSendHandler.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <BlitzBiEventRepository.h>
#import <BlitzRequestBuilder.h>
#import <BlitzConstants.h>
#import <BlitzBiConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventSendHandler : NSObject {
    dispatch_queue_t serialQueue;
    dispatch_queue_t networkQueue;
    NSMutableArray<NSDictionary *> *pendingEvents;
    NSTimer *biEventFireTimer;

    NSTimeInterval nextFlushTime;

    BOOL isBlockSubmittedToNetworkQueue;
    BOOL isAppIdValidated;

    NSString *blitzDeviceId;
    NSString *blitzAppId;
    NSString *blitzSessionId;

    BlitzBiConfig *biConfig;
    BlitzBiEventRepository *eventRepository;

    long long currentTimestamp;
}
- (instancetype)init:(NSNumber*)batchSize
                    :(NSString*)baseUrl
                    :(BlitzBiEventRepository*)eventRepository;
- (void)setBlitzdeviceId:(NSString*)appId
                        :(NSString*)deviceId;
- (void)sendEvents:(NSArray*)events;
- (void)sendEvent:(NSDictionary*)eventDict;
@end

NS_ASSUME_NONNULL_END
