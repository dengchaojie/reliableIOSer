//
//  ViewController.m
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/13.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "A.h"

#import "B.h"

#import "C.h"


@interface ViewController ()

@property (nonatomic, copy) dispatch_block_t myBlock;
@property (nonatomic, strong) Person *per;
@property (nonatomic, strong) NSCondition *cond;
@property (nonatomic, assign) NSUInteger productNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.myBlock = ^(void){
//
//    };
//    self.cond = NSCondition.new;
//    Person *per = Person.new;
//    self.per = per;
//    per.name = @"dcj";
//    for (int i = 0; i < 10000; i++) {
////        [NSThread sleepForTimeInterval:1.0];
//
//        [per readDataForKey:@"name" complete:^(NSString * _Nullable value) {
//            NSLog(@"%d--%@",i, value);
//
//        }];
//
//    }
//
//    [self.per setData:@"dd" forKey:@"name"];

    
    // ---
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//    });
//
//    dispatch_queue_t ser = dispatch_queue_create("ser", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(ser, ^{
//
//    });
//    NSOperationQueue *que = NSOperationQueue.new;
//    que.maxConcurrentOperationCount = 1;
//    NSInvocationOperation *inv = [[NSInvocationOperation alloc] init]
//    NSBlockOperation
//    [que addOperation:[ns]];
    
    C *ccc = C.new;

    A *aaa = [[A alloc] initWithC:ccc];
    B *bbb = [[B alloc] initWithC:ccc];

    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [aaa addProduct:i];

        });
    }

    for (int i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [bbb subProduct];

        });
    }

    
    
    //-----
//    [self producerHandle];
//    [self customerHandle];

   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.per setData:@"dd" forKey:@"name"];

//    for (int i = 10; i < 15; i++) {
//        [NSThread sleepForTimeInterval:1.0];
//        NSString *str = [NSString stringWithFormat:@"bd %d", i];
//
//        [self.per setData:str forKey:@"name"];
//
//    }

}

// 生产者生产数据
-(void)producerHandle {
    while (1) {
        NSString *currentThreadName = [NSThread currentThread].name;
                NSLog(@"%@" ,currentThreadName);
        
        //生产者限制生产数
        [self.cond lock];
        if (self.productNum > 10) {
            NSLog(@"!!!!生产太多，限制");
            [self.cond unlock];
            sleep(3);
            continue;
        }else {
            [self.cond unlock];
        }
        
        [self.cond lock];
        NSLog(@"============================");
        NSLog(@"%@...Begin - %lu" ,currentThreadName ,(unsigned long)self.productNum);
        self.productNum++;
        [self.cond signal];
        NSLog(@"%@...end - %lu" ,currentThreadName ,self.productNum);
        NSLog(@"============================");
        [self.cond unlock];
    }
}

// 消费者消费资源
-(void)customerHandle {
    while (1) {
        NSString *currentThreadName = [NSThread currentThread].name;
                NSLog(@"%@" ,currentThreadName);
        [self.cond lock];
        NSLog(@"============================");
        NSLog(@"%@...Begin - %lu" ,currentThreadName ,self.productNum);
        while (self.productNum <= 0) {
            [self.cond wait];
        }
        self.productNum--;
        NSLog(@"%@...end - %lu" ,currentThreadName ,self.productNum);
        NSLog(@"============================");
        [self.cond unlock];
    }
}
@end
