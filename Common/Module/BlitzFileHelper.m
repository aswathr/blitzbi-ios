//
//  BlitzFileHelper.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzFileHelper.h>

@implementation BlitzFileHelper
+ (NSString *)fullFilePathInDocumentsDirectoryForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    NSString *fullFilePath = [docsDir stringByAppendingPathComponent:fileName];
    
    return fullFilePath;
}
@end
