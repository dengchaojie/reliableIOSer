//
//  Target_A.m
//  Component
//
//  Created by chao jie deng on 2020/4/19.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Target_A.h"
#import "AViewController.h"


@implementation Target_A


- (UIViewController *)Action_nativeFecthDetailViewController:(NSDictionary *)para
{
    AViewController *vc = [AViewController new];
    vc.valueLabel.text = para[@"key"];
    
    
    return vc;
}
@end
