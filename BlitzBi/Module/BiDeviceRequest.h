//
//  BiDeviceRequest.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiDeviceRequest : NSObject {
    NSNumber* blitzAppId;
    NSString* blitzDeviceId;
    NSString* installAppVersion;
    NSString* deviceType;
}

- (instancetype)initWithAppId:(NSNumber*)appId
                             :(NSString*)deviceId;
@end

NS_ASSUME_NONNULL_END
