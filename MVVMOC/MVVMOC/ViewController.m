//
//  ViewController.m
//  MVVMOC
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "GreetingViewModel.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *greetingLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *greetingLable = [[UILabel alloc] initWithFrame:(CGRectMake(100, 100, 200, 40))];
    [self.view addSubview:greetingLable];
    _greetingLable = greetingLable;
    
    UIButton *btnCommit = [[UIButton alloc] initWithFrame:(CGRectMake(100, 200, 60, 40))];
    [btnCommit setTitle:@"问候" forState:(UIControlStateNormal)];
    [btnCommit addTarget:self action:@selector(showGreeting) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btnCommit];
    btnCommit.backgroundColor = UIColor.blueColor;
    
    
}
/*
 mvc，是c做了所有的操作。而mvvm和mvp，把对数据的操作拿出来了，放到了vm和p中，来完成数据的增删改查。从而分离了view和model的直接引用，有事就交给中间者vm或者p。
 */
- (void)showGreeting {
    // MVVM
    Person *per = [[Person alloc] initWithName:@"dcj" age: (19)];
    GreetingViewModel *vm = [[GreetingViewModel alloc] initWithPerson:per];
    [vm addObserver:self forKeyPath:@"greeting" options:(NSKeyValueObservingOptionNew) context:nil];
    [vm showGreeting];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.greetingLable.text = change[NSKeyValueChangeNewKey];

}

@end
