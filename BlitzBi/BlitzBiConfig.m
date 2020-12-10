//
//  BlitzBiConfig.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBiConfig.h>

@implementation BlitzBiConfig
- (instancetype)initWithBaseUrl:(NSString*) baseUrl {
    if (self = [super init]) {
        BASE_URL = baseUrl;
    }
    return self;
}
- (NSString*)base_URL {
    return BASE_URL;
}
@end
