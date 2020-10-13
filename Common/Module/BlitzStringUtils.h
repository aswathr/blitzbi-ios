//
//  StringUtils.h
//  ArVideoDemo
//
//  Created by Mitesh on 17/01/17.
//  Copyright © 2017 Kiwi, Inc. All rights reserved.
//

#ifndef StringUtils_h
#define StringUtils_h
#import <Foundation/Foundation.h>

@interface BlitzStringUtils : NSObject
+ (BOOL)isValidIntegerString:(NSString *)str;
+ (NSString *)MD5String:(NSString *)str;
+ (NSString *)MD5Base64String:(NSString *)str;
+ (NSString *)integerToString:(NSString *)str;
+ (NSString *)integerValToString:(NSInteger)input;
+ (BOOL)isEmpty:(NSString *)str;
+ (BOOL)isNonEmpty:(NSString *)str;
+ (NSInteger)getIntegerValue:(NSString *)string;
+ (BOOL)caseInsensitiveCheckWithSource:(NSString *)source withTarget:(NSString *)target;
+ (NSString *)replaceFirstOccurrenceOfString:(NSString *)searchString withReplacement:(NSString *)replacementString inString:(NSString *)inputString fromIndex:(NSInteger)startIndex;
+ (NSString *)replaceMysteriousSpaceCharacterFromCurrency:(NSString *)input;
+ (NSNumber *)convertStringToNumber:(NSString *)string;
+ (NSString *)genRandStringLength:(int)len;
+ (NSString *)includeOnlyAlphabetsAndWordSeperators:(NSString *)input;
+ (NSArray *)getArraySeperatedByWordSeperators:(NSString *) input;
@end
#endif
