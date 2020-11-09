//
//  BlitzBiEventData.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlitzNameValuePair : NSObject {
    NSObject *name, *value;
}

- (instancetype)init:(NSString *)_name value:(NSString *)_value;
- (NSObject *)getName;
- (NSObject *)getValue;
@end

@interface BlitzBiEventData : NSObject {
    NSMutableArray *payload;
}

- (NSMutableArray *)getPayload;
- (instancetype)init:(NSMutableArray *)payload;
@end
