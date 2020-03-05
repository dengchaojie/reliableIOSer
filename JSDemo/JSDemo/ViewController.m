//
//  ViewController.m
//  JSDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    https://www.jianshu.com/p/3f5dc8042dfc
    JSContext *jsc = JSContext.new;
    JSValue *jsv = [jsc evaluateScript:@"2+2"];
    NSLog(@"%d",[jsv toInt32]);
    
    
//    将这个Block包装成一个JS方法
    jsc[@"makeUIColor"] = ^(NSDictionary *rgb) {
        float red = [rgb[@"red"] floatValue];
        float green = [rgb[@"green"] floatValue];
        float blue = [rgb[@"blue"] floatValue];

        return [UIColor colorWithRed:(red/255.0) green:green/255.0 blue:blue/255.0 alpha:1.0];
    };
}


@end
