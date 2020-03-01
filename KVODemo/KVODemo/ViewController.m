//
//  ViewController.m
//  KVODemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *now;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addObserver:self forKeyPath:@"now" options:(NSKeyValueObservingOptionNew) context:nil];
    NSLog(@"4");

    [self willChangeValueForKey:@"now"];
    NSLog(@"1");
    [self didChangeValueForKey:@"now"];
//    NSLog(@"2");

    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"3");

}

@end
