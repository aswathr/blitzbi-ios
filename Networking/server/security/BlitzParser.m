//
//  BlitzParser.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzParser.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation BlitzParser

//Taken from - https://github.com/skavinvarnan/Cross-Platform-AES/blob/master/iOS/CryptLib.m
+ (NSData *)parse:(NSString *)encryptedStr withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv {
    NSData *encryptedData = [[NSData alloc] initWithBase64EncodedString:encryptedStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    char keyPointer[kCCKeySizeAES256+2],// room for terminator (unused) ref: https://devforums.apple.com/message/876053#876053
    ivPointer[kCCBlockSizeAES128+2];
    BOOL patchNeeded;

    patchNeeded = ([key length] > kCCKeySizeAES256+1);
    if(patchNeeded)
    {
        key = [key substringToIndex:kCCKeySizeAES256]; // Ensure that the key isn't longer than what's needed (kCCKeySizeAES128)
    }

    [key getCString:keyPointer maxLength:sizeof(keyPointer) encoding:NSUTF8StringEncoding];
    [iv getCString:ivPointer maxLength:sizeof(ivPointer) encoding:NSUTF8StringEncoding];

    if (patchNeeded) {
        keyPointer[0] = '\0';  // Previous iOS version than iOS7 set the first char to '\0' if the key was longer than kCCKeySizeAES128
    }

    NSUInteger dataLength = [encryptedData length];

    //see https://developer.apple.com/library/ios/documentation/System/Conceptual/ManPages_iPhoneOS/man3/CCryptorCreateFromData.3cc.html
    // For block ciphers, the output size will always be less than or equal to the input size plus the size of one block.
    size_t buffSize = dataLength + kCCBlockSizeAES128;

    void *buff = malloc(buffSize);

    size_t numBytesEncrypted = 0;
    //refer to http://www.opensource.apple.com/source/CommonCrypto/CommonCrypto-36064/CommonCrypto/CommonCryptor.h
    //for details on this function
    //Stateless, one-shot encrypt or decrypt operation.
    CCCryptorStatus status = CCCrypt(kCCDecrypt,/* kCCEncrypt, etc. */
                                     kCCAlgorithmAES128, /* kCCAlgorithmAES128, etc. */
                                     kCCOptionPKCS7Padding, /* kCCOptionPKCS7Padding, etc. */
                                     keyPointer, kCCKeySizeAES256,/* key and its length */
                                     ivPointer, /* initialization vector - use same IV which was used for decryption */
                                     [encryptedData bytes], [encryptedData length], //input
                                     buff, buffSize,//output
                                     &numBytesEncrypted);
    if (status == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buff length:numBytesEncrypted];
    }

    free(buff);
    return nil;
}

+ (NSData *)wrap:(NSString *)str withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv {
    NSData *inputData = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [self wrapData:inputData withDetailsOne:key andDetailsTwo:iv];
}

+ (NSData *)wrapData:(NSData *)inputData withDetailsOne:(NSString *)key andDetailsTwo:(NSString *)iv {
    char keyPointer[kCCKeySizeAES256+2],// room for terminator (unused) ref: https://devforums.apple.com/message/876053#876053
    ivPointer[kCCBlockSizeAES128+2];
    BOOL patchNeeded;
    bzero(keyPointer, sizeof(keyPointer)); // fill with zeroes for padding

    patchNeeded= ([key length] > kCCKeySizeAES256+1);
    if(patchNeeded)
    {
        key = [key substringToIndex:kCCKeySizeAES256]; // Ensure that the key isn't longer than what's needed (kCCKeySizeAES256)
    }

    [key getCString:keyPointer maxLength:sizeof(keyPointer) encoding:NSUTF8StringEncoding];
    [iv getCString:ivPointer maxLength:sizeof(ivPointer) encoding:NSUTF8StringEncoding];

    if (patchNeeded) {
        keyPointer[0] = '\0';  // Previous iOS version than iOS7 set the first char to '\0' if the key was longer than kCCKeySizeAES256
    }

    NSUInteger dataLength = [inputData length];

    //see https://developer.apple.com/library/ios/documentation/System/Conceptual/ManPages_iPhoneOS/man3/CCryptorCreateFromData.3cc.html
    // For block ciphers, the output size will always be less than or equal to the input size plus the size of one block.
    size_t buffSize = dataLength + kCCBlockSizeAES128;
    void *buff = malloc(buffSize);

    size_t numBytesEncrypted = 0;
    //refer to http://www.opensource.apple.com/source/CommonCrypto/CommonCrypto-36064/CommonCrypto/CommonCryptor.h
    //for details on this function
    //Stateless, one-shot encrypt or decrypt operation.
    CCCryptorStatus status = CCCrypt(kCCEncrypt, /* kCCEncrypt, etc. */
                                     kCCAlgorithmAES128, /* kCCAlgorithmAES128, etc. */
                                     kCCOptionPKCS7Padding, /* kCCOptionPKCS7Padding, etc. */
                                     keyPointer, kCCKeySizeAES256, /* key and its length */
                                     ivPointer, /* initialization vector - use random IV everytime */
                                     [inputData bytes], [inputData length], /* input  */
                                     buff, buffSize,/* data RETURNED here */
                                     &numBytesEncrypted);
    if (status == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buff length:numBytesEncrypted];
    }

    free(buff);
    return nil;
}

@end
