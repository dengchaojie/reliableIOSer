//
//  NSObject+DCJ.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "NSObject+DCJ.h"
#import <objc/runtime.h>
//#import <AppKit/AppKit.h>


@implementation NSObject (DCJ)

- (void)setMyContext:(NSString *)myContext {
    
    objc_setAssociatedObject(self, "myContextKey", myContext, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)myContext {
    
    return objc_getAssociatedObject(self, "myContextKey");
}

- (void)setDelegate:(NSString *)delegate {
    
    objc_setAssociatedObject(self, "delegateKey", delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)delegate {
    
    return objc_getAssociatedObject(self, "delegateKey");
}

@end
