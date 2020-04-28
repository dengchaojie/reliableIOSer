//
//  ViewController.m
//  AnchorPoint
//
//  Created by chao jie deng on 2020/4/18.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSKVo
    UIView *someView = [[UIView alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:someView];
    someView.backgroundColor = UIColor.blackColor;
    NSLog(@"%f,%f", someView.layer.position.x, someView.layer.position.y);
//    someView.layer.position = CGPointMake(200, 200);
//    NSLog(@"%f,%f", someView.frame.origin.x, someView.frame.origin.y);
//    someView.layer.anchorPoint = CGPointMake(1, 1);
//    NSLog(@"%f,%f", someView.frame.origin.x, someView.frame.origin.y);
    [self setAnchorPoint:(CGPointMake(0.8, 0.8)) forView:someView];
}

- (void)setAnchorPoint:(CGPoint)anchorpoint forView:(UIView *)view
{
    CGRect oldFrame = view.frame;
    view.layer.anchorPoint = anchorpoint;
    view.frame = oldFrame;
    NSLog(@"%f,%f", view.frame.origin.x, view.frame.origin.y);
    NSLog(@"%f,%f", view.layer.anchorPoint.x, view.layer.anchorPoint.y);
    // 改变锚点，不改变frame，那么引起position的改变。
    NSLog(@"%f,%f", view.layer.position.x, view.layer.position.y);


}
//
//作者：猿大人
//链接：https://www.jianshu.com/p/2f8962055f21
//来源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
@end
