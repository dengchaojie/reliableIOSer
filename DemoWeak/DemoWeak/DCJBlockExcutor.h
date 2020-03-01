//
//  DCJBlockExcutor.h
//  DemoWeak
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^voidBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface DCJBlockExcutor : NSObject

- (instancetype)initWithBlock:(voidBlock)aBlock;


@end

NS_ASSUME_NONNULL_END
