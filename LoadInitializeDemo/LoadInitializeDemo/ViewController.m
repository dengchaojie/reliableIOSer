//
//  ViewController.m
//  LoadInitializeDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


+ (void)initialize {
    NSLog(@"%@, %s", [self class], __func__);

}


+ (void)load {
    NSLog(@"%@, %s", [self class], __func__);
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
