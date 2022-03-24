//
//  BlitzFileHelper.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzFileHelper : NSObject
+ (NSString *)fullFilePathInDocumentsDirectoryForFileName:(NSString *)fileName;
@end
