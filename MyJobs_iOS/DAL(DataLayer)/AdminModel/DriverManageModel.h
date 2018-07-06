//
//  DriverManageModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/18.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DriverManageModel : NSObject

//列表ID
@property (nonatomic, strong) NSString *list_id;
// 司机名称
@property (nonatomic, strong) NSString *name;
// 员工编号
@property (nonatomic, strong) NSString *number;
// 手机号码
@property (nonatomic, strong) NSString *phone;
// 司机住址
@property (nonatomic, strong) NSString *born;
// 职称
@property (nonatomic, strong) NSString *title;
// 员工状态
@property (nonatomic, strong) NSString *employeeStatus;
// 车牌号
@property (nonatomic, strong) NSString *tracNumber;
// 车辆状态
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSString *gender;//性别
@property (nonatomic, strong) NSString *birthPlace;//籍贯
@property (nonatomic, strong) NSString *post;//岗位
@property (nonatomic, strong) NSString *age;//年龄
@property (nonatomic, strong) NSString *cityOfBirth;//出生地城市
@property (nonatomic, strong) NSString *registeredResidence;//户口所在地
@property (nonatomic, strong) NSString *documentType;//驾驶证类型
@property (nonatomic, strong) NSString *documentNumber;//身份证号码
@property (nonatomic, strong) NSString *payrollCardAccount;//工资卡账号
@property (nonatomic, strong) NSString *bank;//工资卡办卡银行
@property (nonatomic, strong) NSString *specialty;//所属公司
@property (nonatomic, strong) NSString *titleStr;//司机分类
@property (nonatomic, strong) NSString *titleLevel;//职称等级
@property (nonatomic, strong) NSString *entryDate;//入职日期
@property (nonatomic, strong) NSString *tenantId;//  租户ID

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *postMap;//岗位
@property (nonatomic, strong) NSArray *cityOfBirthMap;//出生地城市
@property (nonatomic, strong) NSArray *titleMap;//司机分类
@property (nonatomic, strong) NSArray *titleLevelMap;//职称等级
@property (nonatomic, strong) NSArray *employeeStatusMap;//员工状态
@property (nonatomic, strong) NSArray *documentTypeMap;//驾驶证类型
@property (nonatomic, strong) NSArray *tracNumberMap;//车牌号

@end
