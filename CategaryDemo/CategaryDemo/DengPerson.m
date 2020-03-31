//
//  DengPerson.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DengPerson.h"
#import "NSObject+DCJ.h"


@interface DengPerson ()


@end

@implementation DengPerson
@synthesize lastname = _lastname;

- (void)setLastname:(NSString *)lastname {
    if (![lastname isEqualToString:@"邓"]) {
        NSLog(@"lastname is not deng");
        return;
    }
    _lastname = @"邓";
//    Thread 1: EXC_BAD_ACCESS (code=2, address=0x7ffee8141ff8)
//    Thread 1 Queue : com.apple.main-thread (serial)
    static dispatch_once_t slsls;
    dispatch_once(&slsls, ^{
        
    });
}

- (NSString *)lastname {
    return _lastname;
}

- (void)dealloc {
    if (self.delegate) {
        [self.delegate someMethod];
    }
}

@end
