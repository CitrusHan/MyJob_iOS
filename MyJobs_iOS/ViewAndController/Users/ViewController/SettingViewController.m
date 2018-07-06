//
//  SettingViewController.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) UITableView *settingTableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"系统设置";
    [self.view addSubview:self.settingTableView];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingsCell"];
    }
    cell.textLabel.font = SystemFont(14);
    cell.detailTextLabel.font = SystemFont(14);
    if (indexPath.row == 0) {
        cell.textLabel.text =@"清理缓存";
        [[SDImageCache sharedImageCache] calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2fMB", totalSize/1024.0/1024.0];
        }];
        
    }else if (indexPath.row == 1) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"版本序号";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"v %@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.section==0) {
            [HJMBProgressHUD showLoadingWithWhiteColorIndeterminateInView:AppMainWindow isResponse:NO];
            
            [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                [_settingTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                [HJMBProgressHUD hideWithView:AppMainWindow];
                
            }];
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

#pragma mark - 代理事件
#pragma mark 头像的个人设置代理事件
- (void)clickedPersonalSettingAction {
    
}

#pragma mark - 懒加载
- (UITableView *)settingTableView {
    
    if (_settingTableView == nil) {
        
        _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT_NoNavigationBar) style:(UITableViewStyleGrouped)];
        _settingTableView.dataSource = self;
        _settingTableView.delegate = self;
        _settingTableView.backgroundColor = UIColorFromRGB(0xFFFFFF);
        _settingTableView.separatorInset = UIEdgeInsetsMake(0 ,0 ,0 ,0);//top left bottom right 左右边距相同
        _settingTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 注册Cell
        [_settingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"settingCell"];
    }
    return _settingTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
