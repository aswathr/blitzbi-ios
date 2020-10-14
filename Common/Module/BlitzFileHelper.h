//
//  BlitzFileHelper.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzFileHelper : NSObject

typedef NS_ENUM(NSInteger, GifResolution) {
    GifResolutionLow,
    GifResolutionNormal,
    GifResolutionHigh
};

+ (void)deleteFilesMatching:(NSRegularExpression *)regex inPath:(NSString *)path;
+ (void)deleteFilesInDirectory:(NSString *)fullDirectoryPath;
+ (void)clearAppDirectoriesOnFreshInstall;
+ (void)deleteFile:(NSURL *)fileURL;
+ (void)deleteFileWithPath:(NSString *)filePath;
+ (NSURL *)fullFileURLInDocumentsDirectoryForFileName:(NSString *)fileName;
+ (NSString *)fullFilePathInCacheDirectoryForFileName:(NSString *)fileName;
+ (NSString *)fullFilePathInDocumentsDirectoryForFileName:(NSString *)fileName;
+ (NSString *)fullFilePathInBundleForFileName:(NSString *)fileName;

+ (BOOL)fileExistsInBundle:(NSString *)fileName;
+ (BOOL)fileExistsInDocumentsDirectory:(NSString *)fileName;
+ (BOOL)fileExistsInCacheDirectory:(NSString *)fileName;

+ (BOOL)fileExistsAtPath:(NSString *)fullFilePath;
+ (NSDate *)lastModifiedTimeForFileAtPath:(NSString *)fullFilePath;
+ (NSNumber *)sizeForFileAtPath:(NSString *)fullFilePath;
+ (NSURL *)fullFileUrlInCacheDirectoryForFileName:(NSString *)fileName;

+ (NSArray<NSString *> *)listFilesInDocumentsDirectory;
+ (NSArray<NSString *> *)listFilesInCacheDirectory;
+ (NSArray<NSString *> *)listFilesInDirectoryWithPath:(NSString *)fullPath;

+ (NSString *)publicDocumentsDirectoryPath;
+ (NSString *)publicLibraryDirectoryPath;
+ (NSString *)applicationCacheDirectoryPath;

+ (void)deleteCacheDirectoryNamed:(NSString *)dirName;
+ (void)createCacheDirectoryNamed:(NSString *)dirName;
+ (void)moveFileFromPath:(NSString *)sourcePath toPath:(NSString *)destinationPath;
+ (void)copyFileFromPath:(NSString *)sourcePath toPath:(NSString *)destinationPath;
+ (BOOL)deleteLocalCacheFileWithName:(NSString *)filename;
+ (NSString *)replaceSpaceWithUnderscore:(NSString *)stringToEdit;

+ (void)writeDictionaryToFile:(NSDictionary *)dictionary fileName:(NSString *)fileName;
+ (NSDictionary *)readDictionaryFromFile:(NSString *)fileName;

+ (NSString *)getUserGifPath;
+ (NSString *)getUserGifPathForResolution:(GifResolution)resolution;
+ (NSString *)getUserVideoPath;

+ (NSURL *)getHeadShotGifPath;
+ (NSURL *)getTriviaGifPath;
+ (NSURL *)getPopTriviaGifPath;

+ (NSURL *)getDirectoryURLFor:(NSSearchPathDirectory)directory andShouldCreateIfNot:(BOOL)shouldCreate;
@end
