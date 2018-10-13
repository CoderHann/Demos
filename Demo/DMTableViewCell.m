//
//  DMTableViewCell.m
//  Demo
//
//  Created by roki on 2018/8/24.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import "DMTableViewCell.h"
#import <SmartUtil/AOne.h>

@interface DMTableViewCell()

@property(weak,nonatomic)UILabel *descLabel;
@end

@implementation DMTableViewCell

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView {
    
    NSString *cellID = @"DMTableViewCell";
    
    DMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[DMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.font = [UIFont systemFontOfSize:20];
    descLabel.textColor = [UIColor purpleColor];
    descLabel.numberOfLines = 0;
    [self.contentView addSubview:descLabel];
    _descLabel = descLabel;
    
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
        make.height.greaterThanOrEqualTo(@50);
    }];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    
    _descLabel.text = title;
}

@end
