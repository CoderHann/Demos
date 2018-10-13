//
//  DMDrawingBufferView.m
//  HelloWorld
//
//  Created by roki on 2018/10/12.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDrawingBufferView.h"
#import "DMDrawPath.h"

@interface DMDrawingBufferView()


@end

@implementation DMDrawingBufferView


- (void)drawRect:(CGRect)rect {
    [_currentPath draw];
}


@end
