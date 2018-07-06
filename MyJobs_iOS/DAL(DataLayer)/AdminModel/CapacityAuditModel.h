//
//  CapacityAuditModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/19.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CapacityAuditModel : NSObject
//列表ID
@property (nonatomic, strong) NSString *list_id;
//车主姓名
@property (nonatomic, strong) NSString *tractorId;     //车牌号
@property (nonatomic, strong) NSString *loadNr;        //装载位数
@property (nonatomic, strong) NSString *telephone;   //电话
@property (nonatomic, strong) NSString *loadableNumber;//可装载位数
@property (nonatomic, strong) NSString *driverId;      //司机
@property (nonatomic, strong) NSString *state;         //状态
@property (nonatomic, strong) NSString *retenTime;     //驻库时间
@property (nonatomic, strong) NSString *retenPlace;  //驻库地点
@property (nonatomic, strong) NSString *availableTimeFrom;//可用时间从
@property (nonatomic, strong) NSString *availableTimeTo;   //到
@property (nonatomic, strong) NSString *remark;       //备注
@property (nonatomic, strong) NSString *tenantId;//  租户ID

@property (nonatomic, strong) NSString *reportState;//运力单状态;


/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *tractorList;//车牌下拉
@property (nonatomic, strong) NSArray *driverList;//司机下拉
@property (nonatomic, strong) NSArray *stateList;//状态下拉
@end
