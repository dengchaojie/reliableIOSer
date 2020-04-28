//
//  ViewController.m
//  Component
//
//  Created by chao jie deng on 2020/4/19.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "CTMediator+AActions.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIViewController *vc = [[CTMediator sharedInstance] CTMediator_viewControlerForDetail];
    [self presentViewController:vc animated:true completion:nil];
}
@end
