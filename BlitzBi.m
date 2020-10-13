//
//  Blitz.m
//  BlitzBi
//
//  Created by Admin on 13/10/20.
//

#import <BlitzBi.h>

@implementation BlitzBi
BlitzBiService* biService;

+ (instancetype)sharedInstance {
    static BlitzBi *sharedInstance = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        sharedInstance = [BlitzBi new];
        biService = [[BlitzBiService alloc] init];
    });
    
    return sharedInstance;
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
