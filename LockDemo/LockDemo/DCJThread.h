//
//  DCJThread.h
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//  NSCondition

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCJThread : NSObject

- (BOOL)sleep:(long long)time;
- (void)interrupt;
@end

NS_ASSUME_NONNULL_END
