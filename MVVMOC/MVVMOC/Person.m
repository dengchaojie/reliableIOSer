//
//  Person.m
//  MVVMOC
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Person.h"

@implementation Person


- (instancetype)initWithName:(NSString *)name age:(NSUInteger *)age {
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    return self;
}


@end
