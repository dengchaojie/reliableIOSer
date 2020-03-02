//
//  DengPerson.m
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "DengPerson.h"

@implementation DengPerson
@synthesize lastname = _lastname;

- (void)setLastname:(NSString *)lastname {
    if (![lastname isEqualToString:@"邓"]) {
        NSLog(@"lastname is not deng");
        return;
    }
    super.lastname = @"邓";
}

- (NSString *)lastname {
    return super.lastname;
}

@end
