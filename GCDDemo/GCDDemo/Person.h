//
//  Person.h
//  GCDDemo
//
//  Created by chao jie deng on 2020/3/14.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PersonComplete)(NSString *_Nullable value);


NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)readDataForKey:(NSString *)key complete:(PersonComplete)comp;
- (void)setData:(id)data forKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
