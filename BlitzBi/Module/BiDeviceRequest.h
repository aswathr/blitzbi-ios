//
//  BiDeviceRequest.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiDeviceRequest : NSObject {
    NSString* blitzAppId;
    NSString* blitzDeviceId;
    NSString* appSpecificDeviceId;
    NSString* installAppVersion;
    NSString* deviceType;
}

- (instancetype)init:(NSString*)appId
                    :(NSString*)deviceId
                    :(NSString*)appSpecificDeviceId;
- (NSMutableDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
