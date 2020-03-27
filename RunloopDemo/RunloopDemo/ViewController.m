//
//  ViewController.m
//  RunloopDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "ThreadAliveForEver.h"

@interface ViewController ()

@end




@implementation ViewController
// 伪代码
//- (void)loop {
//    initialize();
//    do {
//        var message = get_next_message();
//        process_message(message);
//    } while (message != quit);
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    __weak __typeof__(self) weakSelf = self;
//    __typeof__(self) strongSelf = weakSelf;
    NSLog(@"currentRunLoop == %p", [NSRunLoop currentRunLoop]);
//    NSLog(@"mainRunLoop == %p", [NSRunLoop mainRunLoop]);
//
//    NSRunLoop *runL = [[NSRunLoop alloc] init];
//    NSLog(@"runL == %@", runL);
//    [runL run];
//
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        NSLog(@"currentRunLoop dispatch_get_global_queue == %p", [NSRunLoop currentRunLoop]);
//
//    });
    
//    NSTimer *timer = [[NSTimer alloc] initWithFireDate:NSDate.now interval:3 repeats:true block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%@", NSDate.now);
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:(NSRunLoopCommonModes)];
    
//    UIScrollView *scro = UIScrollView.new;
//    scro.frame = self.view.bounds;
//    [self.view addSubview:scro];
//    scro.contentSize = CGSizeMake(self.view.bounds.size.width, 2*self.view.bounds.size.height);//CGRectMake(0, 0, self.view.bounds.size.width, 2*self.view.bounds.size.height);
//    scro.backgroundColor = UIColor.purpleColor;
    
    NSLog(@"thr == %@",[NSThread currentThread]);

    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self subThreadAction];
//    });
//
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSThread *thr = [NSThread currentThread];
        NSLog(@"dispatch_async thr == %@",[NSThread currentThread]);

        [self performSelector:@selector(actionOnThread) onThread:thr withObject:@"dcj" waitUntilDone:true];
    });
    
//    alpha和opaque的区别
//    The opaque property has no effect in system-provided classes such as UIButton, UILabel, UITableViewCell, and so on.
    self.view.backgroundColor = UIColor.whiteColor;
    UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:lab];
    lab.backgroundColor = UIColor.blueColor;
//    lab.opaque = false;
    lab.alpha = 0.2;
    NSDictionary
}

- (void)actionOnThread {
    NSLog(@"actionOnThread currentRunLoop == %@", [NSRunLoop currentRunLoop]);

    NSLog(@"actionOnThread thr == %@",[NSThread currentThread]);
    
//    self.view.alpha = 1;
}

- (void)testThreadAliveForEver {
    [self someMethod2];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(subThreadAction) onThread:[ThreadAliveForEver alived] withObject:[NSDate now] waitUntilDone:NO];
}

/**
 子线程任务
 */
- (void)subThreadAction
{
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
//    UIButton--uicontrol-uiview-uiresponder-nsobject

    for (int i=0; i<10; i++)
    {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"----子线程任务 %ld",(long)i);
    }
    NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
    
    [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
}


- (void)someMethod {
    NSLog(@"someMethod");
    NSThread *cos = [ThreadAliveForEver alived];
    NSLog(@"cos == %@",cos);
    
    NSLog(@"thr == %@",[NSThread currentThread]);
    
    [NSRunLoop mainRunLoop];
}

- (void)someMethod2 {
    NSLog(@"someMethod2");
    NSThread *cos = [ThreadAliveForEver alived];
    NSLog(@"cos == %@",cos);

    NSLog(@"currentThread == %@",[NSThread currentThread]);
    
}

//————————————————
//版权声明：本文为CSDN博主「GabrielxPanda」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/nathan1987_/article/details/78470639

/*
 currentRunLoop == <CFRunLoop 0x600002264100 [0x7fff80617cb0]>{wakeup port = 0x1a07, stopped = false, ignoreWakeUps = false,
 current mode = kCFRunLoopDefaultMode,
 common modes = <CFBasicHash 0x600001045650 [0x7fff80617cb0]>{type = mutable set, count = 2,
 entries =>
     0 : <CFString 0x7fff867f6c40 [0x7fff80617cb0]>{contents = "UITrackingRunLoopMode"}
     2 : <CFString 0x7fff8062b0a0 [0x7fff80617cb0]>{contents = "kCFRunLoopDefaultMode"}
 }
 ,
 common mode items = <CFBasicHash 0x600001025fb0 [0x7fff80617cb0]>{type = mutable set, count = 11,
 entries =>
     0 : <CFRunLoopSource 0x600002b603c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x0, callout = PurpleEventSignalCallback (0x7fff384c19f5)}}
     1 : <CFRunLoopSource 0x600002b60600 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = 0, context = <CFRunLoopSource context>{version = 0, info = 0x600003a69620, callout = FBSSerialQueueRunLoopSourceHandler (0x7fff3662186a)}}
     2 : <CFRunLoopObserver 0x600002f64780 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 1999000, callout = _beforeCACommitHandler (0x7fff480bc2eb), context = <CFRunLoopObserver context 0x7f96b6601c10>}
     3 : <CFRunLoopObserver 0x600002f64960 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (
     0 : <0x7f96b6803038>
 )}}
     4 : <CFRunLoopSource 0x600002b606c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x600002b68240, callout = __handleEventQueue (0x7fff48126d97)}}
     5 : <CFRunLoopObserver 0x600002f64820 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2001000, callout = _afterCACommitHandler (0x7fff480bc354), context = <CFRunLoopObserver context 0x7f96b6601c10>}
     6 : <CFRunLoopSource 0x600002b60840 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -2, context = <CFRunLoopSource context>{version = 0, info = 0x60000103c4b0, callout = __handleHIDEventFetcherDrain (0x7fff48126da3)}}
     8 : <CFRunLoopObserver 0x600002f64280 [0x7fff80617cb0]>{valid = Yes, activities = 0x20, repeats = Yes, order = 0, callout = _UIGestureRecognizerUpdateObserver (0x7fff47c2f06a), context = <CFRunLoopObserver context 0x60000356cbd0>}
     9 : <CFRunLoopSource 0x600002b60300 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 1, info = 0x5003, callout = PurpleEventCallback (0x7fff384c1a01)}}
     10 : <CFRunLoopObserver 0x600002f648c0 [0x7fff80617cb0]>{valid = Yes, activities = 0x1, repeats = Yes, order = -2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (
     0 : <0x7f96b6803038>
 )}}
     12 : <CFRunLoopObserver 0x600002f64b40 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2000000, callout = _ZN2CA11Transaction17observer_callbackEP19__CFRunLoopObservermPv (0x7fff2b0c046e), context = <CFRunLoopObserver context 0x0>}
 }
 ,
 modes = <CFBasicHash 0x600001045620 [0x7fff80617cb0]>{type = mutable set, count = 3,
 entries =>
     0 : <CFRunLoopMode 0x600002560270 [0x7fff80617cb0]>{name = UITrackingRunLoopMode, port set = 0x5403, queue = 0x600003065200, source = 0x600003065300 (not fired), timer port = 0x5203,
     sources0 = <CFBasicHash 0x600001025f80 [0x7fff80617cb0]>{type = mutable set, count = 4,
 entries =>
     0 : <CFRunLoopSource 0x600002b603c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x0, callout = PurpleEventSignalCallback (0x7fff384c19f5)}}
     1 : <CFRunLoopSource 0x600002b606c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x600002b68240, callout = __handleEventQueue (0x7fff48126d97)}}
     4 : <CFRunLoopSource 0x600002b60600 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = 0, context = <CFRunLoopSource context>{version = 0, info = 0x600003a69620, callout = FBSSerialQueueRunLoopSourceHandler (0x7fff3662186a)}}
     5 : <CFRunLoopSource 0x600002b60840 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -2, context = <CFRunLoopSource context>{version = 0, info = 0x60000103c4b0, callout = __handleHIDEventFetcherDrain (0x7fff48126da3)}}
 }
 ,
     sources1 = <CFBasicHash 0x600001026040 [0x7fff80617cb0]>{type = mutable set, count = 1,
 entries =>
     2 : <CFRunLoopSource 0x600002b60300 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 1, info = 0x5003, callout = PurpleEventCallback (0x7fff384c1a01)}}
 }
 ,
     observers = (
     "<CFRunLoopObserver 0x600002f648c0 [0x7fff80617cb0]>{valid = Yes, activities = 0x1, repeats = Yes, order = -2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7f96b6803038>\n)}}",
     "<CFRunLoopObserver 0x600002f64280 [0x7fff80617cb0]>{valid = Yes, activities = 0x20, repeats = Yes, order = 0, callout = _UIGestureRecognizerUpdateObserver (0x7fff47c2f06a), context = <CFRunLoopObserver context 0x60000356cbd0>}",
     "<CFRunLoopObserver 0x600002f64780 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 1999000, callout = _beforeCACommitHandler (0x7fff480bc2eb), context = <CFRunLoopObserver context 0x7f96b6601c10>}",
     "<CFRunLoopObserver 0x600002f64b40 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2000000, callout = _ZN2CA11Transaction17observer_callbackEP19__CFRunLoopObservermPv (0x7fff2b0c046e), context = <CFRunLoopObserver context 0x0>}",
     "<CFRunLoopObserver 0x600002f64820 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2001000, callout = _afterCACommitHandler (0x7fff480bc354), context = <CFRunLoopObserver context 0x7f96b6601c10>}",
     "<CFRunLoopObserver 0x600002f64960 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7f96b6803038>\n)}}"
 ),
     timers = (null),
     currently 604846951 (1361145810016213) / soft deadline in: 1.84453829e+10 sec (@ -1) / hard deadline in: 1.84453829e+10 sec (@ -1)
 },

     1 : <CFRunLoopMode 0x600002560340 [0x7fff80617cb0]>{name = GSEventReceiveRunLoopMode, port set = 0x5103, queue = 0x600003065380, source = 0x600003065480 (not fired), timer port = 0x2d03,
     sources0 = <CFBasicHash 0x600001026130 [0x7fff80617cb0]>{type = mutable set, count = 1,
 entries =>
     0 : <CFRunLoopSource 0x600002b603c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x0, callout = PurpleEventSignalCallback (0x7fff384c19f5)}}
 }
 ,
     sources1 = <CFBasicHash 0x600001026160 [0x7fff80617cb0]>{type = mutable set, count = 1,
 entries =>
     2 : <CFRunLoopSource 0x600002b60480 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 1, info = 0x5003, callout = PurpleEventCallback (0x7fff384c1a01)}}
 }
 ,
     observers = (null),
     timers = (null),
     currently 604846951 (1361145812968245) / soft deadline in: 1.84453829e+10 sec (@ -1) / hard deadline in: 1.84453829e+10 sec (@ -1)
 },

     2 : <CFRunLoopMode 0x600002564340 [0x7fff80617cb0]>{name = kCFRunLoopDefaultMode, port set = 0x2403, queue = 0x600003061080, source = 0x600003061180 (not fired), timer port = 0x1c03,
     sources0 = <CFBasicHash 0x600001026010 [0x7fff80617cb0]>{type = mutable set, count = 4,
 entries =>
     0 : <CFRunLoopSource 0x600002b603c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x0, callout = PurpleEventSignalCallback (0x7fff384c19f5)}}
     1 : <CFRunLoopSource 0x600002b606c0 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 0, info = 0x600002b68240, callout = __handleEventQueue (0x7fff48126d97)}}
     4 : <CFRunLoopSource 0x600002b60600 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = 0, context = <CFRunLoopSource context>{version = 0, info = 0x600003a69620, callout = FBSSerialQueueRunLoopSourceHandler (0x7fff3662186a)}}
     5 : <CFRunLoopSource 0x600002b60840 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -2, context = <CFRunLoopSource context>{version = 0, info = 0x60000103c4b0, callout = __handleHIDEventFetcherDrain (0x7fff48126da3)}}
 }
 ,
     sources1 = <CFBasicHash 0x600001026100 [0x7fff80617cb0]>{type = mutable set, count = 1,
 entries =>
     2 : <CFRunLoopSource 0x600002b60300 [0x7fff80617cb0]>{signalled = No, valid = Yes, order = -1, context = <CFRunLoopSource context>{version = 1, info = 0x5003, callout = PurpleEventCallback (0x7fff384c1a01)}}
 }
 ,
     observers = (
     "<CFRunLoopObserver 0x600002f648c0 [0x7fff80617cb0]>{valid = Yes, activities = 0x1, repeats = Yes, order = -2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7f96b6803038>\n)}}",
     "<CFRunLoopObserver 0x600002f64280 [0x7fff80617cb0]>{valid = Yes, activities = 0x20, repeats = Yes, order = 0, callout = _UIGestureRecognizerUpdateObserver (0x7fff47c2f06a), context = <CFRunLoopObserver context 0x60000356cbd0>}",
     "<CFRunLoopObserver 0x600002f64780 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 1999000, callout = _beforeCACommitHandler (0x7fff480bc2eb), context = <CFRunLoopObserver context 0x7f96b6601c10>}",
     "<CFRunLoopObserver 0x600002f64b40 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2000000, callout = _ZN2CA11Transaction17observer_callbackEP19__CFRunLoopObservermPv (0x7fff2b0c046e), context = <CFRunLoopObserver context 0x0>}",
     "<CFRunLoopObserver 0x600002f64820 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2001000, callout = _afterCACommitHandler (0x7fff480bc354), context = <CFRunLoopObserver context 0x7f96b6601c10>}",
     "<CFRunLoopObserver 0x600002f64960 [0x7fff80617cb0]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x7fff4808bf54), context = <CFArray 0x600001030b10 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7f96b6803038>\n)}}"
 ),
     timers = <CFArray 0x600003a66460 [0x7fff80617cb0]>{type = mutable-small, count = 1, values = (
     0 : <CFRunLoopTimer 0x600002b60180 [0x7fff80617cb0]>{valid = Yes, firing = No, interval = 0, tolerance = 0, next fire date = 604846953 (1.46277809 @ 1361147282647535), callout = (Delayed Perform) UIApplication _accessibilitySetUpQuickSpeak (0x7fff2576c7c2 / 0x7fff475e21aa) (/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/UIKitCore.framework/UIKitCore), context = <CFRunLoopTimer context 0x600000b3f200>}
 )},
     currently 604846951 (1361145813053880) / soft deadline in: 1.46959363 sec (@ 1361147282647535) / hard deadline in: 1.46959354 sec (@ 1361147282647535)
 },

 }
 }
 */
//    31. 猜想runloop内部是如何实现的？

//- (void)loop {
//    initialize();
//    do {
//        var msg = get_next_message();
//        proccess_message(msg);
//    } while (message != quit)
//
//}

//int main(int argc, char * argv[]) {
//    while (AppIsRunning) {
//          睡眠状态，等待唤醒
//        id whoWakeMeUp = SleepingForWaitingUp();
    //获取唤醒的事件
//        id event = GetEvent(whoWakeMeUp);
    // 处理事件
//        handleEvent(event);
//    }
//
//    return 0;
//}


@end
