//
//  DCJThread.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJThread.h"

@interface DCJThread ()


@property (nonatomic, strong) NSCondition *conditionLock;
@property (nonatomic, assign) BOOL isInterrupt;
@end


@implementation DCJThread


- (instancetype)init
{
    self = [super init];
    if (self) {
        _conditionLock = NSCondition.new;
        _isInterrupt = NO;
    }
    return self;
}

- (BOOL)sleep:(long long)time {
    [self.conditionLock  lock];
    NSDate *later = [NSDate dateWithTimeIntervalSinceNow:time];
    //[self.conditionLock waitUntilDate:later]时间到了，返回no。时间没到，返回yes
    while (!self.isInterrupt && [self.conditionLock waitUntilDate:later]) {
        
    }
    [self.conditionLock unlock];
    NSLog(@"---sleep end---%lld", time);

    return self.isInterrupt;
}

- (void)interrupt {
    [self.conditionLock lock];
    NSLog(@"---interrupt--start");
    self.isInterrupt = YES;
    [self.conditionLock signal];
    [self.conditionLock unlock];
}

@end
