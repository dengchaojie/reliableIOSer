//
//  ViewController.m
//  TreadDemo
//
//  Created by chao jie deng on 2020/3/3.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

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
//    都未找到比较好的休眠方式。故自己使用NSCondition实现了一个。
//    NSOperation
    
//    https://blog.csdn.net/afunx/article/details/48492391
    __block NSThread *thr = [NSThread currentThread];
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSThread sleepForTimeInterval:10];
        
        NSLog(@"cancel");
        [thr cancel];
    });
    
    NSLog(@"Sleep start");
    // 休眠3s
    [NSThread sleepForTimeInterval:6.0];
    NSLog(@"Sleep stop");

    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"self.myThread == %@", self.myThread);
//    [self.myThread cancel];
//}


@end
