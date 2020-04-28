//
//  AViewController.m
//  Component
//
//  Created by chao jie deng on 2020/4/19.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@property (nonatomic, strong) UIButton *returnBtn;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (UIButton *)returnBtn {
    if (_returnBtn == nil) {
        _returnBtn = [UIButton new];
        [_returnBtn setTitle:@"return" forState:(UIControlStateNormal)];
        
    }
    return _returnBtn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    }else {
        [self dismissViewControllerAnimated:true completion:nil];
    }
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
