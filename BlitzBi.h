//
//  BlitzBi.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BlitzBiService.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzBi : NSObject {
    BlitzBiService* biService;
}

+ (instancetype _Nonnull)sharedInstance;
- (void)initailiseWithAppId:(NSString*)appId
                andAppToken:(NSString*)andAppToken;
- (void)sendEvent:(NSDictionary*)eventDict;
- (void)sendEvents:(NSArray*)events;
@end

NS_ASSUME_NONNULL_END
