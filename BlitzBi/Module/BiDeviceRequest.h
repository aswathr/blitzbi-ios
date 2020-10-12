//
//  BiDeviceRequest.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiDeviceRequest : NSObject
@property int* blitzAppId;
@property (strong) NSString* blitzDeviceId;
@property (strong) NSString* installAppVersion;
@property (strong) NSString* deviceType;
@end

NS_ASSUME_NONNULL_END
