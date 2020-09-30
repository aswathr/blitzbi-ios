//
//  ServerUserPropertiesUtil.m
//  ArVideoDemo
//
//  Created by Anuj Kaura on 29/10/18.
//  Copyright © 2018 Kiwi, Inc. All rights reserved.
//

#import "ServerUserPropertiesUtil.h"
//#import "ServerCallApi.h"
//#import "ArVideoDemo-Swift.h"

@interface ServerUserPropertiesUtil () {
    NSHashTable<id<ServerUserPropertiesFetchedListener> > *listeners;
}
@end

@implementation ServerUserPropertiesUtil

- (instancetype)init {
    self = [super init];
    if (self) {
        listeners = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
    }
    return self;
}

- (void)registerServerUserPropertiesFetchedListener:(id<ServerUserPropertiesFetchedListener> )listener {
    if ([listeners containsObject:listener]) {
        return;
    }
    [listeners addObject:listener];
    
}

- (void)deregisterServerUserPropertiesFetchedListener:(id<ServerUserPropertiesFetchedListener> )listener {
    [listeners removeObject:listener];
}

- (void)updateListenersOnServerUserPropertiesFetched {
    NSHashTable<id<ServerUserPropertiesFetchedListener> > *listenersTemp = [listeners copy];
    for (id<ServerUserPropertiesFetchedListener> listener in listenersTemp) {
        if (listener) {
            [listener onServerUserPropertiesFetched];
        }
    }
}

- (void)saveUserPropertyOnServerWithKey:(NSString *)key andValue:(NSString *)value {
//    if ([[AppParamModel getSharedInstance] userPropertiesOnServerEnabled]) {
//        [ServerCallApi updateUserPropertiesWithKey:key withValue:value];
//    }
    //TODO: Do we need a response listener??
}

- (void)getServerUserProperties:(ServerUserPropertiesCompletionBlock)block {
//    if ([[AppParamModel getSharedInstance] userPropertiesOnServerEnabled]) {
//        [ServerCallApi getUserProperties:^(NSObject *response, NSError *error) {
//            if (error == nil) {
//                NSDictionary *responseObject = (NSDictionary *)response;
//                BOOL boolSuccess = [((NSString *)[responseObject objectForKey:STATUS]) isEqualToString:SUCCESS_STRING];
//                if (boolSuccess) {
//                    if (block != nil) {
//                         NSArray *userPropertiesArray = [responseObject objectForKey:USER_PROPERTIES];
//                        NSError *parsingError = nil;
//                        NSArray<UserPropertyModel> *userProperties = [UserPropertyModel arrayOfModelsFromDictionaries:userPropertiesArray error:&parsingError];
//                        if (parsingError != nil) {
//                            NSLog(@"ServerUserProperties: Parsing Error: %@", parsingError.debugDescription);
//                        }
//                        else {
//                            block(userProperties);
//                        }
//                    }
//                    [self updateListenersOnServerUserPropertiesFetched];
//                }
//            }
//        }];
//    }
}

@end
