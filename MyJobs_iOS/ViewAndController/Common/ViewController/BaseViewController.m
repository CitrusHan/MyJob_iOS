//
//  BaseViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 设置导航栏
    [self configBaseVCNavigationBar];
}

#pragma mark - 设置导航栏
- (void)configBaseVCNavigationBar {
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setImage:[UIImage imageNamed:@"icon_back"] forState:(UIControlStateNormal)];
    backBtn.frame = CGRectMake(0, 0, 40, 40);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

// 返回上一级界面
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
