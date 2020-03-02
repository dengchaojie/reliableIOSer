//
//  ViewController.m
//  ProtocolDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController () <SecondVCProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = SecondViewController.new;
    vc.delegate = self;
    [self presentViewController:vc animated:true completion:^{
        NSLog(@"%@", vc.delegate.msg);
    }];
}

- (void)sendMsgToViewController:(NSString *)msg {
    
    NSLog(@"%@", msg);
}

@synthesize msg = _msg;

@end
