//
//  SerialSync5.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SerialSync5.h"

@implementation SerialSync5

+ (void)doSomething {
    //即使创建了一个新的串行队列，同步执行，执行的线程还是主线程{number = 1, name = main}
    dispatch_queue_t ser = dispatch_queue_create("ser", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(ser, ^{
        NSLog(@"currentThread 1 %@", [NSThread currentThread]);

        // 1
        [self task1];
        
        // 2
        [self task2];

        
        // 3
        [self task3];

        
    });
    //即使创建了一个新的并行队列，同步执行，执行的线程还是主线程{number = 1, name = main}
    dispatch_queue_t conc = dispatch_queue_create("conc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(conc, ^{
        NSLog(@"dispatch_sync DISPATCH_QUEUE_CONCURRENT 2 %@", [NSThread currentThread]);

    });
}

+ (void)task1 {
    NSLog(@"task1");
}

+ (void)task2 {
    NSLog(@"task2");
}

+ (void)task3 {
    NSLog(@"task3");
}

@end
