//
//  Presenter.h
//  MVX
//
//  Created by chao jie deng on 2020/3/10.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"
#import "GreetingViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface Presenter : NSObject



- (instancetype)initWithView:(id<GreetingViewProtocol>)view person:(User *)person;
- (void)showGreeting;

@end

NS_ASSUME_NONNULL_END
