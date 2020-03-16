//
//  ViewController.m
//  PerformanceOptimization
//
//  Created by chao jie deng on 2020/3/14.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    //    self.view.opaque
    //    [self.view.layer masksToBounds];
    //    [self.view clipsToBounds];
    //    CALayer *lay = CALayer.new;
    //    lay.borderer
    //    dispatch_io_t
    //    UIButton *btn = [[UIButton alloc] initWithFrame:(CGRectMake(100, 100, 290, 333))];
    //    [btn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1@2x.jpg"]]];
    //    [self.view addSubview:btn];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:(CGRectMake(10, 100, 290, 333))];
        imgView.image = [UIImage imageNamed:@"1@2x.jpg"];
        [self.view addSubview:imgView];
        imgView.layer.cornerRadius = 20;
        imgView.layer.masksToBounds = true;
        
    //    [self.view.layer.delegate displayLayer:<#(nonnull CALayer *)#>]
    
    [self performSelectorOnMainThread:@selector(someSec) withObject:nil waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];
//    NSRunLoop
//    UIEvent
//    UITouch
//    UITapGestureRecognizer
    
    
//    [self.view setNeedsDisplay];
//    [self.view.layer ]
    
    
//    UITableView *tView = UITableView.new;
//    tView.dataSource = self;
//    tView.delegate = self;
    
}

- (void)someSec {
    
}

//- disp

@end
