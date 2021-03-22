//
//  BlitzUserRequest.m
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import "BlitzUserRequest.h"
#import "BlitzDeviceUtils.h"

@implementation BlitzUserRequest
- (instancetype)init:(NSString*)blitzAppId
                    :(NSString*)blitzDeviceId
                    :(nullable NSString*)blitzUserId; {
    if (self = [super init]) {
        self->blitzAppId = blitzAppId;
        self->blitzDeviceId = blitzDeviceId;
        self->blitzUserId = blitzUserId;
        self->installAppVersion = BlitzDeviceUtils.getAppVersion;
        self->deviceType = BlitzDeviceUtils.getDeviceType;
    }
    return self;
}

- (NSMutableDictionary*)dictionary {
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
    [requestDict setValue:blitzAppId forKey:@"blitzAppId"];
    [requestDict setValue:blitzDeviceId forKey:@"blitzDeviceId"];
    [requestDict setValue:deviceType forKey:@"deviceType"];
    [requestDict setValue:blitzUserId forKey:@"blitzUserId"];
    [requestDict setValue:installAppVersion forKey:@"installAppVersion"];
    return requestDict;
}
@end
