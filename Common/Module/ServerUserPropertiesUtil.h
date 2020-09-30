//
//  ServerUserPropertiesUtil.h
//  ArVideoDemo
//
//  Created by Anuj Kaura on 29/10/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerUserPropertiesFetchedListener.h"
#import "UserDefaultsUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServerUserPropertiesUtil : NSObject

- (void)saveUserPropertyOnServerWithKey:(NSString *)key andValue:(NSString *)value;
- (void)getServerUserProperties:(ServerUserPropertiesCompletionBlock)block;

- (void)registerServerUserPropertiesFetchedListener:(id<ServerUserPropertiesFetchedListener> )listener;
- (void)deregisterServerUserPropertiesFetchedListener:(id<ServerUserPropertiesFetchedListener> )listener;

@end

NS_ASSUME_NONNULL_END
