//
//  BiDeviceResponse.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BiDeviceResponse.h"

@implementation BiDeviceResponse
- (instancetype)initWithAppId:(NSString *) blitzDeviceId {
    if (self = [super init]) {
        _blitzDeviceId = blitzDeviceId;
        _installAppVersion = @"1.0.0";
        _currentAppVersion = @"1.0.0";
        _deviceType = @"IOS";
    }
    return self;
}
@end
