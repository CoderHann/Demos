//
//  DMDrawActionInfo.h
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMDrawPathType.h"

@class DMDrawPath;

@interface DMDrawActionInfo : NSObject

@property(weak,nonatomic)id<DrawPathTypeDelegate> delegate;

- (DMDrawPath *)createDrawPathWithColor:(UIColor *)pathColor width:(CGFloat)pathWidth startPoint:(CGPoint)startPoint;

- (void)drawPaths;

@end
