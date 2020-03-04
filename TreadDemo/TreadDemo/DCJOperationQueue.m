//
//  DCJOperationQueue.m
//  TreadDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJOperationQueue.h"

@implementation DCJOperationQueue


+ (void)doSomething {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"mainQueue 1 %@", [NSThread currentThread]);

    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 3;
    [queue addOperationWithBlock:^{
        NSLog(@"queue 12 %@", [NSThread currentThread]);

    }];
    [queue addOperationWithBlock:^{
        NSLog(@"queue 22 %@", [NSThread currentThread]);

    }];
    [queue addOperationWithBlock:^{
        NSLog(@"queue 32 %@", [NSThread currentThread]);

    }];
    
    [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation 3 %@", [NSThread currentThread]);

    }];
    

}


@end
