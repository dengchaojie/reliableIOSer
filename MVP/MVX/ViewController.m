//
//  ViewController.m
//  MVX
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Presenter.h"
#import "SecondViewController.h"
#import "GreetingViewProtocol.h"


@interface ViewController () <GreetingViewProtocol>
@property (nonatomic, strong) UILabel *greetingLable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    // MVP
    UILabel *greetingLable = [[UILabel alloc] initWithFrame:(CGRectMake(100, 100, 200, 40))];
    [self.view addSubview:greetingLable];
    _greetingLable = greetingLable;
    
    UIButton *btnCommit = [[UIButton alloc] initWithFrame:(CGRectMake(100, 200, 60, 40))];
    [btnCommit setTitle:@"问候" forState:(UIControlStateNormal)];
    [btnCommit addTarget:self action:@selector(showGreeting) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btnCommit];
    btnCommit.backgroundColor = UIColor.blueColor;
    
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 300, 60, 40))];
//    [btn setTitle:@"下一步" forState:(UIControlStateNormal)];
//    [btn addTarget:self action:@selector(next) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:btn];
}


- (void)showGreeting {
    // MVP
    User *per = [[User alloc] initWithName:@"dcj" age: (19)];
    Presenter *pre = [[Presenter alloc] initWithView:self person:per];
    [pre showGreeting];
}

- (void)setGreeting:(NSString *)str {
    self.greetingLable.text = str;
}

//- (void)next {
//    SecondViewController *vc = SecondViewController.new;
//    [self presentViewController:vc animated:true completion:nil];
//
//}


@end
