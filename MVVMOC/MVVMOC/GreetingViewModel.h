//
//  GreetingViewModel.h
//  MVVMOC
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"



NS_ASSUME_NONNULL_BEGIN

@interface GreetingViewModel : NSObject



- (instancetype)initWithPerson:(Person *)per;
- (void)showGreeting;

@end

NS_ASSUME_NONNULL_END
