//
//  UserHeaderView.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserHeaderView.h"

@implementation UserHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UIColorFromRGB(0x070200);
        // 界面布局
        [self configUserHeaderView];
    }
    return self;
}

// 界面布局
- (void)configUserHeaderView {
    // 头像
    _avatarImageView = [[UIImageView alloc] init];
    _avatarImageView.image = [UIImage imageNamed:@"icon_avatar"];
    _avatarImageView.layer.masksToBounds = YES;
    _avatarImageView.layer.cornerRadius = viewWidth(40);
    [self.contentView addSubview:_avatarImageView];
    
    // 昵称
    _nickNameLabel = [UILabel labelWithString:@"FMS" withTextAlignment:(NSTextAlignmentCenter) withTextColor:UIColorFromRGB(0xFFFFFF)];
    _nickNameLabel.font = SystemFont(15);
    [self.contentView addSubview:_nickNameLabel];
    
    // 排版
    __weak typeof(self) weakself = self;
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(weakself.contentView.mas_bottom).offset(-viewHeight(40));
        make.centerX.equalTo(weakself.contentView.mas_centerX);
    }];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(weakself.nickNameLabel.mas_top).offset(-viewHeight(40));
        make.centerX.equalTo(weakself.contentView.mas_centerX);
        make.width.equalTo(@(viewWidth(80)));
        make.height.equalTo(@(viewWidth(80)));
    }];
}

@end
