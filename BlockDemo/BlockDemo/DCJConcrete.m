//
//  DCJConcrete.m
//  BlockDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJConcrete.h"

typedef void(^DCJBlock)(void);

id getBlockArray() {
    int val = 10;
    /*
     <__NSStackBlock__: 0x7ffeed37d2c8>
     */
    
    NSLog(@"%@",^{ NSLog(@"blklog:%d", val); });
    //从栈上复制到堆上
    return [[NSArray alloc] initWithObjects:[^{ NSLog(@"blk0:%d", val); } copy]
            ,[^{ NSLog(@"blk1:%d", val); } copy], nil];
}

@implementation DCJConcrete


+(void)doSomething {
    id arr = getBlockArray();
    DCJBlock blk = [arr objectAtIndex:1];
//    <__NSMallocBlock__: 0x60000281a1c0>
    NSLog(@"blklog objectAtIndex 1 %@", blk);
    blk();
}

@end
