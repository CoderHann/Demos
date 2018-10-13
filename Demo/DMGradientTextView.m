//
//  DMGradientTextView.m
//  Demo
//
//  Created by roki on 2018/8/21.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMGradientTextView.h"

@interface DMGradientTextView()
@property(weak,nonatomic)CAGradientLayer *gradientLayer;
@end

@implementation DMGradientTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor blueColor].CGColor, nil]];
    [gradientLayer setStartPoint:CGPointMake(0, 0)];
    [gradientLayer setEndPoint:CGPointMake(1, 0)];
    [self.layer addSublayer:gradientLayer];
    _gradientLayer = gradientLayer;
    
    UILabel *textLabel = [[UILabel alloc] init];
    [self addSubview:textLabel];
    _textLabel = textLabel;
    
    
    // layout
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    
    if (layer == self.layer) {
        _gradientLayer.frame = self.layer.bounds;
        _gradientLayer.mask = _textLabel.layer;
    }
}


@end
