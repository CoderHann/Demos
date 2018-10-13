//
//  ZMMContentView.m
//  ZMMusicStudent
//
//  Created by roki on 2018/3/30.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "ZMMContentView.h"
#import "ZMMNavigationBar.h"
@interface ZMMContentView()

@property (nonatomic,weak)UIView *contentView;


@end

@implementation ZMMContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIView *contentView = [[UIView alloc] init];
    _contentView = contentView;
    [self addSubview:contentView];
    
    ZMMNavigationBar *navigationBar = [[ZMMNavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,kNavigationBarHeight);
    _navigationBar = navigationBar;
    [self addSubview:navigationBar];
    
    
    //layout
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navigationBar.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
    
}

- (void)addSubview:(UIView *)view {
    if (view == _navigationBar || view == _contentView) {
        [super addSubview:view];
    } else {
        [_contentView addSubview:view];
    }
}

@end
