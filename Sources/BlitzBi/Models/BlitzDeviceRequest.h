//
//  BiDeviceRequest.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzDeviceRequest : NSObject {
    NSString* blitzAppId;
    NSString* blitzDeviceId;
    NSString* appSpecificDeviceId;
    NSString* installAppVersion;
    NSString* deviceType;
    NSString* deviceId;
}

- (instancetype)init:(NSString*)blitzAppId
                    :(NSString*)blitzDeviceId
                    :(nullable NSString*)appSpecificDeviceId
                    :(nullable NSString*)deviceId;
- (NSMutableDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
