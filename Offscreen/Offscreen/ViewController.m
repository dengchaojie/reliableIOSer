//
//  ViewController.m
//  Offscreen
//
//  Created by chao jie deng on 2020/4/9.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:(CGRectMake(100, 100, 230, 230))];
    [self.view addSubview:imgView];
    imgView.image = [UIImage imageNamed:@"1374485122@2x.jpeg"];
    imgView.layer.cornerRadius = 10;
    imgView.layer.masksToBounds = true;
    
    imgView.backgroundColor = UIColor.blueColor;//触发离屏渲染
}


@end
