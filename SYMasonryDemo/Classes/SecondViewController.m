//
//  SecondViewController.m
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/28.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import "SecondViewController.h"
#import <Masonry.h>
#import "SecondModel.h"
#import "SecondCell.h"

#define kSecondCellID @"SECONDCELLID"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] init];
    //先添加到父试图上
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //创建arr
    for (NSInteger i = 0; i < 10; i ++) {
        SecondModel *model = [[SecondModel alloc] init];
        model.title = @"titletitle";
        model.text = @"texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext";
        [self.dataArr addObject:model];
    }
    
    //注册cell
    [self.tableView registerClass:[SecondCell class] forCellReuseIdentifier:kSecondCellID];
    
    [self.tableView reloadData];
    
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


#pragma mark -dataSoucre delegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

//dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:kSecondCellID];
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}

@end
