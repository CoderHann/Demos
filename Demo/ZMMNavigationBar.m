//
//  ZMMNavigationBar.m
//  ZMMusicStudent
//
//  Created by roki on 2018/3/30.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "ZMMNavigationBar.h"

@interface ZMMNavigationBar()

@property (nonatomic,weak)UIView *statusView;

@property (nonatomic,weak)UIView *actionView;


@end

@implementation ZMMNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    UIView *statusView = [[UIView alloc] init];
    [self addSubview:statusView];
    _statusView = statusView;
    
    [statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@20);
    }];
    
    UIView *actionView = [[UIView alloc] init];
    [self addSubview:actionView];
    _actionView = actionView;
    [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@44);
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.textColor = su_colorWithHex(0xCBD7E6);
    
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [actionView addSubview:titleLabel];
    _titleLabel = titleLabel;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.height.equalTo(actionView);
        make.centerX.equalTo(actionView);
    }];
    
    
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)settingLeftItem:(UIView *)leftItem {
    
    if (!leftItem) {
        return ;
    }
    [_leftItem removeFromSuperview];
    CGRect frame = leftItem.frame;
    [_actionView addSubview:leftItem];
    _leftItem = leftItem;
    
    if (CGSizeEqualToSize(frame.size,CGSizeZero)) {
        [_leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_actionView).offset(10);
            make.top.bottom.equalTo(_actionView);
//            make.width.equalTo(@44);
        }];
    } else {
        [_leftItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_actionView).offset(10);
            make.top.bottom.equalTo(_actionView);
            make.width.equalTo(@(frame.size.width));
        }];
    }
}

- (void)settingRightItem:(UIView *)rightItem {
    if (!rightItem) {
        return;
    }
    [_rightItem removeFromSuperview];
    CGRect frame = rightItem.frame;
    [_actionView addSubview:rightItem];
    _rightItem = rightItem;
    
    if (CGSizeEqualToSize(frame.size,CGSizeZero)) {
        [_rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_actionView).offset(-10);
            make.top.bottom.equalTo(_actionView);
//            make.width.equalTo(@44);
        }];
    } else {
        [_rightItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_actionView).offset(-10);
            make.top.bottom.equalTo(_actionView);
            make.width.equalTo(@(frame.size.width));
        }];
    }
}

@end
