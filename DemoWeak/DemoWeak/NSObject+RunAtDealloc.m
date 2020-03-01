//
//  NSObject+RunAtDealloc.m
//  DemoWeak
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "NSObject+RunAtDealloc.h"
#import <objc/runtime.h>
//#import <AppKit/AppKit.h>

const void *RunAtDeallocKey = "RunAtDeallocKey";

@implementation NSObject (RunAtDealloc)

- (void)dcj_runAtDealloc:(voidBlock)block {
    if (block) {
        DCJBlockExcutor *exc = [[DCJBlockExcutor alloc] initWithBlock:block];
        objc_setAssociatedObject(self, RunAtDeallocKey, exc, OBJC_ASSOCIATION_RETAIN);
    }


}
//

@end
