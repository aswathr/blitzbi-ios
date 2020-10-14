//
//  BlitzFileCacheHelper.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
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
