//
//  CTMediator+AActions.m
//  Component
//
//  Created by chao jie deng on 2020/4/19.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "CTMediator+AActions.h"

NSString * const kCTMediatorTargetA = @"A";
NSString * const kCTMediatorTargetActionNativeFecthDetailViewController = @"nativeFecthDetailViewController";


@implementation CTMediator (AActions)

- (UIViewController *)CTMediator_viewControlerForDetail
{
    UIViewController *vc = [self performTarget:kCTMediatorTargetA action:kCTMediatorTargetActionNativeFecthDetailViewController params:@{@"key": @"value"} shouldCacheTarget:NO];
    
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }else {
        return [UIViewController new];
    }
}

@end
