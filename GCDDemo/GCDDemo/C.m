//
//  C.m
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/21.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "C.h"

//#define kConcurrentValue 3

@interface C ()

@property (nonatomic, strong) NSMutableArray *arr;
//@property (nonatomic, strong)
@property (nonatomic, strong) NSCondition *conLock;

@end

@implementation C
{
    dispatch_semaphore_t sem;
//    dispatch_queue_t con;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arr = NSMutableArray.new;
//        sem = dispatch_semaphore_create(1);

        _conLock = NSCondition.new;
        
//        con = dispatch_queue_create("con", DISPATCH_QUEUE_CONCURRENT);
        
        
    }
    return self;
}

- (void)addProduct:(NSUInteger)proId {
    [self.conLock lock];
    NSLog(@"add --- %lu--%@", (unsigned long)proId,[NSThread currentThread]);
    [self.arr addObject:@(proId)];
        
    [self.conLock signal];

    [self.conLock unlock];

}


- (void)subProduct {
    [self.conLock lock];

    if (self.arr.count < 1) {
        [self.conLock wait];
    }
    NSLog(@"subProduct --- %@--%@", self.arr.lastObject,[NSThread currentThread]);
    [self.arr removeLastObject];
    [self.conLock unlock];

}

@end
