//
//  UserModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic, copy) NSString *user_id; // 用户ID
@property (nonatomic, copy) NSString *title;//职称id
@property (nonatomic, copy) NSString *titleName;//职称名称
@property (nonatomic, assign) BOOL  isDriver; // 是否是司机
@property (nonatomic, copy) NSString *employeeId;//司机id
@property (nonatomic, copy) NSString *employeeName;//司机名
@property (nonatomic, copy) NSString *loginId;//  登录名
@property (nonatomic, copy) NSString *name;//  名称
@property (nonatomic, copy) NSString *sex; // 性别
@property (nonatomic, copy) NSString *email; //邮箱
@property (nonatomic, copy) NSString *phone; //手机号
@property (nonatomic, copy) NSString *password; //密码
@property (nonatomic, copy) NSString *isOpen; //是否启用
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, copy) NSString *manageId; // 上级ID
@property (nonatomic, copy) NSString *manageName;// 上级名
@property (nonatomic, copy) NSString *remark; // 备注
@property (nonatomic, copy) NSString *tenantId;//租户id
@property (nonatomic, copy) NSString *tenantName;//租户名
@property (nonatomic, copy) NSString *lastLoginAt;//最后登录时间
@property (nonatomic, assign) BOOL  isDefault;//默认
@property (nonatomic, copy) NSString *tracNumber; // 车牌号
@property (nonatomic, copy) NSString *tractorId; //车牌号ID
@end
