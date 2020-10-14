//
//  BlitzBi.m
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <BlitzBi.h>

@interface BlitzBi ()
- (instancetype)init;
@end

@implementation BlitzBi
+ (id)sharedInstance {
    static BlitzBi *sharedInstance = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        biService = [[BlitzBiService alloc] init];
    }
    return self;
}

- (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)appToken {
    [biService setUp:appId :appToken];
}

- (void)sendEvent:(NSDictionary*)event{
    [biService sendEvent:event];
}

- (void)sendEvents:(NSArray*)events {
    [biService sendEvents:events];
}
@end
