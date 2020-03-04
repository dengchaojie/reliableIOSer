//
//  ViewController.m
//  LockDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "DCJThread.h"
#import "SecondViewController.h"
#import "BarrierLock.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    都未找到比较好的休眠方式。故自己使用NSCondition实现了一个。
    //    NSThread进入sleep之后，cancel同一线程，是无法把Thread唤醒的。
    //    NSOperation
        
    //    https://blog.csdn.net/afunx/article/details/48492391
//    __block NSThread *thr = [NSThread currentThread];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"currentThread 1 %@---sleep start", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:1];
//
//        NSLog(@"cancel");
//        [thr cancel];
//    });
//    NSLog(@"currentThread 2 %@---sleep start", [NSThread currentThread]);
//    // 休眠3s
//    [NSThread sleepForTimeInterval:3];
//    NSLog(@"Sleep stop");
    
    // 在睡眠状态下，唤醒线程
//    DCJThread *obj = DCJThread.new;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"currentThread 1 %@---sleep start", [NSThread currentThread]);
//
//        [obj sleep:3];
//        [obj interrupt];
//    });
//    NSLog(@"currentThread 2 %@---sleep start", [NSThread currentThread]);
//
//    [obj sleep:6];

    [BarrierLock doSomething];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = SecondViewController.new;
    [self presentViewController:vc animated:true completion:nil];
    
}


@end
