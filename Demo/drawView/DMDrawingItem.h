//
//  DMDrawingItem.h
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DMDrawActionInfo;

@interface DMDrawingItem : UICollectionViewCell
@property(strong, nonatomic)DMDrawActionInfo *actionInfo;
@end
