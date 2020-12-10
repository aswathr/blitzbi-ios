//
//  BlitzUserRequest.m
//  BlitzBi
//
//  Created by Admin on 09/11/20.
//

#import <BlitzUserRequest.h>
#import <BlitzDeviceUtils.h>

@implementation BlitzUserRequest
- (instancetype)init:(NSString*)appId
                    :(NSString*)deviceId
                    :(NSString*)userId {
    if (self = [super init]) {
        blitzAppId = appId;
        blitzDeviceId = deviceId;
        blitzUserId = userId;
        deviceType = BlitzDeviceUtils.getDeviceType;
    }
    return self;
}

- (NSMutableDictionary*)dictionary {
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
    [requestDict setValue:blitzAppId forKey:@"blitzAppId"];
    [requestDict setValue:blitzDeviceId forKey:@"blitzDeviceId"];
    [requestDict setValue:deviceType forKey:@"deviceType"];
    [requestDict setValue:blitzUserId forKey:@"blitzUserId"];
    return requestDict;
}
@end
