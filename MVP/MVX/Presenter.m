//
//  Presenter.m
//  MVX
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Presenter.h"

@interface Presenter ()
@property (nonatomic, weak) id<GreetingViewProtocol> view;
@property (nonatomic, strong) User *person;
@end

@implementation Presenter


- (instancetype)initWithView:(id<GreetingViewProtocol>)view person:(User *)person {
    if (self = [super init]) {
        _person = person;
        _view = view;
    }
    return self;
}

- (void)showGreeting {
    NSString *greeting = [NSString stringWithFormat:@"Hello, %@",self.person.name];
    [self.view setGreeting:greeting];
}


@end
