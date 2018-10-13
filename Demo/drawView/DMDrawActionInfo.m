//
//  DMDrawActionInfo.m
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDrawActionInfo.h"
#import "DMDrawPath.h"

@interface DMDrawActionInfo()

@property(strong, nonatomic)NSMutableArray *drewPaths;

@end

@implementation DMDrawActionInfo

- (instancetype)init {
    if (self = [super init]) {
        _drewPaths = [NSMutableArray array];
    }
    
    return self;
}

- (DMDrawPath *)createDrawPathWithColor:(UIColor *)pathColor width:(CGFloat)pathWidth startPoint:(CGPoint)startPoint {
    DMDrawPath *drawPath = [[DMDrawPath alloc] initWithColor:pathColor width:pathWidth];
    if ([self.delegate respondsToSelector:@selector(drawPathTypeForCurrent:)]) {
        drawPath.pathType = [self.delegate drawPathTypeForCurrent:self];
    }
    [drawPath moveToPoint:startPoint];
    
    [_drewPaths addObject:drawPath];
    
    return drawPath;
}


- (void)drawPaths {
    
    for (DMDrawPath *drawPath in _drewPaths) {
        [drawPath draw];
    }
}

@end
