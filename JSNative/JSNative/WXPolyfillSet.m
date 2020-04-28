//
//  WXPolyfillSet.m
//  JSNative
//
//  Created by chao jie deng on 2020/4/27.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "WXPolyfillSet.h"

@interface WXPolyfillSet()

@property (nonatomic, strong) NSMutableSet *set;
@end


@implementation WXPolyfillSet

static WXPolyfillSet *_instance = nil;
+ (instancetype)create
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[WXPolyfillSet alloc] init];
        
    });
    return _instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _set = [NSMutableSet new];
    }
    return self;
}

- (void)add:(id)value
{
    [_instance.set addObject:value];
}

@end
