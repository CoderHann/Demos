//
//  DMTestDrawingController.m
//  HelloWorld
//
//  Created by roki on 2018/10/8.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMTestDrawingController.h"
#import "DMDrawingItem.h"
#import "DMDrawActionInfo.h"
#import "DMDrawPathType.h"

@interface DMTestDrawingController ()<UICollectionViewDataSource,UICollectionViewDelegate,DrawPathTypeDelegate>
@property(strong, nonatomic)NSMutableArray *drawActionList;
@property(assign,nonatomic)DrawPathType pathType;
@end

@implementation DMTestDrawingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self initialBaseData];
    [self drawUI];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialBaseData {
    _drawActionList = [NSMutableArray array];
    
    DMDrawActionInfo *actionInfo = [[DMDrawActionInfo alloc] init];
    actionInfo.delegate = self;
    [_drawActionList addObject:actionInfo];
    [_drawActionList addObject:actionInfo];
    [_drawActionList addObject:actionInfo];
    [_drawActionList addObject:actionInfo];
    [_drawActionList addObject:actionInfo];
    [_drawActionList addObject:actionInfo];
}

- (void)drawUI {
    
    // collectinView
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat collectionH = 400;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(width, collectionH);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collection.showsVerticalScrollIndicator = NO;
    collection.showsHorizontalScrollIndicator = NO;
    collection.delegate = self;
    collection.dataSource = self;
    collection.pagingEnabled = YES;
    collection.scrollEnabled = NO;
    collection.backgroundColor = [UIColor whiteColor];
    [collection registerClass:[DMDrawingItem class] forCellWithReuseIdentifier:@"DMDrawingItem"];
    [self.view addSubview:collection];
    
    UIView *bottomBar = [[UIView alloc] init];
    bottomBar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBar];
    
    UITapGestureRecognizer *tapBottom = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped)];
    [bottomBar addGestureRecognizer:tapBottom];
    // layout
    
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(bottomBar.mas_top);
    }];
    
}

#pragma makr -<UICollectionViewDataSource,UICollectionViewDelegate>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _drawActionList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DMDrawingItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"DMDrawingItem" forIndexPath:indexPath];
    item.actionInfo = _drawActionList[indexPath.row];
    
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -DrawPathTypeDelegate
- (DrawPathType)drawPathTypeForCurrent:(id)desti {
    return _pathType;
}

- (void)taped {
    
    if (_pathType == DrawPathTypeBrush) {
        
        _pathType = DrawPathTypeEraser;
    } else {
        _pathType = DrawPathTypeBrush;
    }
    
}


@end
