//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BiDeviceRequest.h>

@implementation BiDeviceRequest
- (instancetype)initWithAppId:(NSNumber*)appId
                             :(NSString*)deviceId {
    if (self = [super init]) {
        blitzAppId = appId;
        blitzDeviceId = deviceId;
        installAppVersion = @"1.0.0";
        deviceType = @"IOS";
    }
    return self;
}
@end
