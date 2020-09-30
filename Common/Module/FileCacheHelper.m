//
//  FileCacheHelper.m
//  ArVideoDemo
//
//  Created by Mitesh  on 13/06/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import "FileCacheHelper.h"
#import "CommonConstant.h"
#import "FileHelper.h"

@implementation FileCacheHelper

+ (instancetype)sharedInstance {
    static FileCacheHelper *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [FileCacheHelper new];
    });
    
    return _sharedResources;
}

- (BOOL)saveCacheFromServerData:(NSString *)data withCacheKey:(NSString *)cacheKey {
    NSError *error;
    NSString *fPath = [self getCacheFilePath:cacheKey];
    // Save content in file.
    [data writeToFile:fPath atomically:YES encoding:NSUTF8StringEncoding error:&error];

    if (error) {
        return NO;
    }
    return YES;
}

- (BOOL)saveCacheFromObject:(NSObject *)data withCacheKey:(NSString *)cacheKey {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:0 error:&error];
    if (error) {
        NSString *errorString = [error description];
   //     [Utility sendLogToBI:[NSString stringWithFormat:@"Cache save Content response invalid: %@", errorString]];
        return NO;
    }
    NSString *dataStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *fPath = [self getCacheFilePath:cacheKey];
    // Save content in file.
    [dataStr writeToFile:fPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        return NO;
    }
    return YES;
}

- (NSString *)getCachedData:(NSString *)cacheKey {
    NSError *error;
    NSString *fPath = [self getCacheFilePath:cacheKey];
    NSString *fileContents = [NSString stringWithContentsOfFile:fPath encoding:NSUTF8StringEncoding error:&error];
    if (!error && fileContents != nil) {
        return fileContents;
    }
    return nil;
}

- (NSObject *)getCachedObject:(NSString *)cachedKey {
    NSString *cachedString = [self getCachedData:cachedKey];
    NSObject *cachedContent = nil;
    if (cachedString) {
        NSError *error;
        NSData *jsonData = [cachedString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        if (jsonData) {
            cachedContent = (NSArray *)[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
            if (error) {
                NSString *errorString = [error description];
         //       [Utility sendLogToBI:[NSString stringWithFormat:@"Cache save Content parsing from cache failed: %@", errorString]];
                cachedContent = nil;
            }
        }
    }
    return cachedContent;
}

- (void)clearCacheForKey:(NSString *)cacheKey {
    [FileHelper deleteFileWithPath:[self getCacheFilePath:cacheKey]];
}

- (NSString *)getCacheFilePath:(NSString *)cacheKey {
    NSString *fileName = [NSString stringWithFormat:@"%@%@",CACHE_PREFIX_MACRO, cacheKey];
    NSString *fPath = [FileHelper fullFilePathInDocumentsDirectoryForFileName:fileName];
    return fPath;
}

@end
