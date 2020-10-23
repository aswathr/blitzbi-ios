//
//  BlitzBiEventSendHandler.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
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
    BOOL adTracking;
    
    NSString *blitzDeviceId;
    NSString *blitzAppId;
    NSString *blitzSessionId;
    
    BlitzBiConfig *biConfig;
    BlitzBiEventRepository *eventRepository;
    
    long long sessionStartTimeStamp;
}
- (instancetype)init:(NSNumber*)batchSize
                    :(NSString*)baseUrl
                    :(BlitzBiEventRepository*)eventRepository
                    :(BOOL)adTracking;
- (void)setBlitzdeviceId:(NSString*)appId
                        :(NSString*)deviceId;
- (void)sendEvents:(NSArray*)events;
- (void)sendEvent:(NSDictionary*)eventDict;
@end

NS_ASSUME_NONNULL_END
