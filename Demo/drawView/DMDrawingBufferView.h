//
//  DMDrawingBufferView.h
//  HelloWorld
//
//  Created by roki on 2018/10/12.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DMDrawPath;

@interface DMDrawingBufferView : UIView

@property(strong, nonatomic)DMDrawPath *currentPath;

@end
