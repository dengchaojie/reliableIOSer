//
//  SecondViewController.m
//  CustomScrollView
//
//  Created by chao jie deng on 2020/4/21.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecondViewController.h"

typedef void(^Myblock)(void);

@interface SecondViewController ()

@property (nonatomic, copy) Myblock someBlock;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
//    dispatch_barrier_async(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
    
//    dispatch_group_async(<#dispatch_group_t  _Nonnull group#>, <#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
//    self.view.view
//    [NSTimer scheduledTimerWithTimeInterval:3 repeats:false block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"lslsl");
//    }];
    
    //会内存泄漏。为什么leaks，没有检测出来？
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:true];
    
    // 不会内存泄漏
//    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 repeats:true block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"lslsl");
//    }];
//    [timer fire];
     // 不会内存泄漏
//    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(timerAction) userInfo:nil repeats:false];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    // 不会内存泄漏
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self timerAction];
//    });
    // 不会内存泄漏
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self timerAction];
//    });
//    __weak typeof(self) wf = self;
    
    self.someBlock = ^{
        [self timerAction];
    };
    self.someBlock();
}


- (void)timerAction
{
    NSLog(@"lslsl");
}


- (void)dealloc {
    NSLog(@"dealloc");

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
