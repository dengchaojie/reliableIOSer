//
//  A.h
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/21.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class C;
@interface A : NSObject

- (instancetype)initWithC:(C *)c;

- (void)addProduct:(NSUInteger)proId;

@end

NS_ASSUME_NONNULL_END
