//
//  DMDrawPath.m
//  HelloWorld
//
//  Created by roki on 2018/10/11.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDrawPath.h"

@implementation DMDrawPath
- (instancetype)initWithColor:(UIColor *)pathColor width:(CGFloat)pathWidth {
    if (self = [super init]) {
        _pathColor = pathColor;
        _pathWidth = pathWidth;
        _pathRef = CGPathCreateMutable();
    }
    
    return self;
}

- (void)moveToPoint:(CGPoint)startPoint {
    CGPathMoveToPoint(_pathRef, NULL, startPoint.x, startPoint.y);
    
}

- (void)addPoint:(CGPoint)middlePoint {
    
    CGPathAddLineToPoint(_pathRef, NULL, middlePoint.x, middlePoint.y);
}

- (void)endPoint:(CGPoint)endPoint {
    
    CGPathAddLineToPoint(_pathRef, NULL, endPoint.x, endPoint.y);
    CGPathCloseSubpath(_pathRef);
}

- (void)draw {
    
    if (_pathType == DrawPathTypeBrush) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, _pathRef);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, _pathWidth);
        CGContextSetStrokeColorWithColor(context, _pathColor.CGColor);
        CGContextSetFillColorWithColor(context, _pathColor.CGColor);
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        CGContextStrokePath(context);
    } else {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, _pathRef);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 10);
//        CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextSetBlendMode(context, kCGBlendModeClear);
        CGContextStrokePath(context);
    }
    
    
}

@end
