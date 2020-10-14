//
//  BlitzStringUtils.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzStringUtils.h>
#import <CommonCrypto/CommonDigest.h>

@implementation BlitzStringUtils
NSString *const BLITZ_NO_BREAK_SPACE = @" ";
+ (BOOL)isValidIntegerString:(NSString *)str {
    NSScanner *scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (NSString *)MD5Base64String:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);

    NSData* data = [NSData dataWithBytes:(const void *)result length:sizeof(unsigned char)*CC_MD5_DIGEST_LENGTH];

    return [data base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
}

+ (NSString *)MD5String:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);

    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

+ (NSString *)integerValToString:(NSInteger)input {
    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:@""];
    while (input > 0) {
        NSInteger reminder = input % 10;
        char result = reminder + 'a';
        [mutableString appendFormat:@"%c", result];
        input = input / 10;
    }
    return mutableString;
}

+ (NSString *)integerToString:(NSString *)str {
    NSInteger strAsInt = [str integerValue];
    return [BlitzStringUtils integerValToString:strAsInt];
}

+ (BOOL)isNonEmpty:(NSString *)str {
    return (str && ![str isEqualToString:@""]);
}

//if the str is not String type, then we return NO on Prod. so that it doesn't crash on Prod.
+ (BOOL)isEmpty:(NSString *)str {
    if (str == nil) {
        return YES;
    }
    if (![str isKindOfClass:NSString.class]) {
        return NO;
    }
    return [str isEqualToString:@""];
}

+ (NSInteger)getIntegerValue:(NSString *)string {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numberObj = [formatter numberFromString:string];
    return [numberObj integerValue];
}

+ (BOOL)caseInsensitiveCheckWithSource:(NSString *)source withTarget:(NSString *)target {
    if ([source rangeOfString:target options:NSCaseInsensitiveSearch].location == NSNotFound) {
        return NO;
    }
    return YES;
}

+ (NSString *)replaceFirstOccurrenceOfString:(NSString *)searchString withReplacement:(NSString *)replacementString inString:(NSString *)inputString fromIndex:(NSInteger)startIndex {
    NSString *subStringToSearch = [inputString substringFromIndex:startIndex];
    
    NSRange rOriginal = [subStringToSearch rangeOfString:searchString];
    
    NSString *updatedString = inputString;
    if (NSNotFound != rOriginal.location) {
        NSRange newRange = NSMakeRange(startIndex + rOriginal.location, rOriginal.length);
        updatedString = [inputString stringByReplacingCharactersInRange:newRange withString:replacementString];
    }
    
    return updatedString;
}

+ (NSString *)replaceMysteriousSpaceCharacterFromCurrency:(NSString *)input {
    return [input stringByReplacingOccurrencesOfString:BLITZ_NO_BREAK_SPACE withString:@""];
}

+ (NSNumber *)convertStringToNumber:(NSString *)string {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    [f setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSNumber *number = [f numberFromString:string];
    return number;
}

+ (NSString *)includeOnlyAlphabetsAndWordSeperators:(NSString *)input {

    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"-_ |abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    return [[input componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
}

+ (NSArray *)getArraySeperatedByWordSeperators:(NSString *) input {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@" -_|"];
    NSArray *inputWordsArray = [input componentsSeparatedByCharactersInSet:charSet];
    return [inputWordsArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
}
+ (NSString *)genRandStringLength:(int)len {
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];
    for (int i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform(UINT32_MAX) % [letters length]]];
    }
    return randomString;
}

@end
