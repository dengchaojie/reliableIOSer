//
//  ViewController.m
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/13.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@property (nonatomic, copy) dispatch_block_t myBlock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myBlock = ^(void){
        
    };
//    Person *per = Person.new;
//    per.name = @"dcj";
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"%d--%@",i, [per readDataForKey:@"name"]);
//
//    }
//    [per setData:@"bd" forKey:@"name"];
//    for (int i = 10; i < 20; i++) {
//        NSLog(@"%d--%@",i, [per readDataForKey:@"name"]);
//
//    }

}


@end
