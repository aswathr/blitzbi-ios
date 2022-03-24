//
//  BlitzParser.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzParser : NSObject
+ (NSData *)parse:(NSString *)encryptedStr withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
+ (NSData *)wrap:(NSString *)str withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
+ (NSData *)wrapData:(NSData *)inputData withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
+ (NSString*)sha256HashForText:(NSString*)text;
@end
