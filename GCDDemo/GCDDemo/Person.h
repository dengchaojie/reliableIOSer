//
//  Person.h
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/14.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (id)readDataForKey:(NSString *)key;
- (void)setData:(id)data forKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
