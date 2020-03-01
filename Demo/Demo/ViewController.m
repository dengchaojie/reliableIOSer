//
//  ViewController.m
//  Demo
//
//  Created by chao jie deng on 2020/2/29.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "DCJUser.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DCJUser *friend = [[DCJUser alloc] initWithName:@"lpj" age:20 sex:(DCJSexMan)];
    
    
    DCJUser *user = [[DCJUser alloc] initWithName:@"dcj" age:18 sex:(DCJSexMan)];
    
    DCJUser *copy = [user copy];
    [copy printNumbelOfFriends];
    
    [user addFriend:friend];
    
    DCJUser *copy2 = [user copy];
    [copy2 printNumbelOfFriends];

//    NSLog(copy.)
    
}


@end
