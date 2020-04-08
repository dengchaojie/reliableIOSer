//
//  ViewController.m
//  Equal
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *per1 = Person.new;
    per1.name = @"dcj";
    per1.idNumber = @"123";
    
    Person *per2 = Person.new;
    per2.name = @"dcj";
    per2.idNumber = @"123";
    
    NSLog(@"%d", [per1 isEqual:per2]);
    

    NSMutableDictionary *dict = NSMutableDictionary.new;
    dict[per1] = @"zxx";
    dict[per2] = @"gyc";
    NSLog(@"%@", dict);
    
    
    [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(someAction) userInfo:nil repeats:true];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 40))];
    UIButton *btn2 = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 40))];
    [self.view addSubview:btn];
    [self.view addSubview:btn2];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:(UIControlEventTouchUpInside)];
    btn2.backgroundColor = UIColor.blueColor;
    
//    [btn canc]
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
}


- (void)tapAction
{
    
}


- (void)btnAction
{
    NSLog(@"btnAction");
}


- (void)btn2Action
{
    NSLog(@"btn2Action");

}


- (void)someAction
{
    
}

@end
