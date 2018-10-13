//
//  DMDrawingItem.m
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMDrawingItem.h"
#import "DMDrawingView.h"

@interface DMDrawingItem()<DMDrawingViewDelegate>
@property(weak,nonatomic)DMDrawingView *drawingView;
@end

@implementation DMDrawingItem
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    
    DMDrawingView *drawingView = [[DMDrawingView alloc] init];
    drawingView.delegate = self;
    [self.contentView addSubview:drawingView];
    _drawingView = drawingView;
    
    // layout
    [drawingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
}

- (void)setActionInfo:(DMDrawActionInfo *)actionInfo {
    _actionInfo = actionInfo;
    
    _drawingView.actionInfo = actionInfo;
}
@end
