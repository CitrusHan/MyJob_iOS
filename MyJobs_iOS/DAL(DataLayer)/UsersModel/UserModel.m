//
//  UserModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"user_id": @"id",
             @"isDriver":@"driver",
             @"isDefault":@"default",
             };
}

@end
