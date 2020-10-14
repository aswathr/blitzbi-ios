//
//  BlitzKWConcurrentDictionary.h
//  BlitzBi
//
//  Created by Akash on 01/10/20.
//  Copyright © 2016 Blitz, Inc. All rights reserved.
//
//  Generic Thread Safe implementation of NSMutableDictionary backed by a NSMutableDictionary


#import <Foundation/Foundation.h>

@interface BlitzKWConcurrentDictionary<KeyType, ObjectType> : NSObject

- (instancetype _Nullable )initWithCapacity:(NSUInteger)capacity;
- (instancetype _Nullable )initWithDictionary:(NSDictionary<KeyType, ObjectType> *_Nullable)dict;
- (ObjectType _Nullable)objectForKey:(KeyType _Nullable )aKey;
- (void)setObject:(ObjectType _Nullable )anObject forKey:(KeyType _Nullable )aKey;
- (ObjectType _Nullable)putIfAbsentObject:(ObjectType _Nullable )anObject forKey:(KeyType _Nullable )aKey;
- (void)removeObjectForKey:(KeyType _Nullable )aKey;
- (void)removeAllObjects;
- (void)addObjectsFromDictAfterEmptying:(NSDictionary<KeyType, ObjectType> *_Nullable)dict;
- (NSArray<KeyType> *_Nullable)allKeys;
- (NSArray<ObjectType> *_Nullable)allValues;
- (NSUInteger)count;
- (NSDictionary<KeyType, ObjectType> *_Nullable)getSnapshot;

@end
