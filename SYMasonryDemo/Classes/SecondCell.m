//
//  SecondCell.m
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/28.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import "SecondCell.h"
#import <Masonry.h>

@implementation SecondCell

//复写setModel
- (void)setModel:(SecondModel *)model {

    [self setConstraints];
    self.clipsToBounds = YES;
    _model = model;
    self.titleLabel.text = model.title;
    self.strLabel.text = model.text;
}

//设置约束
- (void)setConstraints {
    //添加图片
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"my.jpg"];
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    //设置标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor purpleColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imgView.mas_right).offset(15);
        make.right.mas_equalTo(self.contentView).offset(-15);
        make.top.mas_equalTo(imgView);
    }];
    
    //设置内容
    self.strLabel = [[UILabel alloc] init];
    self.strLabel.textColor = [UIColor blackColor];
    self.strLabel.font = [UIFont systemFontOfSize:13];
    self.strLabel.numberOfLines = 0;
    self.strLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.strLabel];
    [self.strLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imgView.mas_right).offset(15);
        make.right.mas_equalTo(self.contentView).offset(-15);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
    }];
}

@end
