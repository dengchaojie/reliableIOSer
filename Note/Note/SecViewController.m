//
//  SecViewController.m
//  Note
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noteSel) name:@"note" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noteSel) name:@"note" object:nil];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:btn];
    btn.backgroundColor = UIColor.blueColor;
    [btn addTarget:self action:@selector(btnSel) forControlEvents:(UIControlEventTouchUpInside)];
    
}

// 如果addObserver:self，2次，那么就触发selector2次。
// 如果addObserver:self，2次，removeObserver:self，1次，那么self都被移除了。
- (void)btnSel
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"note" object:nil];
}

- (void)noteSel
{
    NSLog(@"SecViewController -- llw %@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         [[NSNotificationCenter defaultCenter] postNotificationName:@"note" object:nil];
    });
   
    
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
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
