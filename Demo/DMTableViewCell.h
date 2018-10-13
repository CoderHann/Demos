//
//  DMTableViewCell.h
//  Demo
//
//  Created by roki on 2018/8/24.
//  Copyright © 2018年 rokihann.ideahatcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMTableViewCell : UITableViewCell

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView;;


@property(copy,nonatomic)NSString *title;
@end
