//
//  FirstViewController.m
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/27.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import "FirstViewController.h"
#import <Masonry.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //red
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //blue
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    //green
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    CGFloat padding = 20;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.top.mas_equalTo(padding);
        make.right.mas_equalTo(blueView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(greenView.mas_top).offset(-padding);
        //等宽
        make.width.equalTo(blueView);
        //等高
        make.height.equalTo(@[blueView, greenView]);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.height.width.equalTo(redView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(redView.mas_right).offset(padding);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];

}

@end
