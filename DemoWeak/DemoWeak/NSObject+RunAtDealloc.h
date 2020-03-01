//
//  NSObject+RunAtDealloc.h
//  DemoWeak
//
//  Created by chao jie deng on 2020/3/1.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

//#import <AppKit/AppKit.h>

#import "DCJBlockExcutor.h"


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RunAtDealloc)

- (void)dcj_runAtDealloc:(voidBlock)block;
@end

NS_ASSUME_NONNULL_END
