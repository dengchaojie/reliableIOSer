//
//  ViewController.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DCJ.h"
#import "DengPerson.h"
#import "SomeView.h"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
@interface ViewController () <DCJProtocol>

@end

@implementation ViewController
{
    NSString *someStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myContext = @"#import";
    
//    NSMapTable
//    UIApplication
    DengPerson *deng = DengPerson.new;
    deng.lastname = @"邓";
    NSLog(@"%@",deng.lastname);
    
    deng.delegate = self;
    SomeView *sv = [[SomeView alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:sv];
    sv.layer.cornerRadius = 20;
    sv.backgroundColor = UIColor.blueColor;
    __weak typeof(self) wea = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) str = wea;
        NSLog(@"%@", str->someStr);
    });

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.myContext);
}

- (void)someMethod {
    NSLog(@"someMethod");
    
}

//- (void)setMyContext:(NSString *)myContext {
//
//}
//
//- (NSString *)myContext {
//
//}


@end
