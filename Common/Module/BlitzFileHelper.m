//
//  BlitzFileHelper.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzFileHelper.h>

@implementation BlitzFileHelper

+ (NSString *)fullFilePathInCacheDirectoryForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    NSString *fullFilePath = [cachesDir stringByAppendingPathComponent:fileName];

    return fullFilePath;
}

+ (NSURL *)fullFileUrlInCacheDirectoryForFileName:(NSString *)fileName {
    NSURL *cacheDirectoryURL =  [[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSAllDomainsMask].firstObject;
    return [cacheDirectoryURL URLByAppendingPathComponent:fileName];
}

+ (NSString *)fullFilePathInDocumentsDirectoryForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    NSString *fullFilePath = [docsDir stringByAppendingPathComponent:fileName];

    return fullFilePath;
}

+ (NSURL *)fullFileURLInDocumentsDirectoryForFileName:(NSString *)fileName {
    NSURL *documentsDirectoryURL = [BlitzFileHelper getDirectoryURLFor:NSDocumentDirectory andShouldCreateIfNot:NO];
    return [documentsDirectoryURL URLByAppendingPathComponent:fileName];
}

+ (NSString *)fullFilePathInBundleForFileName:(NSString *)fileName {
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}

+ (BOOL)fileExistsAtPath:(NSString *)fullFilePath {
    return [[NSFileManager defaultManager] fileExistsAtPath:fullFilePath];
}

+ (BOOL)fileExistsInBundle:(NSString *)fileName {
    return [BlitzFileHelper fileExistsAtPath:[BlitzFileHelper fullFilePathInBundleForFileName:fileName]];
}

+ (BOOL)fileExistsInCacheDirectory:(NSString *)fileName {
    return [BlitzFileHelper fileExistsAtPath:[BlitzFileHelper fullFilePathInCacheDirectoryForFileName:fileName]];
}

+ (BOOL)fileExistsInDocumentsDirectory:(NSString *)fileName {
    return [BlitzFileHelper fileExistsAtPath:[BlitzFileHelper fullFilePathInDocumentsDirectoryForFileName:fileName]];
}

+ (NSDate *)lastModifiedTimeForFileAtPath:(NSString *)fullFilePath {
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:fullFilePath error:nil];
    if (attrs) {
        return (NSDate *)[attrs objectForKey:NSFileModificationDate];
    }
    return nil;
}

+ (NSNumber *)sizeForFileAtPath:(NSString *)fullFilePath {
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:fullFilePath error:nil];
    if (attrs) {
        return (NSNumber *)[attrs objectForKey:NSFileSize];
    }
    return nil;
}

+ (NSString *)applicationCacheDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)publicDocumentsDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)publicLibraryDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSArray<NSString *> *)listFilesInDirectoryWithPath:(NSString *)fullPath {
    NSError *error;
    NSArray<NSString *> *fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:fullPath error:&error];
    return fileList;
}

+ (NSArray<NSString *> *)listFilesInCacheDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *appCacheDir = [paths objectAtIndex:0];

    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:appCacheDir error:nil];
}

+ (NSArray<NSString *> *)listFilesInDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *publicDocumentsDir = [paths objectAtIndex:0];

    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:publicDocumentsDir error:nil];
}

+ (void)deleteCacheDirectoryNamed:(NSString *)dirName {
    [[NSFileManager defaultManager] removeItemAtPath:[[BlitzFileHelper applicationCacheDirectoryPath] stringByAppendingString:[@"/" stringByAppendingString:dirName]] error:nil];
}

+ (void)createCacheDirectoryNamed:(NSString *)dirName {
    [[NSFileManager defaultManager] createDirectoryAtPath:[[BlitzFileHelper applicationCacheDirectoryPath] stringByAppendingString:[@"/" stringByAppendingString:dirName]] withIntermediateDirectories:NO attributes:nil error:nil];
}

+ (void)moveFileFromPath:(NSString *)sourcePath toPath:(NSString *)destinationPath {
    [[NSFileManager defaultManager] moveItemAtPath:sourcePath toPath:destinationPath error:nil];
}

+ (void)copyFileFromPath:(NSString *)sourcePath toPath:(NSString *)destinationPath {
    [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:nil];
}

+ (BOOL)deleteLocalCacheFileWithName:(NSString *)filename {
    NSURL *fullPath = [BlitzFileHelper fullFileUrlInCacheDirectoryForFileName:filename];
    NSError *error;
    BOOL deleted = [[NSFileManager defaultManager] removeItemAtURL:fullPath error:&error];
    if (deleted && !error) {
        return YES;
    }
    //}
    return NO;
}

+ (NSString *)replaceSpaceWithUnderscore:(NSString *)stringToEdit {
    return [[stringToEdit stringByReplacingOccurrencesOfString:@" " withString:@"_"] lowercaseString];
}

+ (void)writeDictionaryToFile:(NSDictionary *)dictionary fileName:(NSString *)fileName {
    NSURL *url = [self fullFileURLInDocumentsDirectoryForFileName:fileName];
    [dictionary writeToFile:[url path] atomically:YES];
}

+ (NSDictionary *)readDictionaryFromFile:(NSString *)fileName {
    NSURL *url = [self fullFileURLInDocumentsDirectoryForFileName:fileName];
    return [NSDictionary dictionaryWithContentsOfFile:[url path]];
}

+ (void)deleteFile:(NSURL *)fileURL {
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[fileURL path] error:&error];
}

+ (void)deleteFileWithPath:(NSString *)filePath {
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
}

+ (NSString *)getUserGifPathForResolution:(GifResolution)resolution {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *tempPath;
    switch (resolution) {
        case GifResolutionLow: {
            tempPath = [documentsDirectory stringByAppendingFormat:@"/thumbnailprofile.gif"];
            break;
        }
        case GifResolutionNormal: {
            tempPath = [documentsDirectory stringByAppendingFormat:@"/profile.gif"];
            break;
        }
        case GifResolutionHigh: {
            tempPath = [documentsDirectory stringByAppendingFormat:@"/hrprofile.gif"];
            break;
        }
        default: {
            break;
        }
    }
    return tempPath;
}

+ (NSString *)getUserGifPath {
    return [self getUserGifPathForResolution:GifResolutionNormal];
}

+ (NSURL *)getHeadShotGifPath {
    return [[NSBundle mainBundle] URLForResource:@"headshot-anim" withExtension:@"gif"];
}

+ (NSURL *)getPopTriviaGifPath {
    return [[NSBundle mainBundle] URLForResource:@"popTriviaGif" withExtension:@"gif"];
}

+ (NSURL *)getTriviaGifPath {
    return [[NSBundle mainBundle] URLForResource:@"triviaGif" withExtension:@"gif"];
}

+ (NSString *)getUserVideoPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *tempPath = [documentsDirectory stringByAppendingFormat:@"/profile_video.mp4"];
    return tempPath;
}

+ (void)clearAppDirectoriesOnFreshInstall {
    NSString *documentsDirectoryPath = [BlitzFileHelper publicDocumentsDirectoryPath];
    NSString *libraryDirectoryPath = [BlitzFileHelper publicLibraryDirectoryPath];
    NSString *cacheDirectoryPath = [BlitzFileHelper applicationCacheDirectoryPath];

    [BlitzFileHelper deleteFilesInDirectory:documentsDirectoryPath];
    [BlitzFileHelper deleteFilesInDirectory:libraryDirectoryPath];
    [BlitzFileHelper deleteFilesInDirectory:cacheDirectoryPath];
}

+ (void)deleteFilesInDirectory:(NSString *)directoryPath {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;

    for (NSString *file in[fm contentsOfDirectoryAtPath:directoryPath error:&error]) {
        BOOL success = [fm removeItemAtPath:[NSString stringWithFormat:@"%@/%@", directoryPath, file] error:&error];
        if (!success || error) {
            // it failed.
        }
    }
}

+ (void)deleteFilesMatching:(NSRegularExpression *)regex inPath:(NSString *)path {
    NSDirectoryEnumerator *filesEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];

    NSString *file;
    NSError *error;
    while (file = [filesEnumerator nextObject]) {
        NSUInteger match = [regex numberOfMatchesInString:file
                                                  options:0
                                                    range:NSMakeRange(0, [file length])];

        if (match) {
            [[NSFileManager defaultManager] removeItemAtPath:[path stringByAppendingPathComponent:file] error:&error];
        }
    }
}

#pragma mark - Document Paths
+ (NSURL *)getDirectoryURLFor:(NSSearchPathDirectory)directory andShouldCreateIfNot:(BOOL)shouldCreate {
    static NSURL *documentsDirectoryURL;
    static dispatch_once_t onceInput;
    dispatch_once(&onceInput, ^{
        documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:directory inDomain:NSUserDomainMask appropriateForURL:nil create:shouldCreate error:nil];
    });
    
    return documentsDirectoryURL;
}

@end
