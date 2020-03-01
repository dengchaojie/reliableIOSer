//
//  ViewController.m
//  SubclassDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "DengPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DengPerson *deng = DengPerson.new;
    NSLog(@"%@", deng.lastname);
}


@end
