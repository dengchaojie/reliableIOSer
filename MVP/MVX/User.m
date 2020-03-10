//
//  User.m
//  MVX
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "User.h"

@implementation User


- (instancetype)initWithName:(NSString *)name age:(NSUInteger *)age {
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    return self;
}

@end
