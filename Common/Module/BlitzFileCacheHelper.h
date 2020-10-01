//
//  FileCacheHelper.h
//  ArVideoDemo
//
//  Created by Mitesh  on 13/06/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzFileCacheHelper : NSObject

+ (instancetype)sharedInstance;
- (BOOL)saveCacheFromServerData:(NSString *)data withCacheKey:(NSString *)cacheKey;
- (NSString *)getCachedData:(NSString *)cacheKey;
- (void)clearCacheForKey:(NSString *)cacheKey;
- (BOOL)saveCacheFromObject:(NSObject *)data withCacheKey:(NSString *)cacheKey;
- (NSObject *)getCachedObject:(NSString *)cachedKey;

@end
