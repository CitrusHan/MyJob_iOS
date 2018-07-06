//
//  UserInfoViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *userInfoTableView;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人资料";
    [self.view addSubview:self.userInfoTableView];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return viewHeight(60);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"userInfoCell"];
    }
    cell.textLabel.font = SystemFont(15);
    cell.detailTextLabel.font = SystemFont(14);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"账号名称";
            cell.detailTextLabel.text = [UserManager defaultManager].activeUser.name;
            
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"管理权限";
            if (![UserManager defaultManager].activeUser.isDriver) {
                cell.detailTextLabel.text = @"管理员" ;
            }else {
                cell.detailTextLabel.text = @"司机" ;
                
            }
            
        }else if (indexPath.row == 2) {
            cell.textLabel.text = @"手机号码";
            cell.detailTextLabel.text = [UserManager defaultManager].activeUser.phone;
            
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

#pragma mark - 代理事件
#pragma mark 头像的个人设置代理事件
- (void)clickedPersonalSettingAction {
    
}

#pragma mark - 懒加载
- (UITableView *)userInfoTableView {
    
    if (_userInfoTableView == nil) {
        
        _userInfoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT_NoNavigationBar) style:(UITableViewStyleGrouped)];
        _userInfoTableView.dataSource = self;
        _userInfoTableView.delegate = self;
        _userInfoTableView.backgroundColor = UIColorFromRGB(0xFFFFFF);
        _userInfoTableView.separatorInset = UIEdgeInsetsMake(0 ,0 ,0 ,0);//top left bottom right 左右边距相同
        _userInfoTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 注册Cell
        [_userInfoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"userInfoCell"];
        _userInfoTableView.tableFooterView = [[UIView alloc] init];
    }
    return _userInfoTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
