//
//  DeviceUtils.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//
#import "BlitzDeviceUtils.h"

#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AdSupport/ASIdentifierManager.h>
#import "BlitzConfig.h"
#import "BlitzUserDefaultsUtil.h"
#import "BlitzReachability.h"


#ifdef __IPHONE_11_0
#import <DeviceCheck/DeviceCheck.h>
#endif

static NSNumber *KIWI_DEVICE_ID_VAL = nil;

@implementation BlitzDeviceUtils

+ (NSString *)getIFV {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    else {
        return @"";
    }
}

+ (nullable NSString *)getIDFA {
    //    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled])
    //    {
    
    return [[NSUUID UUID] UUIDString];
//    NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
//
//    return [IDFA UUIDString];
    //    }
    //
    //    return nil;
}

+ (BOOL)isIDFAEnabled {
    return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
}

+ (NSString *)getDeviceNameUnderScored {
    NSString *deviceName = [self getDeviceModel];
    return [deviceName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
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

+ (NSString *)getAppVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)getAppId {
    NSString *appName = [[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] componentsSeparatedByString:@"."] firstObject];
    return appName;
}

+ (NSString *)getPlatformCode {
    return @"iOS";
}

+ (NSString *)getLocaleCode {
    return @"en";
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

+ (NSNumber *)getOSId {
    UIDevice *myDevice = [UIDevice currentDevice];
    NSString *deviceOSVersion = myDevice.systemVersion;
    NSString *undottedNumber = [deviceOSVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    // undottedNumber will now be '591'
    return [NSNumber numberWithInt:[[@"" stringByAppendingString:undottedNumber] intValue]];
}

//+ (void)EmptySandbox {
//    NSFileManager *fileMgr = [[NSFileManager alloc] init];
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSArray *files = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
//
//    while (files.count > 0) {
//        NSString *docsDir = [paths objectAtIndex:0];
//        NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:docsDir error:&error];
//        if (error == nil) {
//            for (NSString *path in directoryContents) {
//                NSString *fullPath = [docsDir stringByAppendingPathComponent:path];
//                BOOL removeSuccess = [fileMgr removeItemAtPath:fullPath error:&error];
//                files = [fileMgr contentsOfDirectoryAtPath:docsDir error:nil];
//                if (!removeSuccess) {
//                    // Error
//                }
//            }
//        }
//        else {
//            // Error
//        }
//    }
//}

+ (NSString *)getFormattedDetails {
    return [NSString stringWithFormat:@"App Version:%@ \nDevice Name:%@ \nCarrier Name:%@ \nConnection:%@ \nIDFA:%@ \nIFB:%@", [BlitzDeviceUtils getAppVersion], [BlitzDeviceUtils getDeviceModel], [BlitzDeviceUtils getCarrierName], [BlitzDeviceUtils getConnDetails], [BlitzDeviceUtils getIDFA], [BlitzDeviceUtils getIFV]];
}

+ (NSString *)getCountryCode {
    NSLocale *currentLocale = [NSLocale currentLocale];// get the current locale.
    return [currentLocale objectForKey:NSLocaleCountryCode];
}

+ (NSString *)getCurrentLanguage {
    return [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
}

+ (NSString *)getKiwiDeviceId {
    NSNumber *kiwiDeviceId = [BlitzDeviceUtils getKiwiDeviceIdAsNumber];
    if (kiwiDeviceId) {
        return [kiwiDeviceId stringValue];
    }
    return @"-1";
}

+ (NSNumber *)getKiwiDeviceIdAsNumber {
    
    if(KIWI_DEVICE_ID_VAL == nil) {
        NSNumber *kiwiDeviceId = [[BlitzUserDefaultsUtil sharedInstance] objectForKey:KIWI_DEVICE_ID_KEY];
        
        if ([kiwiDeviceId longLongValue] > 0) {
            KIWI_DEVICE_ID_VAL = kiwiDeviceId;
        } else {
            return nil;
        }
    }
    return KIWI_DEVICE_ID_VAL;
}

+ (void)setKiwiDeviceId:(NSNumber *)kiwiDeviceId {
    NSNumber *currentKiwiDeviceId = [BlitzDeviceUtils getKiwiDeviceIdAsNumber];
    if (kiwiDeviceId != nil && [currentKiwiDeviceId longLongValue] != [kiwiDeviceId longLongValue]) {
        KIWI_DEVICE_ID_VAL = [kiwiDeviceId copy];
        [[BlitzUserDefaultsUtil sharedInstance] setObject:KIWI_DEVICE_ID_VAL forKey:KIWI_DEVICE_ID_KEY];
   //     [ExceptionDataLogging setObjectValue:[KIWI_DEVICE_ID_VAL stringValue] forKey:KIWI_DEVICE_ID_KEY];
    }
}




////check for deviceCheckId, if not present, get and continue
//+ (void)continueDiffOnSettingDeviceCheckId:(dispatch_block_t)continueDiffCallBlock {
//#ifdef __IPHONE_11_0
//    BOOL isSimulator = NO;
//#if TARGET_IPHONE_SIMULATOR || TARGET_OS_SIMULATOR
//    isSimulator = YES;
//#endif
//    if (!(@available(iOS 11.0, *)) || isSimulator) {
//        if (continueDiffCallBlock) {
//            continueDiffCallBlock();
//        }
//    }
//    else {
//        if ([AppManager sharedInstance].deviceCheckId != nil) {
//            if (continueDiffCallBlock) {
//                continueDiffCallBlock();
//            }
//        }
//        else {
//            [DeviceUtils setDeviceCheckIdAndUpdateServer:NO withNewState:nil withContinueDiffBlock:continueDiffCallBlock];
//            return;
//        }
//    }
//#else
//    if (continueDiffCallBlock) {
//        continueDiffCallBlock();
//    }
//#endif
//}
//
//
//+ (void)setDeviceCheckIdAndUpdateServer:(BOOL)updateServer withNewState:(NSString *)newState withContinueDiffBlock:(dispatch_block_t)continueDiffCallBlock {
//#ifdef __IPHONE_11_0
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
//    if (@available(iOS 11.0, *)) {
//        [[DCDevice currentDevice] generateTokenWithCompletionHandler:^(NSData * _Nullable token, NSError * _Nullable error) {
//            if (error == nil) {
//                [AppManager sharedInstance].deviceCheckId = [token base64EncodedStringWithOptions:0];
//                if (updateServer) {
//                    [ServerCallApi updateDeviceCheckState:[AppManager sharedInstance].deviceCheckId newState:newState];
//                } else if (continueDiffCallBlock) {
//                    continueDiffCallBlock();
//                }
//            } else {
//                NSLog(@"DeviceUtils::setDeviceCheckIdAndUpdateServer:DeviceCheckId Generation failed with error: %@", error.description);
//                if (continueDiffCallBlock) {
//                    continueDiffCallBlock();
//                }
//            }
//        }];
//    }
//#endif
//#endif
//}

@end
