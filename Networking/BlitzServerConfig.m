//
//  BlitzServerConfig.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BlitzServerConfig.h>

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
