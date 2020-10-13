//
//  BiConfig.m
//  ArVideoDemo
//
//  Created by Faizan on 07/12/16.
//  Copyright © 2016 Kiwi, Inc. All rights reserved.
//

#import <BlitzBiConfig.h>

@implementation BlitzBiConfig
- (id)initWithUrl:(NSString*) baseUrl {
    if (self = [super init]) {
        BASE_URL = baseUrl;
    }
    return self;
}
- (NSString*)base_URL {
    return BASE_URL;
}
@end
