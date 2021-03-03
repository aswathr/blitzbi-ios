//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzDeviceRequest.h"
#import "BlitzDeviceUtils.h"

@implementation BlitzDeviceRequest

- (instancetype)init:(NSString*)blitzAppId
                    :(NSString*)blitzDeviceId
                    :(nullable NSString*)appSpecificDeviceId
                    :(nullable NSString*)deviceId {
    if (self = [super init]) {
        self->blitzAppId = blitzAppId;
        self->blitzDeviceId = blitzDeviceId;
        self->appSpecificDeviceId = appSpecificDeviceId;
        self->installAppVersion = BlitzDeviceUtils.getAppVersion;
        self->deviceType = BlitzDeviceUtils.getDeviceType;
        self->deviceId = deviceId;
    }
    return self;
}

- (NSMutableDictionary*)dictionary {
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
    [requestDict setValue:blitzAppId forKey:@"blitzAppId"];
    [requestDict setValue:blitzDeviceId forKey:@"blitzDeviceId"];
    [requestDict setValue:installAppVersion forKey:@"installAppVersion"];
    [requestDict setValue:deviceType forKey:@"deviceType"];
    [requestDict setValue:appSpecificDeviceId forKey:@"appSpecificDeviceId"];
    [requestDict setValue:deviceId forKey:@"deviceId"];
    return requestDict;
}
@end
