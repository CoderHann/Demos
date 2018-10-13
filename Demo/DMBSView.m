//
//  DMBSView.m
//  Demo
//
//  Created by roki on 2018/8/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMBSView.h"

@implementation DMBSView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
//    UIBezierPath* path = [UIBezierPath bezierPath];
////    path.lineWidth = 5.0;
//
////    path.lineCapStyle = kCGLineCapRound; //线条拐角
////    path.lineJoinStyle = kCGLineJoinRound; //终点处理
//
//    [path moveToPoint:CGPointMake(200.0, 50.0)];//起点
//
//    // Draw the lines
//    [path addLineToPoint:CGPointMake(300.0, 100.0)];
//    [path addLineToPoint:CGPointMake(260, 200)];
//    [path addLineToPoint:CGPointMake(100.0, 200)];
//    [path addLineToPoint:CGPointMake(100, 70.0)];
//    [path closePath];//第五条线通过调用closePath方法得到的
//
//    //    [path stroke];//Draws line 根据坐标点连线
//    [path stroke];//颜色填充
    
//        CGFloat halfHeight = self.height * 0.5;
    CGFloat height = 300;
    CGFloat halfHeight = 150;
    CGFloat width = 375;
    
        UIBezierPath *bez = [[UIBezierPath alloc] init];
        bez.lineWidth = 1;
    
        [bez moveToPoint:CGPointMake(halfHeight * 0.5, height)];
        [bez addArcWithCenter:CGPointMake(halfHeight, halfHeight) radius:halfHeight startAngle:M_PI * 0.5 endAngle:M_PI * 1.5 clockwise:YES];
        [bez addLineToPoint:CGPointMake(width - halfHeight*0.5, 0)];
        [bez addArcWithCenter:CGPointMake(width - halfHeight, halfHeight) radius:halfHeight startAngle:M_PI * 1.5 endAngle:M_PI * 2.5 clockwise:YES];
        [bez addLineToPoint:CGPointMake(halfHeight * 0.5, height)];
        [bez closePath];
    
    [bez stroke];
    
//        _shapeLayer.path = bez.CGPath;
//        self.layer.mask = _shapeLayer;
    
}


@end
