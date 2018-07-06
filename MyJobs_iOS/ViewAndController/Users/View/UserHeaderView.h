//
//  UserHeaderView.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UserHeaderViewHeight  viewHeight(250)

@interface UserHeaderView : UITableViewHeaderFooterView

/**
 头像
 */
@property (nonatomic, strong) UIImageView *avatarImageView;

/**
 用户名
 */
@property (nonatomic, strong) UILabel *nickNameLabel;
@end
