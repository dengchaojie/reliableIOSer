//
//  GreetingViewModel.m
//  MVVMOC
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "GreetingViewModel.h"

@interface GreetingViewModel ()

@property (nonatomic, copy) NSString *greeting;
@property (nonatomic, strong) Person *person;

@end

@implementation GreetingViewModel

- (instancetype)initWithPerson:(Person *)per {
    if (self = [super init]) {
        _person = per;
    }
    return self;
}



- (void)showGreeting {
    self.greeting = [NSString stringWithFormat:@"Hello, %@", self.person.name];
    
}


@end
