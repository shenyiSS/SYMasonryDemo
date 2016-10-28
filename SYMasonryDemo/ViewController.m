//
//  ViewController.m
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/27.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

#define kCellID @"CELLID"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabelView = [[UITableView alloc] init];
    //添加到父试图
    [self.view addSubview:self.tabelView];
    //设置约束
    [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置表视图大小与屏幕相同
        make.size.mas_equalTo(self.view);
    }];
    
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.title = @"SYMasonry";
    
    self.titleArr = @[@"红蓝绿",@"tableView"];
    //注册cell
    [self.tabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
}

#pragma mark -dataSoucre delegate
//点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%ld", (long)indexPath.row);
    
    if (indexPath.row == 0) {
        //弹出红蓝绿
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:firstVC animated:YES];
    }else if (indexPath.row == 1) {
        //弹出tableView
        SecondViewController *secVC = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:secVC animated:YES];
    }
    
}

//dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}

@end
