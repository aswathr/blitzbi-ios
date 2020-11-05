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
    return nil;
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
            @"i386" : @"iPhone Simulator",
            @"x86_64" : @"iPhone Simulator",
            
            @"iPhone1,1" : @"iPhone",
            @"iPhone1,2" : @"iPhone 3G",
            @"iPhone2,1" : @"iPhone 3GS",
            @"iPhone3,1" : @"iPhone 4",
            @"iPhone3,2" : @"iPhone 4 GSM Rev A",
            @"iPhone3,3" : @"iPhone 4 CDMA",
            @"iPhone4,1" : @"iPhone 4S",
            @"iPhone5,1" : @"iPhone 5 (GSM)",
            @"iPhone5,2" : @"iPhone 5 (GSM+CDMA)",
            @"iPhone5,3" : @"iPhone 5C (GSM)",
            @"iPhone5,4" : @"iPhone 5C (Global)",
            @"iPhone6,1" : @"iPhone 5S (GSM)",
            @"iPhone6,2" : @"iPhone 5S (Global)",
            @"iPhone7,1" : @"iPhone 6 Plus",
            @"iPhone7,2" : @"iPhone 6",
            @"iPhone8,1" : @"iPhone 6s",
            @"iPhone8,2" : @"iPhone 6s Plus",
            @"iPhone8,4" : @"iPhone SE (GSM)",
            @"iPhone9,1" : @"iPhone 7",
            @"iPhone9,2" : @"iPhone 7 Plus",
            @"iPhone9,3" : @"iPhone 7",
            @"iPhone9,4" : @"iPhone 7 Plus",
            @"iPhone10,1" : @"iPhone 8",
            @"iPhone10,2" : @"iPhone 8 Plus",
            @"iPhone10,3" : @"iPhone X Global",
            @"iPhone10,4" : @"iPhone 8",
            @"iPhone10,5" : @"iPhone 8 Plus",
            @"iPhone10,6" : @"iPhone X GSM",
            @"iPhone11,2" : @"iPhone XS",
            @"iPhone11,4" : @"iPhone XS Max",
            @"iPhone11,6" : @"iPhone XS Max Global",
            @"iPhone11,8" : @"iPhone XR",
            @"iPhone12,1" : @"iPhone 11",
            @"iPhone12,3" : @"iPhone 11 Pro",
            @"iPhone12,5" : @"iPhone 11 Pro Max",
            @"iPhone12,8" : @"iPhone SE 2nd Gen",
            @"iPhone13,1" : @"iPhone 12 Mini",
            @"iPhone13,2" : @"iPhone 12",
            @"iPhone13,3" : @"iPhone 12 Pro",
            @"iPhone13,4" : @"iPhone 12 Pro Max",
            
            @"iPod1,1" : @"1st Gen iPod",
            @"iPod2,1" : @"2nd Gen iPod",
            @"iPod3,1" : @"3rd Gen iPod",
            @"iPod4,1" : @"4th Gen iPod",
            @"iPod5,1" : @"5th Gen iPod",
            @"iPod7,1" : @"6th Gen iPod",
            @"iPod9,1" : @"7th Gen iPod",
            
            @"iPad1,1" : @"iPad",
            @"iPad1,2" : @"iPad 3G",
            @"iPad2,1" : @"2nd Gen iPad",
            @"iPad2,2" : @"2nd Gen iPad GSM",
            @"iPad2,3" : @"2nd Gen iPad CDMA",
            @"iPad2,4" : @"2nd Gen iPad New Revision",
            @"iPad3,1" : @"3rd Gen iPad",
            @"iPad3,2" : @"3rd Gen iPad CDMA",
            @"iPad3,3" : @"3rd Gen iPad GSM",
            @"iPad2,5" : @"iPad mini",
            @"iPad2,6" : @"iPad mini GSM+LTE",
            @"iPad2,7" : @"iPad mini CDMA+LTE",
            @"iPad3,4" : @"4th Gen iPad",
            @"iPad3,5" : @"4th Gen iPad GSM+LTE",
            @"iPad3,6" : @"4th Gen iPad CDMA+LTE",
            @"iPad4,1" : @"iPad Air (WiFi)",
            @"iPad4,2" : @"iPad Air (GSM+CDMA)",
            @"iPad4,3" : @"1st Gen iPad Air (China)",
            @"iPad4,4" : @"iPad mini Retina (WiFi)",
            @"iPad4,5" : @"iPad mini Retina (GSM+CDMA)",
            @"iPad4,6" : @"iPad mini Retina (China)",
            @"iPad4,7" : @"iPad mini 3 (WiFi)",
            @"iPad4,8 ": @"iPad mini 3 (GSM+CDMA)",
            @"iPad4,9" : @"iPad Mini 3 (China)",
            @"iPad5,1" : @"iPad mini 4 (WiFi)",
            @"iPad5,2" : @"4th Gen iPad mini (WiFi+Cellular)",
            @"iPad5,3" : @"iPad Air 2 (WiFi)",
            @"iPad5,4" : @"iPad Air 2 (Cellular)",
            @"iPad6,3" : @"iPad Pro (9.7 inch, WiFi)",
            @"iPad6,4" : @"iPad Pro (9.7 inch, WiFi+LTE)",
            @"iPad6,7" : @"iPad Pro (12.9 inch, WiFi)",
            @"iPad6,8" : @"iPad Pro (12.9 inch, WiFi+LTE)",
            @"iPad6,11" : @"iPad (2017)",
            @"iPad6,12" : @"iPad (2017)",
            @"iPad7,1" : @"iPad Pro 2nd Gen (WiFi)",
            @"iPad7,2" : @"iPad Pro 2nd Gen (WiFi+Cellular)",
            @"iPad7,3" : @"iPad Pro 10.5-inch",
            @"iPad7,4" : @"iPad Pro 10.5-inch",
            @"iPad7,5" : @"iPad 6th Gen (WiFi)",
            @"iPad7,6" : @"iPad 6th Gen (WiFi+Cellular)",
            @"iPad7,11" : @"iPad 7th Gen 10.2-inch (WiFi)",
            @"iPad7,12" : @"iPad 7th Gen 10.2-inch (WiFi+Cellular)",
            @"iPad8,1" : @"iPad Pro 11 inch 3rd Gen (WiFi)",
            @"iPad8,2" : @"iPad Pro 11 inch 3rd Gen (1TB, WiFi)",
            @"iPad8,3" : @"iPad Pro 11 inch 3rd Gen (WiFi+Cellular)",
            @"iPad8,4" : @"iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)",
            @"iPad8,5" : @"iPad Pro 12.9 inch 3rd Gen (WiFi)",
            @"iPad8,6" : @"iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)",
            @"iPad8,7" : @"iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)",
            @"iPad8,8" : @"iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)",
            @"iPad8,9" : @"iPad Pro 11 inch 4th Gen (WiFi)",
            @"iPad8,10" : @"iPad Pro 11 inch 4th Gen (WiFi+Cellular)",
            @"iPad8,11" : @"iPad Pro 12.9 inch 4th Gen (WiFi)",
            @"iPad8,12" : @"iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)",
            @"iPad11,1" : @"iPad mini 5th Gen (WiFi)",
            @"iPad11,2" : @"iPad mini 5th Gen",
            @"iPad11,3" : @"iPad Air 3rd Gen (WiFi)",
            @"iPad11,4" : @"iPad Air 3rd Gen",
            @"iPad11,6" : @"iPad 8th Gen (WiFi)",
            @"iPad11,7" : @"iPad 8th Gen (WiFi+Cellular)",
            @"iPad13,1" : @"iPad air 4th Gen (WiFi)",
            @"iPad13,2" : @"iPad air 4th Gen (WiFi+Celular)",
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
