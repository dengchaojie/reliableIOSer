//
//  ViewController.m
//  Equal
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *per1 = Person.new;
    per1.name = @"dcj";
    per1.idNumber = @"123";
    
    Person *per2 = Person.new;
    per2.name = @"dcj";
    per2.idNumber = @"123";
    
    NSLog(@"%d", [per1 isEqual:per2]);
    

    NSMutableDictionary *dict = NSMutableDictionary.new;
    dict[per1] = @"zxx";
    dict[per2] = @"gyc";
    NSLog(@"%@", dict);
    
}


@end
