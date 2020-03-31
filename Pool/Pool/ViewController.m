//
//  ViewController.m
//  Pool
//
//  Created by chao jie deng on 2020/3/31.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SomeObj.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    @autoreleasepool {
        @autoreleasepool {
            @autoreleasepool {
                SomeObj *obj = SomeObj.new;
            }
            NSLog(@"1");
        }
        NSLog(@"2");
    }
    NSLog(@"3");

}


@end
