//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzDeviceRequest.h>
#import <BlitzDeviceUtils.h>

@implementation BlitzDeviceRequest

- (instancetype)init:(NSString*)appId
                    :(NSString*)deviceId
                    :(NSString*)specificDeviceId {
    if (self = [super init]) {
        blitzAppId = appId;
        blitzDeviceId = deviceId;
        appSpecificDeviceId = specificDeviceId;
        installAppVersion = BlitzDeviceUtils.getAppVersion;
        deviceType = BlitzDeviceUtils.getDeviceType;
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
    return requestDict;
}
@end
