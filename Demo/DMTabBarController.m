//
//  DMTabBarController.m
//  Demo
//
//  Created by roki on 2018/4/26.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMTabBarController.h"
#import "DMTestViewController.h"
#import "DMNavigationController.h"
#import "DMTestDrawingController.h"

@interface DMTabBarController ()

@end

@implementation DMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initalTabs];
    self.tabBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initalTabs {
    
    NSMutableArray *tabs = [NSMutableArray array];
    
    [tabs addObject:[self rootNavigationWithController:[[DMTestDrawingController alloc] init] title:@"页面A" normalIcon:nil selectedIcon:nil]];
    [tabs addObject:[self rootNavigationWithController:[[DMTestViewController alloc] init] title:@"页面B" normalIcon:nil selectedIcon:nil]];
    [tabs addObject:[self rootNavigationWithController:[[DMTestViewController alloc] init] title:@"页面C" normalIcon:nil selectedIcon:nil]];
    
    self.viewControllers = tabs;
}

- (DMNavigationController *)rootNavigationWithController:(UIViewController *)vc title:(NSString *)title normalIcon:(NSString *)normal selectedIcon:(NSString *)select {
    
    DMNavigationController *nav = [[DMNavigationController alloc] initWithRootViewController:vc];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:select] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    item.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    
    nav.tabBarItem = item;
    
    return nav;
    
}

@end
