//
//  ViewController.m
//  UIDemo
//
//  Created by chao jie deng on 2020/3/4.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    https://www.jianshu.com/p/32abbc188f57
// 这个是继承链
//    UIButton--UIControl--UIView--UIResponder
//    UIApplication--UIResponder
//    UIWindowScene--UIScene--UIResponder
// 下面是响应链
    //UIButton--UIView--UIViewController--UIWindow--UIApplication--AppDelegate
    MyView *myV = [[MyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:myV];
    

}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
//// 若上述方法返回YES,则向当前视图的所有子视图(subviews)发送下面该事件，直到有子视图返回非空对象或者全部子视图遍历完毕
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//}




//RunLoop这边我大概讲一下
//
//1.主线程的RunLoop被唤醒
//2.通知Observer，处理Timer和Source 0
//3.Springboard接受touch event之后转给App进程中
//4.RunLoop处理Source 1，Source1 就会触发回调，并调用- _UIApplicationHandleEventQueue() 进行应用内部的分发。
//5.RunLoop处理完毕进入睡眠，此前会释放旧的autorelease pool并新建一个autorelease pool
//
//作者：Jorunk
//链接：https://www.jianshu.com/p/32abbc188f57
//来源：简书
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
@end
