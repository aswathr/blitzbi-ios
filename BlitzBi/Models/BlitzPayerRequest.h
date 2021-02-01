//
//  BlitzPayerRequest.h
//  BlitzBi
//
//  Created by Akash on 31/01/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzPayerRequest : NSObject {
    NSString* blitzUserId;
    NSString* payerData;
}

- (instancetype)initWith:(NSString*)userId
            andPayerData:(NSString*)payerData;
- (NSMutableDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
