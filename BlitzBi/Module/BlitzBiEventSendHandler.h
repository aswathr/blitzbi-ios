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
    BlitzBIEventRepository *eventRepository;

    long long currentTimestamp;
}
- (instancetype)init:(NSNumber*)batchSize
                    :(NSString*)baseUrl
                    :(BlitzBIEventRepository*)eventRepository;
- (void)setBlitzdeviceId:(NSNumber*)appId
                        :(NSString*)deviceId;
- (void)sendEvents:(NSArray*)events;
- (void)sendEvent:(NSDictionary*)eventDict;
@end

NS_ASSUME_NONNULL_END
