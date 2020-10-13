//
//  BiEventData.h
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameValuePair : NSObject {
    NSObject *name, *value;
}

- (id)init:(NSString *)_name value:(NSString *)_value;
- (NSObject *)getName;
- (NSObject *)getValue;
@end

typedef NameValuePair BasicNameValuePair;

@interface BlitzBiEventData : NSObject {
    NSMutableArray *payload;
}

- (NSMutableArray *)getPayload;
- (id)init:(NSMutableArray *)payload;
@end
