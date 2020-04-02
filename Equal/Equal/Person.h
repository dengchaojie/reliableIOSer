//
//  Person.h
//  Equal
//
//  Created by chao jie deng on 2020/4/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSCopying>


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *idNumber;
@end

NS_ASSUME_NONNULL_END
