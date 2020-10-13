//
//  BlitzServerConfig.h
//  BlitzBi
//
//  Created by Admin on 12/10/20.
//

#import <Foundation/Foundation.h>
#import <BaseUrls.h>
#import <PBlitzServerConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlitzServerConfig : NSObject<PBlitzServerConfig>
@property (strong) BaseUrls* baseUrls;

- (instancetype)initWithBaseUrl:(BaseUrls *) baseUrls;
@end

NS_ASSUME_NONNULL_END
