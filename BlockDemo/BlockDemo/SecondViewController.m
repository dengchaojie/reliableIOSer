//
//  SecondViewController.m
//  BlockDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecondViewController.h"
#import "DCJConcrete.h"
#import "DCJConcreteGlobal.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
//    [DCJConcrete doSomething];
//    [DCJConcreteGlobal doSomething];
    DCJConcreteGlobal *glo = DCJConcreteGlobal.new;
    [glo doSomething2];
    
    UIImage *img = [UIImage imageNamed:@"kdkdk"];
    UIImageView *imgView = UIImageView.new;
    imgView.image = img;
    UIButton *btn = UIButton.new;
    [btn setBackgroundImage:img forState:(UIControlStateNormal)];
    [btn setImage:img forState:(UIControlStateNormal)];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:true completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
