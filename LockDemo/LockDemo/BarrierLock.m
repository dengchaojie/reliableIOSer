//
//  BarrierLock.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "BarrierLock.h"

@implementation BarrierLock


+ (void)doSomething {
    
    dispatch_queue_t conc = dispatch_queue_create("conc", DISPATCH_QUEUE_CONCURRENT);
    // 读
    dispatch_async(conc, ^{
        NSLog(@"currentThread 读1 %@", [NSThread currentThread]);
    });
    dispatch_async(conc, ^{
        NSLog(@"currentThread 读2 %@", [NSThread currentThread]);
    });
    dispatch_async(conc, ^{
        NSLog(@"currentThread 读3 %@", [NSThread currentThread]);
    });
    dispatch_async(conc, ^{
        NSLog(@"currentThread 读4 %@", [NSThread currentThread]);
    });
    // 写。等读完了，在写
    dispatch_barrier_async(conc, ^{
        NSLog(@"currentThread 写100 %@", [NSThread currentThread]);
    });
}

@end
