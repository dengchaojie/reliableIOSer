//
//  ViewController.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DCJ.h"
#import "DengPerson.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myContext = @"#import";
    
    DengPerson *deng = DengPerson.new;
    deng.lastname = @"邓";
    NSLog(@"%@",deng.lastname);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.myContext);
}



//- (void)setMyContext:(NSString *)myContext {
//
//}
//
//- (NSString *)myContext {
//
//}

@end
