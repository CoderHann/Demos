//
//  NCSoundHintManager.m
//  Demo
//
//  Created by roki on 2018/8/1.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "NCSoundHintManager.h"
#import <AVFoundation/AVFoundation.h>

@interface NCSoundHintManager()
@property(assign,nonatomic)SystemSoundID soundID;
@end

@implementation NCSoundHintManager
static NCSoundHintManager *_soundHintManager = nil;


+ (instancetype)defaultHintManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_soundHintManager) {
            _soundHintManager = [[self alloc] init];
        }
    });
    
    return _soundHintManager;
}

- (instancetype)init{
    if (self = [super init]) {
        [self initialBaseData];
    }
    
    return self;
}

- (void)initialBaseData {
    
    _soundID = 1007;
    
}




/**
 新消息，系统声音提示
 */
+ (void)playSystemSoundForNewMessage {
    
    SystemSoundID soundID = 1007;
    
    BOOL canPlayWithAlert = YES;
    if (canPlayWithAlert) {
        AudioServicesPlayAlertSound(soundID);
    } else {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
}


@end
