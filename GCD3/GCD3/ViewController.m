//
//  ViewController.m
//  GCD3
//
//  Created by chao jie deng on 2020/4/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d", i);
        });
    }
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for (int i = 0; i < 100; i++) {
//            NSLog(@"%d", i);
//        }
//    });
}


@end
