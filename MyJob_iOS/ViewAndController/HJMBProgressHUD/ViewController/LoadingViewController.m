//
//  LoadingViewController.m
//  MyJob_iOS
//
//  Created by Jing on 2017/12/4.
//  Copyright © 2017年 JaneHan. All rights reserved.
//

#import "LoadingViewController.h"
#import "HJMBProgressHUD.h"

@interface LoadingViewController ()

/**
 数据源
 */
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"加载";
    _dataArray = @[@"菊花转",@"菊花转带文字",@"菊花转带文字和详细描述",@"圆圈",@"进度条",@"信息提示"];
    CGFloat positionY ;
    for (int i = 0;i < _dataArray.count;i++) {
        positionY = 64 + 40 * i + 20 * ( i + 1 ) ;
        UIButton *clickBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        clickBtn.tag = 100 + i;
        clickBtn.frame = CGRectMake(20, positionY , self.view.frame.size.width - 40, 40);
        [clickBtn setTitle:_dataArray[i] forState:(UIControlStateNormal)];
        [clickBtn setBackgroundColor:[UIColor brownColor]];
        [clickBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:clickBtn];
    }
}

- (void)clickBtnAction:(UIButton *)sender {
    NSInteger flag = sender.tag;
    if (flag == 100) {
        [HJMBProgressHUD showLoadingWithWhiteColorIndeterminateInView:self.view isResponse:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HJMBProgressHUD hideWithView:self.view];
        });
   
    }else if (flag == 101) {
        [HJMBProgressHUD showLoadingWithWhiteColorIndeterminateInView:self.view title:@"加载" isResponse:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HJMBProgressHUD hideWithView:self.view];
        });

    }else if (flag == 102) {
        [HJMBProgressHUD showLoadingWithWhiteColorIndeterminateInView:self.view title:@"加载" detail:@"………………" isResponse:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HJMBProgressHUD hideWithView:self.view];
        });
    }else if (flag == 103) {
        [HJMBProgressHUD showLoadingWithDeterminateInView:self.view text:@"加载……" isResponse:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HJMBProgressHUD hideWithView:self.view];
        });
      
    }else if (flag == 104) {
        [HJMBProgressHUD showLoadingWithDeterminateHorizontalBarInView:self.view text:@"加载……" isResponse:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HJMBProgressHUD hideWithView:self.view];
        });
    }else if (flag == 105) {
        [HJMBProgressHUD showLoadingTipsInView:self.view title:@"加载" detail:@"加载测试" withIsAutoHide:YES];

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
