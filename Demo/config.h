//
//  config.h
//  Demo
//
//  Created by roki on 2018/4/26.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#ifndef config_h
#define config_h


#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kNavigationBarHeight     (iPhoneX ? 88.f : 64.f)
#endif /* config_h */
