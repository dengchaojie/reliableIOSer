//
//  WHObject.m
//  GCDRW
//
//  Created by chao jie deng on 2020/4/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "WHObject.h"

@interface WHObject()

@property (nonatomic, strong) dispatch_queue_t dictQueue;//并发队列
@property (nonatomic, strong) NSMutableDictionary *dict;//可变字典

@end

@implementation WHObject

- (instancetype)init {
    if(self = [super init]) {
        _dictQueue = dispatch_queue_create("com.huangwenhong.queue", DISPATCH_QUEUE_CONCURRENT);
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)huangwenhongmethod {
//    self.target = [NSObject new];
}

- (id)valueForKey:(NSString *)key {
    id __block obj;
    dispatch_sync(_dictQueue, ^{//因为有数据 return，所以这里是同步调用
        NSLog(@"dispatch_sync==%@", [NSThread currentThread]);

        obj = [self.dict valueForKey:key];
    });
    return obj;
}


//- (void)setValue:(id)obj forKey:(id<NSCopying>)key
- (void)setValue:(id)value forKey:(NSString *)key {
    //重点：dispatch_barrier_async()，异步栅栏调用；
    //只有提交到并行队列才有意义
    dispatch_barrier_async(_dictQueue, ^{
        NSLog(@"dispatch_barrier_async==%@", [NSThread currentThread]);

        [self.dict setObject:value forKey:key];
    });
}
@end
