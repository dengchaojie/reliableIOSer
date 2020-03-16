//
//  SomeView.m
//  PerformanceOptimization
//
//  Created by chao jie deng on 2020/3/14.
//  Copyright © 2020 chao jie deng. All rights reserved.
//

#import "SomeView.h"

@implementation SomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 
 十七、什么是异步绘制?
 异步绘制，就是可以在子线程把需要绘制的图形，提前在子线程处理好。将准备好的图像数据直接返给主 线程使用，这样可以降低主线程的压力。
 异步绘制的过程
 要通过系统的 [view.delegate displayLayer:] 这个入口来实现异步绘制。
  代理负责生成对应的 Bitmap
  设置该 Bitmap 为 layer.contents 属性的值。
*/

//CALayerDelegate
- (void)displayLayer:(CALayer *)layer {
    
}

//CALayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}


@end
