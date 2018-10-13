//
//  DMDrawPath.h
//  HelloWorld
//
//  Created by roki on 2018/10/11.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMDrawPathType.h"


@interface DMDrawPath : NSObject

@property(assign,nonatomic)DrawPathType pathType;

@property(assign,nonatomic)CGFloat pathWidth;

@property(strong, nonatomic)UIColor *pathColor;

@property(nonatomic)CGMutablePathRef pathRef;

- (instancetype)initWithColor:(UIColor *)pathColor width:(CGFloat)pathWidth;

- (void)moveToPoint:(CGPoint)startPoint;
- (void)addPoint:(CGPoint)middlePoint;
- (void)endPoint:(CGPoint)endPoint;

- (void)draw;

@end
