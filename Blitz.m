//
//  Blitz.m
//  BlitzBi
//
//  Created by Admin on 13/10/20.
//

#import <Blitz.h>

@implementation Blitz
BlitzBiService* biService;

+ (instancetype)sharedInstance {
    static Blitz *sharedInstance = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        sharedInstance = [Blitz new];
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
