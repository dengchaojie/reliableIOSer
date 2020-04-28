//
//  ViewController.m
//  LaunghTime
//
//  Created by chao jie deng on 2020/4/18.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

NSDate *startTime;

@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    startTime = [NSDate now];
    NSLog(@"start");

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSTimeInterval inter = [[NSDate now] timeIntervalSinceDate:startTime];
    
    NSLog(@"%f", inter);
    NSLog(@"end");

}


@end
