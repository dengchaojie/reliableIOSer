//
//  ViewController.m
//  CustomScrollView
//
//  Created by chao jie deng on 2020/4/19.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SomeView.h"
#import "SecondViewController.h"
#import <SpriteKit/SpriteKit.h>
#import <SceneKit/SceneKit.h>
#import <MetalKit/MetalKit.h>

//#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
//#import <FBMemoryProfiler/FBMemoryProfiler.h>
//#import <FBAllocationTracker/FBAllocationTracker.h>
@interface ViewController ()

@property (nonatomic, strong) SomeView *someView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SomeView *someView = [SomeView new];
    someView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:someView];
    someView.backgroundColor = UIColor.purpleColor;
    
    UIView *subView = [[UIView alloc] initWithFrame:(CGRectMake(10, 10, 40, 40))];
    subView.backgroundColor = UIColor.blackColor;
    [someView addSubview:subView];
    
    self.someView = someView;
    
    

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.view.backgroundColor = UIColor.blackColor;
//
//    });
    
//    NSBlockOperation *ope = [NSBlockOperation blockOperationWithBlock:^{
//        self.view.backgroundColor = UIColor.blackColor;
//    }];
    
//    [self someFunc];
    NSArray *arr = @[@"dcj", @"zxx"];
    
    [NSKeyedArchiver archivedDataWithRootObject:arr];
}


- (void)someFunc
{
    NSLog(@"dkkdkd");
    [self someFunc];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
//    self.someView.bounds = CGRectMake(10, 10, 100, 100);
//    if ([[[event allTouches] anyObject] phase] == UITouchPhaseEnded) {
//
//    }
//    NSLog(@"%f-%f", self.someView.frame.origin.x, self.someView.frame.origin.y);
    
//    SecondViewController *vc = [SecondViewController new];
//    [self presentViewController:vc animated:true completion:nil];
//    NSLog(@"%@--%@",self,self.someView.window.rootViewController);
//    [NSKeyedUnarchiver obj]
}


//- (void)updateViewConstraints

@end
