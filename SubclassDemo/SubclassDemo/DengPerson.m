//
//  DengPerson.m
//  SubclassDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DengPerson.h"

@implementation DengPerson
@synthesize lastname = _lastname;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)setLastname:(NSString *)lastname {
    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"会调用这个方法,想一下为什么？");

    _lastname = lastname;
//    _lastname = @"邓";
}


@end
