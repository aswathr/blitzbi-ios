//
//  KWConcurrentDictionary.m
//  ArVideoDemo
//
//  Created by Prabal on 24/11/17.
//  Copyright © 2017 Kiwi, Inc. All rights reserved.
//

#import "BlitzKWConcurrentDictionary.h"

@interface BlitzKWConcurrentDictionary() {
    dispatch_queue_t accessQueue;
    NSMutableDictionary *underlyingDict;
}

@end

@implementation BlitzKWConcurrentDictionary

- (instancetype)init {
    return [self initWithCapacity:10];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        accessQueue = dispatch_queue_create("com.blitz.concurrentDictQueue", DISPATCH_QUEUE_CONCURRENT);
        underlyingDict = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        accessQueue = dispatch_queue_create("com.blitz.concurrentDictQueue", DISPATCH_QUEUE_CONCURRENT);
        underlyingDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    }
    return self;
}

- (NSUInteger)count {
    __block NSUInteger count;
    dispatch_sync(accessQueue, ^{
        count = (NSUInteger)[self->underlyingDict count];
    });
    return count;
}

- (id)objectForKey:(id)aKey {
    __block id object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [self->underlyingDict objectForKey:aKey];
    });
    return object;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    /* make your WRITEs blocking on barrier, so this block will execute after everything else put before this to the same Q is done */
    dispatch_barrier_async(accessQueue, ^{
        [self->underlyingDict setObject:anObject forKey:aKey];
    });
}

- (id)putIfAbsentObject:(id)anObject forKey:(id)aKey {
    __block id oldObject;
    dispatch_barrier_sync(accessQueue, ^{
        oldObject = [self->underlyingDict objectForKey:aKey];
        if (!oldObject) {
            [self->underlyingDict setObject:anObject forKey:aKey];
        }
    });
    return oldObject;
}

- (void)removeObjectForKey:(id)aKey {
    dispatch_barrier_async(accessQueue, ^{
        [self->underlyingDict removeObjectForKey:aKey];
    });
}

- (void)removeAllObjects {
    dispatch_barrier_async(accessQueue, ^{
        [self->underlyingDict removeAllObjects];
    });
}

- (void)addObjectsFromDictAfterEmptying:(NSDictionary*)dict {
    dispatch_barrier_async(accessQueue, ^{
        [self->underlyingDict removeAllObjects];
        [self->underlyingDict addEntriesFromDictionary:dict];
    });
}

- (NSDictionary *)getSnapshot {
    __block NSDictionary *copy;
    dispatch_sync(accessQueue, ^{
        copy = [self->underlyingDict copy];
    });
    return copy;
}

- (NSArray *)allKeys {
    __block NSArray *object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [self->underlyingDict allKeys];
    });
    return object;
}

- (NSArray *)allValues {
    __block NSArray *object;
    /* make your READs sychronous */
    dispatch_sync(accessQueue, ^{
        object = [self->underlyingDict allValues];
    });
    return object;
}


@end
