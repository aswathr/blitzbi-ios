//
//  BiDeviceRequest.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BiDeviceRequest.h"

@implementation BiDeviceRequest
- (instancetype)initWithAppId:(int*) blitzAppId withDeviceId:(NSString*)blitzDeviceId {
    if (self = [super init]) {
        _blitzAppId = blitzAppId;
        _blitzDeviceId = blitzDeviceId;
        _installAppVersion = @"1.0.0";
        _deviceType = @"IOS";
    }
    return self;
}
@end
