//
//  DMDrawingView.h
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DMDrawingView;
@class DMDrawActionInfo;

@protocol DMDrawingViewDelegate<NSObject>

@optional
- (void)drawingView:(DMDrawingView *)drawingView;
@end

@interface DMDrawingView : UIView

@property(strong, nonatomic)DMDrawActionInfo *actionInfo;

@property(weak,nonatomic)id<DMDrawingViewDelegate> delegate;

@end
