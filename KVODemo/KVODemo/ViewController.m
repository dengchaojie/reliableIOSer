//
//  ViewController.m
//  KVODemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
//#import <Corea>
@interface ViewController ()

@property (nonatomic, copy) NSString *now;
@end

@implementation ViewController
{
    NSString *other;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"other"]) {
        other = value;
    }
    [super setValue:value forKey:key];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.now = @"dcj";

    [self addObserver:self forKeyPath:@"now" options:(NSKeyValueObservingOptionNew) context:nil];
    [self addObserver:self forKeyPath:@"other" options:(NSKeyValueObservingOptionNew) context:nil];
//    NSLog(@"4");
//
//    [self willChangeValueForKey:@"now"];
//    NSLog(@"1");
//    [self didChangeValueForKey:@"now"];
//    NSLog(@"2");
    
    //    self.now = @"ldlle";
//    _now = @"keke";
//     other = @"zxx";// bu hui
    [self setValue:@"zxx" forKey:@"other"];// hui
    
//    NSLog(@"currentThread 1 == %@",[NSThread currentThread]);

//    __weak typeof(self) weakSelf = self;
    //在子线程
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"currentThread 2 == %@",[NSThread currentThread]);
//
//        __strong typeof(self) strongSelf = weakSelf;
//
//        strongSelf.now = @"123";
//    });
    
    // 在main
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"currentThread 2 == %@",[NSThread currentThread]);
//
//        __strong typeof(self) strongSelf = weakSelf;
//
//        strongSelf.now = @"123";
//    });
    
    //在main
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"currentThread 2 == %@",[NSThread currentThread]);
//
//        __strong typeof(self) strongSelf = weakSelf;
//
//        strongSelf.now = @"123";
//    });
    
//    dispatch_queue_serial_t serQue = dispatch_queue_create("serQue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_concurrent_t conQue = dispatch_queue_create("conQue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(serQue, ^{
//        NSLog(@"currentThread 2 == %@",[NSThread currentThread]);
//
//        __strong typeof(self) strongSelf = weakSelf;
//
//        strongSelf.now = @"123";
//    });
//    self.class;
    [self class];
    [ViewController class];
//    [ViewController class]
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"currentThread 3 == %@",[NSThread currentThread]);
    NSLog(@"3");
    NSLog(@"now == %@", self.now);
    NSLog(@"other == %@", other);

}

@end
