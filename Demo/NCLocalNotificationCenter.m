//
//  NCLocalNotificationCenter.m
//  Demo
//
//  Created by roki on 2018/8/23.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "NCLocalNotificationCenter.h"
#import <UserNotifications/UserNotifications.h>

@implementation NCLocalNotificationCenter
static NCLocalNotificationCenter *_defaultCenter = nil;

+ (instancetype)defaultCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_defaultCenter) {
            _defaultCenter = [[self alloc] init];
            [_defaultCenter initBaseData];
        }
    });
    
    return _defaultCenter;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_defaultCenter) {
            _defaultCenter = [super allocWithZone:zone];
        }
    });
    
    return _defaultCenter;
}

- (void)initBaseData {
//    if (@available(iOS 10.0, *)) {
//
//        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//
//    } else {
//
//    }
    
}

+ (void)pushLocalNotificationWithTitle:(NSString *)title content:(NSString *)content {
    
    if (@available(iOS 10.0, *)) {
        
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        
        // 消息体
        UNMutableNotificationContent *notification = [[UNMutableNotificationContent alloc] init];
        notification.title = title;
        notification.body = content;
        notification.sound = [UNNotificationSound defaultSound];
        
        // 推送
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"NCLocalNotificationCenterID" content:notification trigger:nil];
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            if (error) {
                NSLog(@"本地推送失败！");
            }
        }];
        
        
    } else {
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        //设置调用时间
        notification.timeZone = [NSTimeZone localTimeZone];
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0];//通知触发的时间，10s以后
        
        //设置通知属性
        notification.alertTitle = title;
        notification.alertBody = content;
//        notification.applicationIconBadgeNumber += 1;//应用程序图标右上角显示的消息数
        notification.alertAction = @"打开应用"; //待机界面的滑动动作提示
        notification.alertLaunchImage = @"Default";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
        notification.soundName = UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
        
        //设置用户信息
//        notification.userInfo = @{@"id": @1, @"user": @"cloudox"};//绑定到通知上的其他附加信息
        
        //调用通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        
    }
    
}
@end
