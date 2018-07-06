//
//  LeavingModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/17.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeavingModel : NSObject

@property (nonatomic, strong) NSString *list_id;//列表ID
@property (nonatomic, strong) NSString *employeeId;       //员工
@property (nonatomic, strong) NSString *reason;     //  请假事由
@property (nonatomic, strong) NSString *leaveType;   //  请假类型
@property (nonatomic, strong) NSString *situation;   //  请假期间工作交接情况
@property (nonatomic, strong) NSString *leaveDate; // 开始时间
@property (nonatomic, strong) NSString *leaveEndDate;// 结束时间
@property (nonatomic, strong) NSString *days; //请假天数
@property (nonatomic, strong) NSString *state;//审核状态
@property (nonatomic, strong) NSString *reviewer;//审核人
@property (nonatomic, strong) NSString *remark;   //  备注

/**
 暂时未开放
 */
@property (nonatomic, strong) NSString *tenantId;//  租户ID

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *leaveTypeList;//请假类型下拉
@property (nonatomic, strong) NSArray *stateList;//审核状态下拉

@end
