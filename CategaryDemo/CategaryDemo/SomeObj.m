//
//  SomeObj.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/4/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SomeObj.h"

@implementation SomeObj


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(someMethod)) {
        return [NSMethodSignature methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSObject *som = NSObject.new;
    if ([som respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:som];

    }
}

- (void)someMethod {
    
}


@end
