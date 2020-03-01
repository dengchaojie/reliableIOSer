//
//  DCJUser.h
//  Demo
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DCJSex) {
    DCJSexMan,
    DCJSexWoman,
};

NS_ASSUME_NONNULL_BEGIN

@interface DCJUser : NSObject <NSCopying>

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, assign) NSUInteger age;
@property (nonatomic, readonly, assign) DCJSex sex;

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age sex:(DCJSex)sex;
+ (instancetype)userWithName:(NSString *)name age:(NSUInteger)age sex:(DCJSex)sex;

- (void)addFriend:(DCJUser *)fri;
- (void)removeFriend:(DCJUser *)fri;
- (void)printNumbelOfFriends;
@end

NS_ASSUME_NONNULL_END
