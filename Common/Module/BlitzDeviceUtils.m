//
//  BlitzDeviceUtils.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzDeviceUtils.h>

#import <BlitzReachability.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <BlitzConstants.h>

#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AdSupport/ASIdentifierManager.h>

#ifdef __IPHONE_11_0
#import <DeviceCheck/DeviceCheck.h>
#endif

@interface BlitzDeviceUtils()
+ (NSString*)DarwinVersion;
+ (NSString*)CFNetworkVersion;
+ (NSString*)deviceVersion;
+ (NSString*)deviceName;
+ (NSString*)appNameAndVersion;
@end

@implementation BlitzDeviceUtils

+ (NSString *)getPlatformCode {
    return @"iOS";
}

+ (NSString *)getSessionId {
    return [[NSUUID UUID] UUIDString];;
}

+ (NSString *)getBlitzDeviceId {
    NSString *blitzDeviceId = [[NSUserDefaults standardUserDefaults] stringForKey: BLITZ_DEVICE_ID_KEY];
    if (blitzDeviceId) {
        return blitzDeviceId;
    }
    return @"-1";
}

+ (void)setBlitzDeviceId:(NSString *) deviceId {
    [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:BLITZ_DEVICE_ID_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getAppVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)getTimeZone {
    NSTimeZone* timeZone = [NSTimeZone localTimeZone];
    NSString* timeZoneName = [timeZone localizedName:NSTimeZoneNameStyleStandard locale:[NSLocale currentLocale]];
    return timeZoneName;
}

+ (nullable NSString *)getIDFA {
    NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    return [IDFA UUIDString];
}

+ (NSString *)getIFV {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    else {
        return @"";
    }
}

+ (NSNumber *)getOSId {
    UIDevice *myDevice = [UIDevice currentDevice];
    NSString *deviceOSVersion = myDevice.systemVersion;
    NSString *undottedNumber = [deviceOSVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    return [NSNumber numberWithInt:[[@"" stringByAppendingString:undottedNumber] intValue]];
}

+ (NSString *)getConnDetails {
    BlitzReachability *reachability = [BlitzReachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];

    if (internetStatus == ReachableViaWiFi) {
        return @"wifi";
    }
    else if (internetStatus == NotReachable) {
        return @"no_internet";
    }
    else if (internetStatus == ReachableViaWWAN) {
        CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
        NSString *connDetails = netinfo.currentRadioAccessTechnology;
        //Reference - http://stackoverflow.com/questions/7938650/ios-detect-3g-or-wifi
        if (connDetails) {
            if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS]) {
                return @"2G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge]) {
                return @"2G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyWCDMA]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSDPA]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSUPA]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMA1x]) {
                return @"2G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyeHRPD]) {
                return @"3G";
            }
            else if ([netinfo.currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE]) {
                return @"4G";
            }
            return connDetails;
        }
        return @"Xg";
    }
    return @"unknown";
}

+ (NSString *)getManufacturer {
    return @"apple";
}

+ (NSString *)getDeviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine
                                        encoding:NSUTF8StringEncoding];
    static NSDictionary *deviceNamesByCode = nil;
    if (!deviceNamesByCode) {
        deviceNamesByCode = @{
            @"i386": @"32-Simulator",
            @"x86_64": @"64-Simulator",
            @"iPod1,1": @"iPod Touch",                   // (Original)
            @"iPod2,1": @"iPod Touch",                   // (Second Generation)
            @"iPod3,1": @"iPod Touch",                   // (Third Generation)
            @"iPod4,1": @"iPod Touch",                   // (Fourth Generation)
            @"iPhone1,1": @"iPhone",                   // (Original)
            @"iPhone1,2": @"iPhone",                   // (3G)
            @"iPhone2,1": @"iPhone",                   // (3GS)
            @"iPad1,1": @"iPad",                   // (Original)
            @"iPad2,1": @"iPad 2",                   //
            @"iPad3,1": @"iPad",                   // (3rd Generation)
            @"iPhone3,1": @"iPhone 4",                   // (GSM)
            @"iPhone3,3": @"iPhone 4",                   // (CDMA/Verizon/Sprint)
            @"iPhone4,1": @"iPhone 4s",                   //
            @"iPhone5,1": @"iPhone 5",                   // (model A1428, AT&T/Canada)
            @"iPhone5,2": @"iPhone 5",                   // (model A1429, everything else)
            @"iPad3,4": @"iPad",                   // (4th Generation)
            @"iPad2,5": @"iPad Mini",                   // (Original)
            @"iPhone5,3": @"iPhone 5c",                   // (model A1456, A1532 | GSM)
            @"iPhone5,4": @"iPhone 5c",                   // (model A1507, A1516, A1526 (China), A1529 | Global)
            @"iPhone6,1": @"iPhone 5s",                   // (model A1433, A1533 | GSM)
            @"iPhone6,2": @"iPhone 5s",                   // (model A1457, A1518, A1528 (China), A1530 | Global)
            @"iPhone7,1": @"iPhone 6 Plus",                   //
            @"iPhone7,2": @"iPhone 6",                   //
            @"iPhone8,1": @"iPhone 6s",
            @"iPhone8,2": @"iPhone 6s Plus",
            @"iPad4,1": @"iPad Air",                   // 5th Generation iPad (iPad Air) - Wifi
            @"iPad4,2": @"iPad Air",                   // 5th Generation iPad (iPad Air) - Cellular
            @"iPad4,4": @"iPad Mini",                   // (2nd Generation iPad Mini - Wifi)
            @"iPad4,5": @"iPad Mini",                   // (2nd Generation iPad Mini - Cellular)
            @"iPhone9,1": @"iPhone 7",
            @"iPhone9,2": @"iPhone 7 Plus",
            @"iPhone9,3": @"iPhone 7",
            @"iPhone9,4": @"iPhone 7 Plus",
            @"iPhone10,1": @"iPhone 8",
            @"iPhone10,2": @"iPhone 8 Plus",
            @"iPhone10,3": @"iPhone X",
            @"iPhone10,4": @"iPhone 8",
            @"iPhone10,5": @"iPhone 8 Plus",
            @"iPhone10,6": @"iPhone X"
            
        };
    }
    NSString *deviceName = [deviceNamesByCode objectForKey:code];
    if (!deviceName) {
        // Not found on database. At least guess main device type from string contents:
        if ([code rangeOfString:@"iPod"].location != NSNotFound) {
            deviceName = @"iPod Touch";
        }
        else if ([code rangeOfString:@"iPad"].location != NSNotFound) {
            deviceName = @"iPad";
        }
        else if ([code rangeOfString:@"iPhone"].location != NSNotFound) {
            deviceName = @"iPhone";
        }
        else {
            deviceName = code;
        }
    }
    return deviceName;
}

+ (NSString *)getCarrierName {
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];

    if (carrier != nil) {
        return [carrier carrierName] ? [carrier carrierName] : @"unknown";
    }
    else {
        return @"unknown";
    }
}

+ (NSString *)getAdTrackingEnabled {
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        return @"true";
    } else {
        return @"false";
    }
}

+ (NSString *)getAppTrackingEnabled {
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        return @"true";
    } else {
        return @"false";
    }
}

+ (NSString *)getUserAgent {
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@", [self appNameAndVersion], [self deviceName], [self deviceVersion], [self CFNetworkVersion], [self DarwinVersion]];
}

+ (NSString*)DarwinVersion {
    struct utsname u;
    (void) uname(&u);
    return [NSString stringWithFormat:@"Darwin/%@", [NSString stringWithUTF8String:u.release]];
}

+ (NSString*)CFNetworkVersion {
    return [NSString stringWithFormat:@"CFNetwork/%@", [NSBundle bundleWithIdentifier:@"com.apple.CFNetwork"].infoDictionary[@"CFBundleShortVersionString"]];
}

+ (NSString*)deviceVersion {
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    
    return [NSString stringWithFormat:@"%@/%@", systemName, systemVersion];
}

+ (NSString*)deviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithUTF8String:systemInfo.machine];
}

+ (NSString*)appNameAndVersion {
    NSString* appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString* appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@/%@", appName, appVersion];
}

+ (NSString *)getNotificationId {
    return @"";
}
@end
