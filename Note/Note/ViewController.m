//
//  ViewController.m
//  Note
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noteSel) name:@"note" object:nil];


}


- (void)noteSel
{
    NSLog(@"ViewController 1 -- llw %@", [NSThread currentThread]);

    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"ViewController 2 -- llw %@", [NSThread currentThread]);

    });
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecViewController *vc = SecViewController.new;
    
    [self presentViewController:vc animated:true completion:nil];
}

@end
