//
//  DMBaseViewController.m
//  Demo
//
//  Created by roki on 2018/4/26.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMBaseViewController.h"
#import "ZMMContentView.h"
#import "ZMMNavigationBar.h"

@interface DMBaseViewController ()
@property(weak,nonatomic)ZMMContentView *contentView;
@property(weak,nonatomic)ZMMNavigationBar *topBar;
@end

@implementation DMBaseViewController
- (void)loadView {
    
    ZMMContentView *contentView = [[ZMMContentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    contentView.backgroundColor = [UIColor whiteColor];
    _contentView = contentView;
    super.view = contentView;
    _topBar = contentView.navigationBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 左上角返回统一设置
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_back"]];
    CGRect frame = backImageView.frame;
    frame.size.width = 100;
    backImageView.frame = frame;
    backImageView.userInteractionEnabled = YES;
    backImageView.contentMode = UIViewContentModeLeft;
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackImageView)];
    [backImageView addGestureRecognizer:backTap];
    [_topBar settingLeftItem:backImageView];
}


#pragma mark -Actions
- (void)tapBackImageView {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
