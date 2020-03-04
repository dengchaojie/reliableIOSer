//
//  AssignLock.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "AssignLock.h"

@implementation AssignLock



- (void)doSomething {
//    @synchronized requires an Objective-C object type ('NSUInteger' (aka 'unsigned long') invalid)
//    @synchronized (_age) {
//        _age = 19;
//    }
    
    NSLock *lock = NSLock.new;
    [lock lock];
    _age = 19;
    [lock unlock];
    
    
}
@end
