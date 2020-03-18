//
//  SecondViewController.m
//  TimerDemo
//
//  Created by chao jie deng on 2020/3/18.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:true];
    self.view.backgroundColor = UIColor.blueColor;

}

- (void)timerRun {
    NSLog(@"timerRun");
}
     
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_timer invalidate];
    _timer = nil;
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc");

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
