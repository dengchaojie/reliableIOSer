//
//  ViewController.m
//  GCDDemo2
//
//  Created by chao jie deng on 2020/3/21.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t ser1;
@property (nonatomic, strong) dispatch_queue_t ser2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    https://www.jianshu.com/p/63516c8f4b26
//    dispatch_queue_t ser1 = dispatch_queue_create("ser1", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t ser2 = dispatch_queue_create("ser2", DISPATCH_QUEUE_SERIAL);
//    self.ser1 = ser1;
//    self.ser2 = ser2;
//    dispatch_set_target_queue(ser1, ser2);
    
    // 在串行队列上，只加了1个任务，就是block
//    dispatch_async(ser1, ^{
//        for (int i = 0; i < 20; i++) {
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"%d", i);
//         }
//    });
    // 在串行队列上，只加了20个任务，就是for循环
//    for (int i = 0; i < 20; i++) {
//        dispatch_async(ser1, ^{
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"%d %@", i, [NSThread currentThread]);
//        });
//    }
//
//    dispatch_async(ser1, ^{
//        NSLog(@"ser1，执行完所有任务");
//
//    });
    
    //------
//    NSBlockOperation *blockOpe = [NSBlockOperation blockOperationWithBlock:^{
//
//    }];
    
//    [blockOpe addObserver:self forKeyPath:@"" options:<#(NSKeyValueObservingOptions)#> context:<#(nullable void *)#>]
//    NSInvocationOperation
//    NSOperationQueue
    //-----
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"1--%@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"2--%@", [NSThread currentThread]);
//
//        });
//    });
    //----
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1---%@",        [NSRunLoop currentRunLoop]);
        [self performSelector:@selector(test) withObject:nil afterDelay:2.0];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"2---%@",        [NSRunLoop currentRunLoop]);

    });
}


- (void)test
{
    NSLog(@"test");

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    dispatch_suspend(self.ser1);
    dispatch_async(self.ser2, ^{
        NSLog(@"ser2 完成");
        dispatch_resume(self.ser1);
    });
//    重新开始;(中断后)继续;恢复席位 / 地位 / 职位

}

@end
