//
//  BiDeviceResponse.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiDeviceResponse : NSObject
@property (strong) NSString* blitzDeviceId;
@property (strong) NSString* deviceType;
@property (strong) NSString* installAppVersion;
@property (strong) NSString* currentAppVersion;
@end

NS_ASSUME_NONNULL_END
