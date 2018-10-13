//
//  DMNavigationController.m
//  Demo
//
//  Created by roki on 2018/4/26.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMNavigationController.h"

@interface DMNavigationController ()

@end

@implementation DMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 非根控制器
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
