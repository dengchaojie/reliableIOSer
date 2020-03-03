//
//  ThreadAliveForEver.m
//  RunloopDemo
//
//  Created by chao jie deng on 2020/3/3.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ThreadAliveForEver.h"

@implementation ThreadAliveForEver


+ (NSThread *)alived {
    static NSThread *_myThread = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _myThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];
        
        NSLog(@"thr == %@",_myThread);
        [_myThread start];
    });
    return _myThread;
}



+(void)networkRequestThreadEntryPoint:(id)obj {
    NSLog(@"obj == %@", obj);
    @autoreleasepool {
        NSThread *thr = [NSThread currentThread];
        [thr setName:@"ThreadAliveForEver"];
        NSLog(@"thr == %@",thr);

        NSRunLoop *runL = [NSRunLoop currentRunLoop];
        NSLog(@"currentRunLoop == %@",runL);
        [runL addPort:[NSMachPort port] forMode:( NSRunLoopCommonModes)];
        [runL run];
    }
}


@end
