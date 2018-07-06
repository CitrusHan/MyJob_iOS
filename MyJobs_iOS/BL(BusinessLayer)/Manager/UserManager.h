//
//  UserManager.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface UserManager : NSObject

/**
 用户信息
 */
@property (nonatomic, strong) UserModel *activeUser;

/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager ;

/**
 登录
 
 @param login 账号
 @param password 密码
 @param success success description
 @param failure failure description
 */
- (void)logInUserWithLogin:(NSString *)login
                  password:(NSString *)password
                   success:(void (^)(BOOL isSuccess, NSString *message))success
                   failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 退出登录

/**
 退出当前用户 （删除沙盒里的文件）
 */
- (void)logOutActiveUser ;
@end
