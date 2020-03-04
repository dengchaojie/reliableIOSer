//
//  MyView.m
//  UIDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "MyView.h"

@interface MyView ()


@property (nonatomic, strong) UIButton *btn;
@end


@implementation MyView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColor.blueColor;
        //    If you specify nil, UIKit searches the responder chain for an object that responds to the specified action message and delivers the message to that object.
        UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpOutside)];
        btn.backgroundColor = UIColor.purpleColor;
        [self addSubview:btn];
        _btn = btn;
        
    }
    return self;
}

- (void)btnAction {
    NSLog(@"btnAction");
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return true;
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.btn;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
