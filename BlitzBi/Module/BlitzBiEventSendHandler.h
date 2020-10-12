//
//  BlitzBiEventSendHandler.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import "IBlitzBIEventRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBiEventSendHandler : NSObject
- (void)sendEvents:(NSArray *)events;
- (void)sendEvent:(NSDictionary *)eventDict;
- (void)setBlitzdeviceId:(int*)appId withDeviceId: (NSString*) deviceId;
@end

NS_ASSUME_NONNULL_END
