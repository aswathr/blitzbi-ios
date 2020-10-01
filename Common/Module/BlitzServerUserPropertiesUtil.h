//
//  ServerUserPropertiesUtil.h
//  ArVideoDemo
//
//  Created by Anuj Kaura on 29/10/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlitzServerUserPropertiesFetchedListener.h"
#import "BlitzUserDefaultsUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlitzServerUserPropertiesUtil : NSObject

- (void)saveUserPropertyOnServerWithKey:(NSString *)key andValue:(NSString *)value;
- (void)getServerUserProperties:(ServerUserPropertiesCompletionBlock)block;

- (void)registerServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener;
- (void)deregisterServerUserPropertiesFetchedListener:(id<BlitzServerUserPropertiesFetchedListener> )listener;

@end

NS_ASSUME_NONNULL_END
