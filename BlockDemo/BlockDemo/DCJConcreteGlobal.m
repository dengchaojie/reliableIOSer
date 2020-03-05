//
//  DCJConcreteGlobal.m
//  BlockDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJConcreteGlobal.h"

typedef int(^Block)(void);
//Block globalBlk = ^(void){
//    return 0;
//};

@implementation DCJConcreteGlobal


+(void)doSomething {
//    <__NSGlobalBlock__: 0x10ed540b0>
//    NSLog(@"globalBlk %@", globalBlk);
//    globalBlk();
    
    Block globalBlk = ^(void){
        return 0;
    };
//    <__NSGlobalBlock__: 0x10d7e20b0>
    NSLog(@"globalBlk %@", globalBlk);
    globalBlk();
}

- (void)doSomething2 {
    void(^blk)(void)  = ^(void) {
        NSLog(@"doSomething2");
    };
    /*
     <__NSGlobalBlock__: 0x10963a0f0>
     */
    NSLog(@"doSomething2 blk %@", blk);

}

@end
