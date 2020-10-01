//
//  AES.h
//  ArVideoDemo
//
//  Created by Harsha on 18/01/19.
//  Copyright © 2019 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzKiwiParser : NSObject
+ (NSData *)parse:(NSString *)encryptedStr withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
+ (NSData *)wrap:(NSString *)str withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
+ (NSData *)wrapData:(NSData *)inputData withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv;
@end
