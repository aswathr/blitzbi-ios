//
//  BlitzBiEventData.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBiEventData.h>

@implementation BlitzNameValuePair
- (id)init:(NSString *)_name value:(NSString *)_value {
    if (self = [super init]) {
        name = _name;
        value = _value;
    }
    return self;
}

- (NSObject *)getName {
    return name;
}

- (NSObject *)getValue {
    return value;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: %@", name, value];
}
@end

@implementation BlitzBiEventData
- (id)init:(NSMutableArray *)_payload {
    if (self = [super init]) {
        payload = _payload;
    }
    return self;
}

- (NSMutableArray *)getPayload {
    return payload;
}
@end
