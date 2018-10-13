//
//  NCLocalNotificationCenter.h
//  Demo
//
//  Created by roki on 2018/8/23.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCLocalNotificationCenter : NSObject
+ (void)pushLocalNotificationWithTitle:(NSString *)title content:(NSString *)content;
@end
