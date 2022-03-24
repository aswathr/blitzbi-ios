//
//  BlitzServerConfig.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BlitzServerConfig.h"
#import "BaseUrls.h"

@implementation BlitzServerConfig
- (instancetype)init:(BaseUrls *) baseUrls {
    if (self = [super init]) {
        _baseUrls = baseUrls;
    }
    return self;
}
- (BaseUrls*)getBaseUrls {
    return _baseUrls;
}
@end
