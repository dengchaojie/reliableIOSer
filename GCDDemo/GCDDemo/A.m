//
//  A.m
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/21.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "A.h"

#import "C.h"


@implementation A
{
    C *_c;
}

- (instancetype)initWithC:(C *)c
{
    self = [super init];
    if (self) {
        _c = c;

    }
    return self;
}

- (void)addProduct:(NSUInteger)proId {
    
    [_c addProduct:proId];
}


@end
