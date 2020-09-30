//
//  KWConcurrentDictionary.h
//  ArVideoDemo
//
//  Created by Prabal on 24/11/17.
//  Copyright © 2017 Kiwi, Inc. All rights reserved.
//
//  Generic Thread Safe implementation of NSMutableDictionary backed by a NSMutableDictionary


#import <Foundation/Foundation.h>

@interface KWConcurrentDictionary<KeyType, ObjectType> : NSObject

- (instancetype)initWithCapacity:(NSUInteger)capacity;
- (instancetype)initWithDictionary:(NSDictionary<KeyType, ObjectType> *)dict;
- (ObjectType _Nullable)objectForKey:(KeyType)aKey;
- (void)setObject:(ObjectType)anObject forKey:(KeyType)aKey;
- (ObjectType _Nullable)putIfAbsentObject:(ObjectType)anObject forKey:(KeyType)aKey;
- (void)removeObjectForKey:(KeyType)aKey;
- (void)removeAllObjects;
- (void)addObjectsFromDictAfterEmptying:(NSDictionary<KeyType, ObjectType> *)dict;
- (NSArray<KeyType> *)allKeys;
- (NSArray<ObjectType> *)allValues;
- (NSUInteger)count;
- (NSDictionary<KeyType, ObjectType> *)getSnapshot;

@end
