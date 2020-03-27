//
//  SomeView.m
//  BtnDemo
//
//  Created by chao jie deng on 2020/3/20.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SomeView.h"

@implementation SomeView
{
    UIButton *_btn;
    UIButton *_btn2;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        _btn = btn;
        UIButton *btn2 = [[UIButton alloc] initWithFrame:(CGRectMake(100, 150, 100, 100))];
        [self addSubview:btn2];
        _btn2 = btn2;

        [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = UIColor.blueColor;
        btn2.backgroundColor = UIColor.orangeColor;
//        btn.isExclusiveTouch
//        CGPoint poi = CGPointMake(100, 100);
        
    }
    return self;
}
// 方法1，a响应了，在响应方法里，在调用b的action
// 方法2

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x >= 100 && point.x <= 200 && point.y >= 150 && point.y <= 200) {
//        [_btn sendAction:@selector(btnAction) to:self forEvent:event];
        
    }
    return [super hitTest:point withEvent:event];

}

// tell UIKit that you are using AutoLayout
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {

    // --- remake/update constraints here
    [self.button remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.buttonSize.width));
        make.height.equalTo(@(self.buttonSize.height));
    }];
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)didTapButton:(UIButton *)button {
    // --- Do your changes ie change variables that affect your layout etc ---
    self.buttonSize = CGSize(200, 200);

    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
}

- (void)btnAction {
    NSLog(@"btnAction");
}

- (void)btn2Action {
    NSLog(@"btn2Action");

}



@end
