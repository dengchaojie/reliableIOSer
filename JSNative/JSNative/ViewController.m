//
//  ViewController.m
//  JSNative
//
//  Created by chao jie deng on 2020/4/27.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WXPolyfillSet.h"
#import "BaseWebViewController.h"
#import "JKWKWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JSContext *context = [JSContext new];
    [context evaluateScript:@"var i = (3 + 4);"];
    NSNumber *num = [context[@"i"] toNumber];
    NSLog(@"%@", num);
    
    [context evaluateScript:@"function addition(x, y) { return x + y}"];
    JSValue *addition = context[@"addition"];
    JSValue *sum = [addition callWithArguments:@[@(2), @(7)]];
    NSNumber *num2 = [sum toNumber];
    NSLog(@"%@", num2);
     
//    NSNumber *num3 = [[[context globalObject] invokeMethod:@"function addition(x, y) { return x + y}" withArguments:@[@1, @2]] toNumber];
//    NSLog(@"%@", num3);
    
    context[@"subtraction"] = ^(int x, int y) {
      return x - y;
    };
    
    JSValue *sub = [context evaluateScript:@"subtraction(3, 8);"];
    NSLog(@"%@", [sub toNumber]);
    
    
//    [context evaluateScript:@"var set = WXPolyfillSet.create(); "];
////    set.add(3);
//    NSLog(@"%@", [context[@"set"] toObject]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    BaseWebViewController *vc = [BaseWebViewController new];
    JKWKWebViewController *vc = [JKWKWebViewController new];
    NSString *url = [NSString stringWithFormat:@"file://%@",[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
    vc.url = url;
    NSLog(@"url :%@",url);
    [self presentViewController:vc animated:true completion:nil];
}

@end
