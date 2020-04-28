//
//  WXPolyfillSet.h
//  JSNative
//
//  Created by chao jie deng on 2020/4/27.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol WXPolyfillSetJSExports <JSExport>
// JavaScript 可以使用的方法
+ (instancetype)create;
//- (BOOL)has:(id)value;
//- (NSUInteger)size;
- (void)add:(id)value;
//- (BOOL)delete:(id)value;
//- (void)clear;
@end


NS_ASSUME_NONNULL_BEGIN

@interface WXPolyfillSet : NSObject <WXPolyfillSetJSExports>

@end

NS_ASSUME_NONNULL_END
