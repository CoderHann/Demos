//
//  NCEmojiKeyboard.m
//  Demo
//
//  Created by roki on 2018/8/30.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "NCEmojiKeyboard.h"
#import "NCEmojiContentItem.h"
#import "NCEmojiCategoryItem.h"

@interface NCEmojiKeyboard()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(weak,nonatomic)UICollectionView *emojiContentCollectionView;

@property(weak,nonatomic)UICollectionView *chooseTabCollectionView;

@end

@implementation NCEmojiKeyboard

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    // collectinView
    UICollectionViewFlowLayout *contentLayout = [[UICollectionViewFlowLayout alloc] init];
    contentLayout.minimumLineSpacing = 0;
    contentLayout.minimumInteritemSpacing = 0;
    contentLayout.itemSize = CGSizeMake(20, 20);
    contentLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *emojiContentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:contentLayout];
    emojiContentCollectionView.showsVerticalScrollIndicator = NO;
    emojiContentCollectionView.showsHorizontalScrollIndicator = NO;
    emojiContentCollectionView.delegate = self;
    emojiContentCollectionView.dataSource = self;
    emojiContentCollectionView.pagingEnabled = YES;
    emojiContentCollectionView.backgroundColor = [UIColor whiteColor];
    [emojiContentCollectionView registerClass:[NCEmojiContentItem class] forCellWithReuseIdentifier:@"NCEmojiContentItemID"];
    [self addSubview:emojiContentCollectionView];
    
    
    
    UICollectionViewFlowLayout *tabLayout = [[UICollectionViewFlowLayout alloc] init];
    tabLayout.minimumLineSpacing = 0;
    tabLayout.minimumInteritemSpacing = 0;
    tabLayout.itemSize = CGSizeMake(20, 20);
    tabLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *chooseTabCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:tabLayout];
    chooseTabCollectionView.showsVerticalScrollIndicator = NO;
    chooseTabCollectionView.showsHorizontalScrollIndicator = NO;
    chooseTabCollectionView.delegate = self;
    chooseTabCollectionView.dataSource = self;
    chooseTabCollectionView.pagingEnabled = YES;
    chooseTabCollectionView.backgroundColor = [UIColor whiteColor];
    [chooseTabCollectionView registerClass:[NCEmojiCategoryItem class] forCellWithReuseIdentifier:@"NCEmojiCategoryItemID"];
    [self addSubview:chooseTabCollectionView];
    
    
    // layout
    [emojiContentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(chooseTabCollectionView.mas_top);
    }];
    
    [chooseTabCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@40);
    }];
    
    
}


#pragma mark -<UICollectionViewDelegate,UICollectionViewDataSource>



@end
