//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BiDeviceRequest.h"

@implementation BiDeviceRequest
- (instancetype)initWithAppId:(NSNumber*) appId withDeviceId:(NSString*)deviceId {
    if (self = [super init]) {
        self.blitzAppId = appId;
        self.blitzDeviceId = deviceId;
        self.installAppVersion = @"1.0.0";
        self.deviceType = @"IOS";
    }
    return self;
}
@end
