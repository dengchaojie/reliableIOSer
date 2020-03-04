//
//  Synchronized10.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Synchronized10.h"

@implementation Synchronized10

- (void)doSomething:(NSUInteger)i {
    //@synchronized(obj)内部会生成obj对应的递归锁，然后进行加锁、解锁操作；

    @synchronized (_name) {
        NSString *temp = [NSString stringWithFormat:@"%ld", random()/10000];
        NSLog(@"inside == %@, i == %ld", temp, i);
        _name = temp;
    }
}


@end
