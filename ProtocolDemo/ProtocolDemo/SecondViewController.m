//
//  SecondViewController.m
//  ProtocolDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
//@synthesize delegateDcj = _delegateDcj;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _delegateDcj.msg = @"xuji";

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_delegateDcj) {
        _delegateDcj.msg = @"lpj";
        [_delegateDcj sendMsgToViewController:_delegateDcj.msg];
    }
    
    [self dismissViewControllerAnimated:true completion:nil];
}

//
//- (id<SecondVCProtocol>)delegateDcj {
//    return _delegateDcj;
//}
//
//- (void)setDelegateDcj:(id<SecondVCProtocol>)delegateDcj {
//
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
