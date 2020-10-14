//
//  BlitzFileCacheHelper.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzFileCacheHelper.h>
#import <BlitzConstants.h>
#import <BlitzFileHelper.h>

@implementation BlitzFileCacheHelper

+ (instancetype)sharedInstance {
    static BlitzFileCacheHelper *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [BlitzFileCacheHelper new];
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
                cachedContent = nil;
            }
        }
    }
    return cachedContent;
}

- (void)clearCacheForKey:(NSString *)cacheKey {
    [BlitzFileHelper deleteFileWithPath:[self getCacheFilePath:cacheKey]];
}

- (NSString *)getCacheFilePath:(NSString *)cacheKey {
    NSString *fileName = [NSString stringWithFormat:@"%@%@",CACHE_PREFIX_MACRO, cacheKey];
    NSString *fPath = [BlitzFileHelper fullFilePathInDocumentsDirectoryForFileName:fileName];
    return fPath;
}

@end
