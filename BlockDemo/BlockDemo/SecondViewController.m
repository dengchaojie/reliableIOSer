//
//  SecondViewController.m
//  BlockDemo
//
//  Created by chao jie deng on 2020/3/5.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SecondViewController.h"
#import "DCJConcrete.h"
#import "DCJConcreteGlobal.h"

typedef void(^SecBlock)(NSString *str);

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
//    [DCJConcrete doSomething];
//    [DCJConcreteGlobal doSomething];
    DCJConcreteGlobal *glo = DCJConcreteGlobal.new;
    [glo doSomething2];
    
    UIImage *img = [UIImage imageNamed:@"kdkdk"];
    UIImageView *imgView = UIImageView.new;
    imgView.image = img;
    UIButton *btn = UIButton.new;
    [btn setBackgroundImage:img forState:(UIControlStateNormal)];
    [btn setImage:img forState:(UIControlStateNormal)];
    
    void (^block3)(void) = ^(void){
        NSLog(@"kdklwlwl");
    };
    NSLog(@"block3==%@", block3);
    
    
    int num = 1;
    void (^block2)(void) = ^(void){
        NSLog(@"%d", num);
    };
    NSLog(@"block2==%@", [block2 class]);
    block2();
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
    void (^block)(void) = ^(void){
        NSLog(@"%@", arr);
        [arr addObject:@"4"];

    };
    [arr addObject:@"3"];
    arr = nil;
    block();
    NSLog(@"block == %@", block);
    
    
    // stack
    NSLog(@"stack == %@", [^(void){
        NSLog(@"stack 2 == %d", num);

    } class]);
    
    
    [self testWithBlock:^(NSString *str){
       NSLog(@"testWithBlock == %@  %@",str, self);
    }];
}
//如果没有访问外部变量，为全局；如果访问外部变量为堆；如果没有进行copy的block为stack；
//将栈block赋值给其他变量，那么新变量是个堆block；
//3、对栈 block 进行 copy 操作，就是堆 block，而对全局 block 进行 copy，仍是全局 block

- (void)testWithBlock:(SecBlock)block
{
    //stack
    block(@"stack?");
    SecBlock temp = block;
    NSLog(@"testWithBlock==%@,%@", [block class], [temp class]);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:true completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
