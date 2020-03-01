//
//  Foo.m
//  PropertyDemo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "Foo.h"

@interface Foo ()

@property (nonatomic, copy) NSString *title;
@end

@implementation Foo
//{
//    NSString *_title;
//
//}
@synthesize title = _title;

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}

// 如果同时重写了setter和getter方法，需要使用@synthesize
- (NSString *)title {
    return _title;
}

- (void)setTitle:(NSString *)title {
    _title = title;
}
@end
