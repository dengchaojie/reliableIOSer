//
//  ViewController.m
//  TimerDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    Timers work in conjunction with run loops. Run loops maintain strong references to their timers, so you don’t have to maintain your own strong reference to a timer after you have added it to a run loop.
    To use a timer effectively, you should be aware of how run loops operate. See Threading Programming Guide for more information.
    A timer is not a real-time mechanism. If a timer’s firing time occurs during a long run loop callout or while the run loop is in a mode that isn't monitoring the timer, the timer doesn't fire until the next time the run loop checks the timer. Therefore, the actual time at which a timer fires can be significantly later.
     */
//    NSTimer
    
}


@end
