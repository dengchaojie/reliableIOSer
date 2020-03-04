//
//  Synchronized10.h
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Synchronized10 : NSObject

@property (nonatomic, copy) NSString *name;

- (void)doSomething:(NSUInteger)i;
@end

NS_ASSUME_NONNULL_END
