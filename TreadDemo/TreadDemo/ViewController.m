//
//  ViewController.m
//  TreadDemo
//
//  Created by chao jie deng on 2020/3/3.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "DCJOperationQueue.h"


@interface ViewController ()

@property (nonatomic, strong) NSThread *myThread;

@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong) NSOperationQueue *que;
@property (nonatomic, strong) NSBlockOperation *blo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"currentThread =1= %@", [NSThread currentThread]);
    _flag = NO;
//    [NSThread detachNewThreadWithBlock:^{
//        NSLog(@"currentThread =2= %@", [NSThread currentThread]);
//        self.myThread = [NSThread currentThread];
//        for (int i = 0; i < 20; i++) {
//
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"%d", i);
//        }
//
//
//    }];
    
    // 在主队列，异步执行，不会开启新的线程。
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"currentThread 1 %@---sleep start", [NSThread currentThread]);
//
//    });
//    [DCJOperationQueue doSomething];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 3;
//    NSInvocationOperation *myInvocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(actionInvocationOperation:) object:@"InvocationOperation"];
//    [queue addOperation:myInvocationOperation];
    // -----
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        __strong typeof(self) strSelf = weakSelf;
//        strSelf.myThread = [NSThread currentThread];
//
//            for (int i = 0; i < 100000; i++) {
//                if (strSelf.flag) {
//                    NSLog(@"cancel");
//                    break;
//                }else {
//                    NSLog(@"true");
//                }
//            }
////            NSLog(@"false---%@",[NSThread currentThread]);
//
//
//    });
    
    // ----
    NSBlockOperation *blo = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 100000; i++) {
            if (self.blo.isCancelled) {
                NSLog(@"cancel");
                break;
            }else {
                NSLog(@"true");
            }
        }
    }];
    self.blo = blo;
    NSOperationQueue *que = [[NSOperationQueue alloc] init];
    [que addOperation:blo];
    que.maxConcurrentOperationCount = 2;
    self.que = que;
    
    // ----
    CALayer *lay = [[CALayer alloc] init];
    
}


- (void)actionInvocationOperation:(id)obj {
    NSLog(@"NSInvocationOperation 4 %@, obj == %@", [NSThread currentThread],obj);
//    NSTimer
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.flag = !self.flag;
//    [self.que cancelAllOperations];
//    [self.blo cancel];
//    [self.myThread cancel];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.flag = !self.flag;
////    [self.myThread cancel];
//}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"self.myThread == %@", self.myThread);
//    [self.myThread cancel];
//}


@end
