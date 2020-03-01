//
//  ViewController.m
//  DemoWeak
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+RunAtDealloc.h"
#import "Foo.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str = @"dkdkd";
    // 疑问：为什么str不行
    Foo *obj = Foo.new;
    [obj dcj_runAtDealloc:^{
        NSLog(@"obj dealloced");
    }];
    
}


@end
