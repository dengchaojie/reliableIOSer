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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"currentThread =1= %@", [NSThread currentThread]);

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
    [DCJOperationQueue doSomething];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 3;
    NSInvocationOperation *myInvocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(actionInvocationOperation:) object:@"InvocationOperation"];
    [queue addOperation:myInvocationOperation];
}


- (void)actionInvocationOperation:(id)obj {
    NSLog(@"NSInvocationOperation 4 %@, obj == %@", [NSThread currentThread],obj);

}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"self.myThread == %@", self.myThread);
//    [self.myThread cancel];
//}


@end
