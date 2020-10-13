//
//  BaseUrls.m
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <BaseUrls.h>

@implementation BaseUrls
- (instancetype)initWithBaseUrl:(NSString *) baseUrl {
    if (self = [super init]) {
        BASE_URL = baseUrl;
    }
    return self;
}
@end
