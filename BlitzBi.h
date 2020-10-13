//
//  Blitz.h
//  BlitzBi
//
//  Created by Admin on 13/10/20.
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
