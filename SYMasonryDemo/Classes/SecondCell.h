//
//  SecondCell.h
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/28.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"

@interface SecondCell : UITableViewCell

@property (nonatomic, strong) SecondModel *model;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *strLabel;

@end
