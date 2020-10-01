//
//  UserDefaultsUtil.m
//  ArVideoDemo
//
//  Created by Anshul on 28/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzUserDefaultsUtil.h"
#import "BlitzCommonConstant.h"
#import "BlitzConfig.h"
//#import "Utility.h"
#import "BlitzServerUserPropertiesUtil.h"
//#import "User.h"
#import "BlitzUserPropertyModel.h"
#import "BlitzServerUserPropertiesFetchedListener.h"
//#import "BI-Swift.h"

@interface BlitzUserDefaultsUtil () {
    NSUserDefaults *standardUserDefaults;
    BlitzServerUserPropertiesUtil *serverUserPropertiesUtil;
}
@end

@implementation BlitzUserDefaultsUtil

+ (id)sharedInstance {
    static BlitzUserDefaultsUtil *sharedUserDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserDefaults = [[self alloc] init];
    });
    return sharedUserDefaults;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        standardUserDefaults = [NSUserDefaults standardUserDefaults];
        serverUserPropertiesUtil = [[BlitzServerUserPropertiesUtil alloc] init];
    }
    return self;
}

- (NSString *)updateKey:(NSString *)key {
//    EnvType envType = config.ENVIRONMENT;
//
//    //Do not change key for prod env
//    //Backward compatibility
//    if (EnvTypeProd2 == config.ENVIRONMENT || EnvTypeStage == config.ENVIRONMENT) {
//        return key;
//    }
//    else if ([@[DIFF_DEVICE_ENV] containsObject:key]) {
//        return key;
//    }
//    else {
//        NSString *updatedKey = [NSString stringWithFormat:@"%ld-%@", (long)envType, key];
//        return updatedKey;
//    }
    return @"";
}

- (NSString *)commonKey:(NSString *)key {
    NSString *commonKey = [NSString stringWithFormat:@"%@-%@", @"common", key];
    return commonKey;
}

- (NSString *)stringForKey:(NSString *)defaultName {
    return [standardUserDefaults stringForKey:[self updateKey:defaultName]];
}

- (NSInteger)integerForKey:(NSString *)defaultName {
    return [standardUserDefaults integerForKey:[self updateKey:defaultName]];
}

- (NSData *)dataForKey:(NSString *)defaultName {
    return [standardUserDefaults dataForKey:[self updateKey:defaultName]];
}

- (id)objectForKey:(NSString *)defaultName {
    return [standardUserDefaults objectForKey:[self updateKey:defaultName]];
}

- (BOOL)boolForKey:(NSString *)defaultName {
    return [standardUserDefaults boolForKey:[self updateKey:defaultName]];
}

- (double)doubleForKey:(NSString *)defaultName {
    return [standardUserDefaults doubleForKey:[self updateKey:defaultName]];
}

- (NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName {
    return [standardUserDefaults stringArrayForKey:[self updateKey:defaultName]];
}

- (id)valueForKey:(NSString *)key {
    return [standardUserDefaults valueForKey:[self updateKey:key]];
}

- (NSDictionary *)dictionaryForKey:(NSString *)defaultName {
    return [standardUserDefaults dictionaryForKey:[self updateKey:defaultName]];
}

- (void)setObject:(id)value forKey:(NSString *)defaultName {
    [standardUserDefaults setObject:value forKey:[self updateKey:defaultName]];
    [standardUserDefaults synchronize];
}

- (void)setValue:(id)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer {
    NSString *originalValue;
    if (sendToServer) {
        originalValue = [self valueForKey:key];
    }
    [standardUserDefaults setValue:value forKey:[self updateKey:key]];
    [standardUserDefaults synchronize];
    if (sendToServer) {
        if ([value isKindOfClass:NSString.class] && ![(NSString *)value isEqualToString:originalValue]) {
            [serverUserPropertiesUtil saveUserPropertyOnServerWithKey:key andValue:(NSString *)value];
        }
    }
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [self setValue:value forKey:key sendToServer:NO];
}

- (void)appendValue:(NSString *)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer {
    NSString *originalValue = [self stringForKey:key];
    NSString *finalValue;
    if([originalValue length] == 0) {
        finalValue = value;
    } else {
        finalValue = [NSString stringWithFormat:@"%@%@%@", originalValue, USER_DEFAULTS_APPENDER, value];
    }

    [standardUserDefaults setValue:finalValue forKey:[self updateKey:key]];
    [standardUserDefaults synchronize];
    if (sendToServer) {
        [serverUserPropertiesUtil saveUserPropertyOnServerWithKey:key andValue:finalValue];
    }
}

- (void)appendValue:(NSString *)value forKey:(NSString *)key {
    [self appendValue:value forKey:key sendToServer:NO];
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName {
    [standardUserDefaults setInteger:value forKey:[self updateKey:defaultName]];
}

- (void)setDouble:(double)value forKey:(NSString *)defaultName {
    [standardUserDefaults setDouble:value forKey:[self updateKey:defaultName]];
}

- (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [standardUserDefaults setBool:value forKey:[self updateKey:defaultName]];
}

- (id)valueForCommonKey:(NSString *)key {
    return [standardUserDefaults valueForKey:[self commonKey:key]];
}

- (void)setValue:(id)value forCommonKey:(NSString *)key {
    [standardUserDefaults setValue:value forKey:[self commonKey:key]];
}

- (void)removeObjectForKey:(NSString *)key {
    [standardUserDefaults removeObjectForKey:[self updateKey:key]];
}

- (void)synchronize {
    [standardUserDefaults synchronize];
}

- (void)clearAllKeys {
    NSString *log = @"AuthDebug:: cleared all keys";
   // [Utility sendLogToBI:log];
    NSDictionary *dict = [standardUserDefaults dictionaryRepresentation];
    for (id key in dict) {
        [standardUserDefaults removeObjectForKey:key];
    }
    [standardUserDefaults synchronize];
}
- (void)registerServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener {
    [serverUserPropertiesUtil registerServerUserPropertiesFetchedListener:listener];
}
- (void)deregisterServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener {
    [serverUserPropertiesUtil deregisterServerUserPropertiesFetchedListener:listener];
}

- (void)updateFromServerUserProperties {
    [serverUserPropertiesUtil getServerUserProperties:^(NSArray<UserPropertyModel> *userProperties) {
        if (userProperties != nil) {
            for (BlitzUserPropertyModel *userProperty in userProperties) {
                [self setValue:userProperty.propertyValue forKey:userProperty.propertyKey];
            }
        }
    }];
}


- (void)setInteger:(NSInteger)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer {
    NSString *originalValue;
    NSString *integerWithString = [NSString stringWithFormat:@"%i", value];
    if (sendToServer) {
        originalValue = [self valueForKey:key];
    }
    [standardUserDefaults setValue:integerWithString forKey:[self updateKey:key]];
    [standardUserDefaults synchronize];
    if (sendToServer) {
        if ([integerWithString isKindOfClass:NSString.class] && ![(NSString *)integerWithString isEqualToString:originalValue]) {
            [serverUserPropertiesUtil saveUserPropertyOnServerWithKey:key andValue:(NSString *)integerWithString];
        }
    }
}

@end
