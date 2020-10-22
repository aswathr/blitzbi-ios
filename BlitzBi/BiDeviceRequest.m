//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BiDeviceRequest.h>
#import <BlitzDeviceUtils.h>

@implementation BiDeviceRequest
- (instancetype)init:(NSString*)appId
                    :(NSString*)deviceId
                    :(NSString*)appSpecificDeviceId {
    if (self = [super init]) {
        blitzAppId = appId;
        blitzDeviceId = deviceId;
        appSpecificDeviceId = appSpecificDeviceId;
        installAppVersion = BlitzDeviceUtils.getAppVersion;
        deviceType = @"IOS";
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
