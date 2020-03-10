//
//  Person.h
//  MVVMOC
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger *age;

- (instancetype)initWithName:(NSString *)name age:(NSUInteger *)age;


@end

NS_ASSUME_NONNULL_END
