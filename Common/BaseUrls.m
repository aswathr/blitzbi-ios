//
//  BaseUrls.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import "BaseUrls.h"

@implementation BaseUrls
- (instancetype)init:(NSString *) baseUrl {
    if (self = [super init]) {
        BASE_URL = baseUrl;
    }
    return self;
}
@end
