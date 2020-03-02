//
//  SecondViewController.h
//  ProtocolDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewControllerProtocol.h"







NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController


@property (nonatomic, weak) id<SecondVCProtocol> delegate;
@end

NS_ASSUME_NONNULL_END
