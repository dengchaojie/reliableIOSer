//
//  ViewController.m
//  RunloopDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    __weak __typeof__(self) weakSelf = self;
    __typeof__(self) strongSelf = weakSelf;
    
    
}
//    31. 猜想runloop内部是如何实现的？

//- (void)loop {
//    initialize();
//    do {
//        var msg = get_next_message();
//        proccess_message(msg);
//    } while (message != quit)
//
//}

int main(int argc, char * argv[]) {
//    while (AppIsRunning) {
         // 睡眠状态，等待唤醒
//        id whoWakeMeUp = SleepingForWaitingUp();
    //获取唤醒的事件
//        id event = GetEvent(whoWakeMeUp);
    // 处理事件
//        handleEvent(event);
//    }
    
    return 0;
}


@end
