//
//  BlitzUserRequest.h
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzUserRequest : NSObject {
    NSString* blitzAppId;
    NSString* blitzDeviceId;
    NSString* blitzUserId;
    NSString* deviceType;
}

- (instancetype)init:(NSString*)appId
                    :(NSString*)deviceId
                    :(nullable NSString*)userId;
- (NSMutableDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
