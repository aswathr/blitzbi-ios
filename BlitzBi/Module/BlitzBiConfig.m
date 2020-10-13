//
//  BiConfig.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import "BlitzBiConfig.h"

@implementation BlitzBiConfig
- (id)initWithUrl:(NSString*) baseUrl {
    if (self = [super init]) {
        _BASE_URL = baseUrl;
    }
    return self;
}
- (NSString*)base_URL {
    return _BASE_URL;
}
@end
