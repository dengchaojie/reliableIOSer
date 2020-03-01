//
//  DCJUser.m
//  Demo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DCJUser.h"

@implementation DCJUser {
    NSMutableSet *_friends;
}

- (id)copyWithZone:(NSZone *)zone {
    DCJUser *copy = [[[self class] allocWithZone:zone] initWithName:_name age:_age sex:_sex];
    copy->_friends = [_friends mutableCopy];
    return copy;
}

- (instancetype)deepCopy {
    DCJUser *deepC = [[[self class] alloc] initWithName:_name age:_age sex:_sex];
    deepC->_friends = [[NSMutableSet alloc] initWithSet:_friends copyItems:true];
    return deepC;
}

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age sex:(DCJSex)sex {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _name = [name copy];
    _age = age;
    _sex = sex;
    _friends = NSMutableSet.new;
    return self;
}

+ (instancetype)userWithName:(NSString *)name age:(NSUInteger)age sex:(DCJSex)sex {
    return [[self alloc] initWithName:name age:age sex:sex];
}

- (void)addFriend:(DCJUser *)fri {
    [_friends addObject:fri];
}

- (void)removeFriend:(DCJUser *)fri {
    [_friends removeObject:fri];
}

- (void)setName:(NSString * _Nonnull)name {
    _name = [name copy];
}

- (void)printNumbelOfFriends {
    NSLog(@"%lu", (unsigned long)_friends.count);
}

@end
