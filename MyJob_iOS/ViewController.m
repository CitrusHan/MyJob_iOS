//
//  ViewController.m
//  MyJob_iOS
//
//  Created by Jing on 2017/8/24.
//  Copyright © 2017年 JaneHan. All rights reserved.
//

#import "ViewController.h"
#import "LoadingViewController.h"
#import "ImageUploadViewController.h"
#import "ImagesUploadViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 列表
 */
@property (nonatomic, strong) UITableView *listTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"资源整合";
    [self.view addSubview:self.listTableView];
    
}
#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"加载";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = @"单张图片上传";
    }else if (indexPath.row == 2) {
        cell.textLabel.text = @"多张图片上传";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        LoadingViewController *loadingVC = [[LoadingViewController alloc] init];
        [self.navigationController pushViewController:loadingVC animated:YES];
    }else if (indexPath.row == 1) {
        ImageUploadViewController *imageUploadVC = [[ImageUploadViewController alloc] init];
        [self.navigationController pushViewController:imageUploadVC animated:YES];
    }
    else if (indexPath.row == 1) {
        ImagesUploadViewController *imagesUploadVC = [[ImagesUploadViewController alloc] init];
        [self.navigationController pushViewController:imagesUploadVC animated:YES];
    }
}

#pragma mark 懒加载
- (UITableView *)listTableView {
    if (_listTableView == nil) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.
                                                                       height) style:(UITableViewStylePlain)];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"listCell"];
    }
    return _listTableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
