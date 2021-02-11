//
//  NTPServer.h
//  BlitzBi
//
//  Created by Admin on 12/11/20.
//

#import <Foundation/Foundation.h>

@interface BlitzTime : NSObject

NS_ASSUME_NONNULL_BEGIN

- (instancetype)init;
- (BOOL)connectWithError:(NSError *__autoreleasing _Nullable *_Nullable)error NS_REQUIRES_SUPER;
- (void)disconnect NS_REQUIRES_SUPER;
- (BOOL)syncWithError:(NSError *__autoreleasing _Nullable *_Nullable)error NS_REQUIRES_SUPER;
- (nullable NSDate *)dateWithError:(NSError *__autoreleasing _Nullable *_Nullable)error;

NS_ASSUME_NONNULL_END

@end
