//
//  DCJBlockExcutor.m
//  DemoWeak
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJBlockExcutor.h"



@implementation DCJBlockExcutor {
    voidBlock _block;
    
}


- (instancetype)initWithBlock:(voidBlock)aBlock
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _block = [aBlock copy];
    return self;
}


- (void)dealloc {
    NSLog(@"DCJBlockExcutor dealloc");
    _block ? _block() : nil;
}

@end
