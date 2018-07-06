//
//  AdminUrlFile.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/18.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdminUrlFile : NSObject
#pragma mark - 司机管理
/**
 司机管理 -  可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDriverManageListPathUrl ;

/**
 司机管理 - 创建司机档案加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateDriverManageDataPathUrl ;

/**
 司机管理 - 修改司机档案加载数据
 
 @return URL
 */
+ (NSString *)loadUpdateDriverManageDataPathUrl ;

/**
 司机管理 - 创建司机档案或是编辑
 
 @return URL
 */
+ (NSString *)updateDriverManageDataPathUrl ;

/**
 司机管理 - 车辆分配初始加载数据
 
 @return URL
 */
+ (NSString *)carAllotDriverManageDataPathUrl ;

/**
 司机管理 - 提交车辆分配操作
 
 @return URL
 */
+ (NSString *)commitCarAllotDriverManageDataPathUrl ;

/**
 司机管理 - 取消分配
 
 @return URL
 */
+ (NSString *)removeCarAllotDriverManageDataPathUrl ;

/**
 司机管理 - 作废
 
 @return URL
 */
+ (NSString *)cancelDriverManageDataPathUrl ;

#pragma mark - 车辆管理
/**
 车辆管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkVehicleManageListPathUrl ;

/**
 车辆管理 - 创建车辆档案加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateVehicleManageDataPathUrl ;

/**
 车辆管理 - 编辑车辆档案加载数据
 
 @return URL
 */
+ (NSString *)loadUpdateVehicleManageDataPathUrl ;

/**
 车辆管理 - 创建车辆档案或是编辑
 
 @return URL
 */
+ (NSString *)updateVehicleManageDataPathUrl ;

/**
 车辆管理 - 季审到期处理
 
 @return URL
 */
+ (NSString *)updateQuarterDatePathUrl ;

/**
 车辆管理 - 年审到期处理
 
 @return URL
 */
+ (NSString *)updateOperatingDatePathUrl ;

/**
 车辆管理 - 牌照变更
 
 @return URL
 */
+ (NSString *)updateTracNumberPathUrl ;


#pragma mark - 运力审核
/**
 运力审核 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkCapacityAuditListPathUrl ;

/**
 运力审核 - 查看需要审核列表页面
 
 @return URL
 */
+ (NSString *)findNotCommitCapacityAuditListPathUrl ;

/**
 运力审核 - 查看审核流程
 
 @return URL
 */
+ (NSString *)lookProCapacityAuditListPathUrl ;

/**
 运力审核 - 运力审核操作
 
 @return URL
 */
+ (NSString *)examineCapacityAuditListPathUrl ;

/**
 运力审核 - 运力审核操作 审核不通过
 
 @return URL
 */
+ (NSString *)noExamineCapacityAuditListPathUrl ;

#pragma mark - 运单管理
/**
 运单管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkWaybillListPathUrl ;

/**
 运单管理 - 查看详情
 
 @return URL
 */
+ (NSString *)checkWaybillInfoPathUrl ;

/**
 运单管理 - 创建运单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadCreateWaybillDataPathUrl ;

/**
 运单管理 - 编辑运单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadUpdateWaybillDatePathUrl ;

/**
 运单管理 - 创建或是编辑运单
 
 @return URL
 */
+ (NSString *)updateWaybillDatePathUrl ;

/**
 运单管理 - 车辆调度初始化
 
 @return URL
 */
+ (NSString *)allotVspWaybillDataPathUrl ;

/**
 运单管理 - 车辆调度
 
 @return URL
 */
+ (NSString *)commitAllotVspWaybillPathUrl ;

/**
 运单管理 - 取消车辆调度
 
 @return URL
 */
+ (NSString *)deleteNoteWaybillPathUrl ;

/**
 运单管理 - 运单作废
 
 @return URL
 */
+ (NSString *)cancelWaybillPathUrl ;

#pragma mark - 在途管理
/**
 在途管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkEnRoadListPathUrl ;

/**
 在途管理 - 查看调度单明细
 
 @return URL
 */
+ (NSString *)checkEnRoadInfoPathUrl ;

/**
 在途管理 - 移除调度单明细
 
 @return URL
 */
+ (NSString *)removeTransItemPathUrl ;

/**
 在途管理 - 查看未分配运单明细
 
 @return URL
 */
+ (NSString *)findDeliveryItemEnRoadInfoPathUrl ;

/**
 在途管理 - 添加运单明细
 
 @return URL
 */
+ (NSString *)addDeliveryItemPathUrl ;

/**
 在途管理 - 创建调度单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadCreateEnRoadPathUrl ;

/**
 在途管理 - 编辑调度单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadUpdateEnRoadPathUrl ;

/**
 在途管理 - 创建或是编辑调度单
 
 @return URL
 */
+ (NSString *)updateEnRoadPathUrl ;

/**
 在途管理 - 生效
 
 @return URL
 */
+ (NSString *)effectiveEnRoadPathUrl ;

/**
 在途管理 - 发车
 
 @return URL
 */
+ (NSString *)carStartEnRoadPathUrl ;

/**
 在途管理 - 到达
 
 @return URL
 */
+ (NSString *)carArriveEnRoadPathUrl ;

/**
 在途管理 - 作废
 
 @return URL
 */
+ (NSString *)cancelEnRoadPathUrl ;

@end
