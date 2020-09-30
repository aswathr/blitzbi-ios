//
//  KWConcurrentDictionary.m
//  ArVideoDemo
//
//  Created by Prabal on 24/11/17.
//  Copyright © 2017 Kiwi, Inc. All rights reserved.
//

#import "KWConcurrentDictionary.h"

@interface KWConcurrentDictionary() {
    dispatch_queue_t accessQueue;
    NSMutableDictionary *underlyingDict;
}

@end

@implementation KWConcurrentDictionary

- (instancetype)init {
    return [self initWithCapacity:10];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        accessQueue = dispatch_queue_create("com.kiwi.concurrentDictQueue", DISPATCH_QUEUE_CONCURRENT);
        underlyingDict = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        accessQueue = dispatch_queue_create("com.kiwi.concurrentDictQueue", DISPATCH_QUEUE_CONCURRENT);
        underlyingDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    }
    return self;
}

- (NSUInteger)count {
    __block NSUInteger count;
    dispatch_sync(accessQueue, ^{
        count = (NSUInteger)[underlyingDict count];
    });
    return count;
}

- (id)objectForKey:(id)aKey {
    __block id object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [underlyingDict objectForKey:aKey];
    });
    return object;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    /* make your WRITEs blocking on barrier, so this block will execute after everything else put before this to the same Q is done */
    dispatch_barrier_async(accessQueue, ^{
        [underlyingDict setObject:anObject forKey:aKey];
    });
}

- (id)putIfAbsentObject:(id)anObject forKey:(id)aKey {
    __block id oldObject;
    dispatch_barrier_sync(accessQueue, ^{
        oldObject = [underlyingDict objectForKey:aKey];
        if (!oldObject) {
            [underlyingDict setObject:anObject forKey:aKey];
        }
    });
    return oldObject;
}

- (void)removeObjectForKey:(id)aKey {
    dispatch_barrier_async(accessQueue, ^{
        [underlyingDict removeObjectForKey:aKey];
    });
}

- (void)removeAllObjects {
    dispatch_barrier_async(accessQueue, ^{
        [underlyingDict removeAllObjects];
    });
}

- (void)addObjectsFromDictAfterEmptying:(NSDictionary*)dict {
    dispatch_barrier_async(accessQueue, ^{
        [underlyingDict removeAllObjects];
        [underlyingDict addEntriesFromDictionary:dict];
    });
}

- (NSDictionary *)getSnapshot {
    __block NSDictionary *copy;
    dispatch_sync(accessQueue, ^{
        copy = [underlyingDict copy];
    });
    return copy;
}

- (NSArray *)allKeys {
    __block NSArray *object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [underlyingDict allKeys];
    });
    return object;
}

- (NSArray *)allValues {
    __block NSArray *object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [underlyingDict allValues];
    });
    return object;
}


@end
