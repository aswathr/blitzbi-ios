//
//  BlitzServerConfig.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBlitzServerConfig.h"

@class BaseUrls;

NS_ASSUME_NONNULL_BEGIN

@interface BlitzServerConfig : NSObject<PBlitzServerConfig>
@property (strong) BaseUrls* baseUrls;

- (instancetype)init:(BaseUrls *) baseUrls;
@end

NS_ASSUME_NONNULL_END
