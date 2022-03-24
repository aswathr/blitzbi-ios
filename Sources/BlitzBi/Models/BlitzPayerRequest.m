//
//  BlitzPayerRequest.m
//  BlitzBi
//
//  Created by Akash on 31/01/21.
//

#import "BlitzPayerRequest.h"

@implementation BlitzPayerRequest

- (instancetype)initWith:(NSString*)userId
            andPayerData:(NSString*)userPayerData {
    if (self = [super init]) {
        blitzUserId = userId;
        payerData = userPayerData;
    }
    return self;
}

- (NSMutableDictionary*)dictionary {
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc] init];
    [requestDict setValue:blitzUserId forKey:@"blitzUserId"];
    [requestDict setValue:payerData forKey:@"payerData"];
    return requestDict;
}

@end
