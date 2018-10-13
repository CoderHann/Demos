//
//  ZMMNavigationBar.h
//  ZMMusicStudent
//
//  Created by roki on 2018/3/30.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMMNavigationBar : UIView
/**
 中间的标题
 */
@property (nonatomic,copy)NSString *title;

@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UIView *leftItem;
@property(weak,nonatomic)UIView *rightItem;

- (void)settingLeftItem:(UIView *)leftItem;
- (void)settingRightItem:(UIView *)rightItem;
@end
