//
//  NSObject+DCJ.h
//  CategaryDemo
//
//  Created by chao jie deng on 2020/3/2.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>


@protocol DCJProtocol <NSObject>

- (void)someMethod;

@end


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DCJ)

+(void)someClassMet;
@property (nonatomic, copy) NSString *myContext;

@property (nonatomic, weak) id<DCJProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
