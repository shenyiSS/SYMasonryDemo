//
//  FirstViewController.m
//  SYMasonryDemo
//
//  Created by ShenYi on 2016/10/27.
//  Copyright © 2016年 ShenYi. All rights reserved.
//

#import "FirstViewController.h"
#import <Masonry.h>

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface FirstViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation FirstViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
}

#pragma mark - setup Views
- (void)addSubViews {
    [self.view addSubview:self.redView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.blueView];
    
    [self sy_UpdateViewConstraints];
}

/**
 *    实际项目中因为对着美工的标注图画UI，所以直接设置Width和Height的比较多
 *    有时候写清楚依赖关系虽然代码量会多一点点，但是最后自己检查问题的时候会比较清楚
 *    所以还是建议在mas_equalTo里写清楚依赖的关系，哪怕是self.view
 *    实际项目搭UI差不多就像现在这样一个格式 所以提前写出来看一下
 */
- (void)sy_UpdateViewConstraints {
    
    const CGFloat greenViewWidth = 300.f;
    const CGFloat redViewWidth = 300.f/2;
    const CGFloat height = 200.f;
    const CGFloat padding = 20.f;
    const CGFloat topSpace = 84.f;
    
    WS(weakSelf)
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view).offset(topSpace);
        make.left.mas_equalTo(weakSelf.view).offset(padding);
        make.width.mas_equalTo(redViewWidth);
        make.height.mas_equalTo(height);
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.redView.mas_top);
        make.left.mas_equalTo(weakSelf.redView.mas_right).offset(padding);
        make.width.mas_equalTo(weakSelf.redView.mas_width);
        make.height.mas_equalTo(weakSelf.redView.mas_height);
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.redView.mas_bottom).offset(padding);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(greenViewWidth);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
}

#pragma mark - getter & setter
- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectZero];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] initWithFrame:CGRectZero];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UIView *)blueView {
    if (!_blueView) {
        _blueView = [[UIView alloc] initWithFrame:CGRectZero];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    //red
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//
//    //blue
//    UIView *blueView = [[UIView alloc] init];
//    blueView.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:blueView];
//
//    //green
//    UIView *greenView = [[UIView alloc] init];
//    greenView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:greenView];
//
//    CGFloat padding = 20;
//
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.left.top.mas_equalTo(padding);
//        make.right.mas_equalTo(blueView.mas_left).offset(-padding);
//        make.bottom.mas_equalTo(greenView.mas_top).offset(-padding);
//        //等宽
//        make.width.equalTo(blueView);
//        //等高
//        make.height.equalTo(@[blueView, greenView]);
//    }];
//
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.height.width.equalTo(redView);
//        make.right.mas_equalTo(-padding);
//        make.left.mas_equalTo(redView.mas_right).offset(padding);
//    }];
//
//    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-padding);
//        make.left.mas_equalTo(padding);
//        make.right.mas_equalTo(-padding);
//    }];
//}

@end
