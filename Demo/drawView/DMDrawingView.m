//
//  DMDrawingView.m
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDrawingView.h"
#import "DMDrawActionInfo.h"
#import "DMDrawPath.h"
#import "DMDrawingBufferView.h"

@interface DMDrawingView()
@property(strong, nonatomic)DMDrawPath *currentPath;

@property(weak,nonatomic)DMDrawingBufferView *bufferDrawview;

@property(strong, nonatomic)UIImage *image;
@property(strong, nonatomic)CAShapeLayer *shapeLayer;
@property(assign,nonatomic)CGPoint prePoint;
@end

@implementation DMDrawingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    _image = [UIImage imageNamed:@"IMG_1.JPG"];
    self.backgroundColor = [UIColor clearColor];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    _shapeLayer = shapeLayer;
    
//    [self.layer setMask:shapeLayer];
    
    DMDrawingBufferView *bufferDrawview = [[DMDrawingBufferView alloc] init];
    bufferDrawview.backgroundColor = [UIColor clearColor];
    [self addSubview:bufferDrawview];
    _bufferDrawview = bufferDrawview;

    // layout
    [bufferDrawview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark -Touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    _currentPath = [_actionInfo createDrawPathWithColor:[UIColor redColor] width:2 startPoint:point];
    _bufferDrawview.currentPath = _currentPath;
    _prePoint = point;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    [_currentPath addPoint:point];
    if (_currentPath.pathType == DrawPathTypeBrush) {
        [_bufferDrawview setNeedsDisplay];
    } else {
        
        CGFloat minX = MIN(_prePoint.x, point.x) - 5;
        CGFloat maxX = MAX(_prePoint.x, point.x) + 5;
        CGFloat minY = MIN(_prePoint.y, point.y) - 5;
        CGFloat maxY = MAX(_prePoint.y, point.y) + 5;
        
        CGRect drawRect = CGRectMake(minX, minY, maxX - minX, maxY - minY);
        [self setNeedsDisplayInRect:drawRect];
    }
    _prePoint = point;

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    [_currentPath addPoint:point];
    
    _bufferDrawview.currentPath = nil;
    [_bufferDrawview setNeedsDisplay];
    [self setNeedsDisplay];
}


- (void)setActionInfo:(DMDrawActionInfo *)actionInfo {
    _actionInfo = actionInfo;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRectdrawRectdrawRectdrawRect");
//    [_image drawAtPoint:CGPointZero];
    [_actionInfo drawPaths];
}

- (CGMutablePathRef)shapePathWithEraserPath:(CGMutablePathRef)eraserPath {
    
    CGMutablePathRef shapeRef = CGPathCreateMutable();
    CGPathMoveToPoint(shapeRef, NULL, 0, 0);
    CGPathAddLineToPoint(shapeRef, NULL, 0, self.bounds.size.width);
    CGPathAddLineToPoint(shapeRef, NULL, self.bounds.size.height, self.bounds.size.width);
    CGPathAddLineToPoint(shapeRef, NULL, self.bounds.size.height, 0);
//    CGPathCloseSubpath(shapeRef);
    
    CGPathAddPath(shapeRef, NULL, eraserPath);
//    CGPathRelease(shapeRef);
    return shapeRef;
}


@end
