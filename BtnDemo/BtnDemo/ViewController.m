//
//  ViewController.m
//  BtnDemo
//
//  Created by chao jie deng on 2020/3/20.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SomeView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SomeView *som = [[SomeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:som];

}


- (void)updateViewConstraints {
    
}

@end
