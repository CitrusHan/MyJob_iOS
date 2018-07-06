//
//  UserViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserViewController.h"
#import "UserHeaderView.h"
#import "ViewController.h"
#import "SettingViewController.h"
#import "UserInfoViewController.h"

@interface UserViewController ()<UITableViewDataSource, UITableViewDelegate>

/**
 我的界面列表
 */
@property (nonatomic, strong) UITableView *userTableView;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    [self.view addSubview:self.userTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.userTableView reloadData];
}


#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return UserHeaderViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UserHeaderView *userheaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UserHeaderView class])];
    if (![UserManager defaultManager].activeUser) {
        userheaderView.nickNameLabel.text = @"未登录";
        [userheaderView.avatarImageView setImage:[UIImage imageNamed:@"icon_avatar"]];
    } else {
        [userheaderView.avatarImageView setImage:[UIImage imageNamed:@"icon_avatar"]];
        userheaderView.nickNameLabel.text = [UserManager defaultManager].activeUser.name;
    }
    return userheaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return viewHeight(60);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    cell.textLabel.font = SystemFont(14);
    cell.accessoryView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"icon_right_arrow"] tintImageWithColor:UIColorFromRGB(0xFF4040)]];
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"个人资料";
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"系统设置";
        }else if (indexPath.row == 2) {
            cell.textLabel.text = @"退出登录";
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
            userInfoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:userInfoVC animated:YES];
        }else if (indexPath.row == 1) {
            SettingViewController *settingVC = [[SettingViewController alloc] init];
            settingVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:settingVC animated:YES];
        }else if (indexPath.row == 2) {
            [[ViewController defaultRootViewController] transitionLogoutViewController];
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 下面这几行代码是用来设置cell的上下行线的位置
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    // 底部线控制位置
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

#pragma mark - 懒加载
- (UITableView *)userTableView {
    
    if (_userTableView == nil) {
        
        _userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT_NoNavigationBar) style:(UITableViewStyleGrouped)];
        _userTableView.dataSource = self;
        _userTableView.delegate = self;
        _userTableView.backgroundColor = UIColorFromRGB(0xFFFFFF);
        _userTableView.separatorInset = UIEdgeInsetsMake(0 ,0 ,0 ,0);//top left bottom right 左右边距相同
        _userTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 注册Cell
        [_userTableView registerClass:[UserHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UserHeaderView class])];
        [_userTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"userCell"];
        _userTableView.tableFooterView = [[UIView alloc] init];
    }
    return _userTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
