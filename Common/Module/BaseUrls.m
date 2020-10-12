//
//  BaseUrls.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import "BaseUrls.h"

@implementation BaseUrls
- (instancetype)initWithBaseUrl:(NSString *) BASE_URL {
    if (self = [super init]) {
        _BASE_URL = BASE_URL;
    }
    return self;
}
@end
