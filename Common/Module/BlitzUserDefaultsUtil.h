//
//  UserDefaultsUtil.h
//  ArVideoDemo
//
//  Created by Anshul on 28/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzUserPropertyModel.h>
#import <BlitzServerUserPropertiesFetchedListener.h>


typedef void (^ServerUserPropertiesCompletionBlock)(NSArray<UserPropertyModel> *userProerties);

@interface BlitzUserDefaultsUtil : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (NSData *)dataForKey:(NSString *)defaultName;
- (id)objectForKey:(NSString *)defaultName;
- (NSString *)stringForKey:(NSString *)defaultName;
- (NSInteger)integerForKey:(NSString *)defaultName;
- (BOOL)boolForKey:(NSString *)defaultName;
- (double)doubleForKey:(NSString *)defaultName;
- (NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName;
- (id)valueForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)defaultName;

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
- (void)setInteger:(NSInteger)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer;
- (void)setObject:(id)value forKey:(NSString *)defaultName;
- (void)setDouble:(double)value forKey:(NSString *)defaultName;
- (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setValue:(id)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer;
- (void)appendValue:(NSString *)value forKey:(NSString *)key;
- (void)appendValue:(NSString *)value forKey:(NSString *)key sendToServer:(BOOL)sendToServer;

- (id)valueForCommonKey:(NSString *)key;
- (void)setValue:(id)value forCommonKey:(NSString *)key;

- (void)removeObjectForKey:(NSString *)key;
- (void)clearAllKeys;
- (void)synchronize;
- (NSString *)updateKey:(NSString *)key;

- (void)registerServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener;
- (void)deregisterServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener;
- (void)updateFromServerUserProperties;

@end
