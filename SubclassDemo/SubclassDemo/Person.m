//
//  Person.m
//  SubclassDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Person.h"

@implementation Person


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lastname = @"";
    }
    return self;
}


- (void)setLastname:(NSString *)lastname {
    _lastname = @"炎黄";
}

@end
