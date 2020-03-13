//
//  ViewController.m
//  BlockDemo
//
//  Created by chao jie deng on 2020/3/3.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"



typedef void(^myBlock)(void);
@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __block int num = 0;
    NSLog(@"定义前：%p", &num);         //栈区
    void (^foo2)(void) = ^{
        num = 1;
        NSLog(@"block内部：%p", &num);    //堆区
    };
    NSLog(@"定义后：%p", &num);         //堆区
    foo2();
    /*
     定义前：0x7ffeeecd3128
     定义后：0x600001566838
     block内部：0x600001566838（同第二行，堆地址要小于栈地址）
     */
//    NSMutableString *mutStr = [[NSMutableString alloc] initWithString:@"dcj"];
//    NSLog(@"%@", mutStr);
//    mutStr.string = @"lpj";
//    NSLog(@"%@", mutStr);
    
    
//    __block Block不允许修改外部变量的值，这里所说的外部变量的值，指的是栈中指针的内存地址。
    NSMutableString *a = [[NSMutableString alloc] initWithString:@"dcj"];
    NSLog(@"堆中地址%p--栈中地址%p",a , &a);
    void(^foo)(void) = ^(void){
        a.string = @"lpj";
        NSLog(@"堆中地址%p--栈中地址%p",a , &a);
//        a = [[NSMutableString alloc]  initWithString:@"xuji"];
    };
    foo();
    NSLog(@"堆中地址%p--栈中地址%p",a , &a);
    NSLog(@"%@",a);
    [self.view layoutIfNeeded];
    [self.view setNeedsLayout];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = SecondViewController.new;
    [self presentViewController:vc animated:true completion:nil];
    
}

//- (BOOL)respondsToSelector:(SEL)aSelector {
//    NSLog(@"%@",self);
//    return true;
//}
/*
 
 堆中地址0x60000382e610--栈中地址0x7ffeed01f128
 堆中地址0x60000382e610--栈中地址0x60000382e570
 堆中地址0x60000382e610--栈中地址0x7ffeed01f128（同第一行的栈中地址）
 lpj
 
 __block
 堆中地址0x6000019011d0--栈中地址0x7ffeea43f128
 堆中地址0x6000019011d0--栈中地址0x600001901048
 堆中地址0x6000019376f0--栈中地址0x600001901048（同第二行的栈中地址）
 xuji
 
 */

@end
