//
//  DMDrawPathType.h
//  HelloWorld
//
//  Created by roki on 2018/10/12.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#ifndef DMDrawPathType_h
#define DMDrawPathType_h

typedef NS_ENUM(NSUInteger, DrawPathType) {
    DrawPathTypeBrush,
    DrawPathTypeEraser
};

@protocol DrawPathTypeDelegate<NSObject>
@optional
- (DrawPathType)drawPathTypeForCurrent:(id)desti;

@end

#endif /* DMDrawPathType_h */
