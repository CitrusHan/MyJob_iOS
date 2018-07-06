
//
//  AdminUrlFile.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/18.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "AdminUrlFile.h"

@implementation AdminUrlFile
#pragma mark - 司机管理
/**
 司机管理 -  可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDriverManageListPathUrl {
    return @"/apiDriverAction_findByCond";
}

/**
 司机管理 - 创建司机档案加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateDriverManageDataPathUrl {
    return @"/apiDriverAction_loadCreate";
}

/**
 司机管理 - 修改司机档案加载数据
 
 @return URL
 */
+ (NSString *)loadUpdateDriverManageDataPathUrl {
    return @"/apiDriverAction_loadUpdate";
}

/**
 司机管理 - 创建司机档案或是编辑
 
 @return URL
 */
+ (NSString *)updateDriverManageDataPathUrl {
    return @"/apiDriverAction_update";
}

/**
 司机管理 - 车辆分配初始加载数据
 
 @return URL
 */
+ (NSString *)carAllotDriverManageDataPathUrl {
    return @"/apiDriverAction_carAllot";
}

/**
 司机管理 - 提交车辆分配操作
 
 @return URL
 */
+ (NSString *)commitCarAllotDriverManageDataPathUrl {
    return @"/apiDriverAction_commitCarAllot";
}

/**
 司机管理 - 取消分配
 
 @return URL
 */
+ (NSString *)removeCarAllotDriverManageDataPathUrl {
    return @"/apiDriverAction_removeCarAllot";
}

/**
 司机管理 - 作废
 
 @return URL
 */
+ (NSString *)cancelDriverManageDataPathUrl {
    return @"/apiDriverAction_cancel";
}

#pragma mark - 车辆管理
/**
 车辆管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkVehicleManageListPathUrl {
    return @"/apiCarManagementAction_findByCond";
}

/**
 车辆管理 - 创建车辆档案加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateVehicleManageDataPathUrl {
    return @"/apiCarManagementAction_loadCreate";
}

/**
 车辆管理 - 编辑车辆档案加载数据
 
 @return URL
 */
+ (NSString *)loadUpdateVehicleManageDataPathUrl {
    return @"/apiCarManagementAction_loadUpdate";
}

/**
 车辆管理 - 创建车辆档案或是编辑
 
 @return URL
 */
+ (NSString *)updateVehicleManageDataPathUrl {
    return @"/apiCarManagementAction_update";
}

/**
 车辆管理 - 季审到期处理
 
 @return URL
 */
+ (NSString *)updateQuarterDatePathUrl {
    return @"/apiCarManagementAction_updateQuarterDate";
}

/**
 车辆管理 - 年审到期处理
 
 @return URL
 */
+ (NSString *)updateOperatingDatePathUrl {
    return @"/apiCarManagementAction_updateOperatingDate";

}

/**
 车辆管理 - 牌照变更
 
 @return URL
 */
+ (NSString *)updateTracNumberPathUrl {
    return @"/apiCarManagementAction_updateTracNumber";
}

#pragma mark - 运力审核
/**
 运力审核 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkCapacityAuditListPathUrl {
    return @"/apiReporCapacityAction_findByCond";
}

/**
 运力审核 - 查看需要审核列表页面
 
 @return URL
 */
+ (NSString *)findNotCommitCapacityAuditListPathUrl {
    return @"/apiReporCapacityAction_findNotCommit";
}

/**
 运力审核 - 查看审核流程
 
 @return URL
 */
+ (NSString *)lookProCapacityAuditListPathUrl {
    return @"/apiReporCapacityAction_lookPro";
}

/**
 运力审核 - 运力审核操作
 
 @return URL
 */
+ (NSString *)examineCapacityAuditListPathUrl {
    return @"/apiReporCapacityAction_examine";
}

/**
 运力审核 - 运力审核操作 审核不通过
 
 @return URL
 */
+ (NSString *)noExamineCapacityAuditListPathUrl {
    return @"/apiReporCapacityAction_notExamine";
}

#pragma mark - 运单管理
/**
 运单管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkWaybillListPathUrl {
    return @"/apiDeliveryNoteAction_findByCond";
}

/**
 运单管理 - 查看详情
 
 @return URL
 */
+ (NSString *)checkWaybillInfoPathUrl {
    return @"/apiDeliveryNoteAction_findItem";
}

/**
 运单管理 - 创建运单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadCreateWaybillDataPathUrl {
    return @"/apiDeliveryNoteAction_loadCreate";
}

/**
 运单管理 - 编辑运单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadUpdateWaybillDatePathUrl {
    return @"/apiDeliveryNoteAction_loadUpdate";
}

/**
 运单管理 - 创建或是编辑运单
 
 @return URL
 */
+ (NSString *)updateWaybillDatePathUrl {
    return @"/apiDeliveryNoteAction_update";
}

/**
 运单管理 - 车辆调度初始化
 
 @return URL
 */
+ (NSString *)allotVspWaybillDataPathUrl {
    return @"/apiDeliveryNoteAction_allotVsp";
}

/**
 运单管理 - 车辆调度
 
 @return URL
 */
+ (NSString *)commitAllotVspWaybillPathUrl {
    return @"/apiDeliveryNoteAction_commitAllotVsp";
}

/**
 运单管理 - 取消车辆调度
 
 @return URL
 */
+ (NSString *)deleteNoteWaybillPathUrl {
    return @"/apiDeliveryNoteAction_deleteNote";
}

/**
 运单管理 - 运单作废
 
 @return URL
 */
+ (NSString *)cancelWaybillPathUrl {
    return @"/apiDeliveryNoteAction_cancel";
}

#pragma mark - 在途管理
/**
 在途管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkEnRoadListPathUrl {
    return @"/apiTransportNoteAction_findByCond";
}

/**
 在途管理 - 查看调度单明细
 
 @return URL
 */
+ (NSString *)checkEnRoadInfoPathUrl {
    return @"/apiTransportNoteAction_findTrasItem";
}

/**
 在途管理 - 移除调度单明细
 
 @return URL
 */
+ (NSString *)removeTransItemPathUrl {
    return @"/apiTransportNoteAction_removeTransItem";
}

/**
 在途管理 - 查看未分配运单明细
 
 @return URL
 */
+ (NSString *)findDeliveryItemEnRoadInfoPathUrl {
    return @"/apiTransportNoteAction_findDeliveryItem";
}

/**
 在途管理 - 添加运单明细
 
 @return URL
 */
+ (NSString *)addDeliveryItemPathUrl {
    return @"/apiTransportNoteAction_addDeliveryItem";
}

/**
 在途管理 - 创建调度单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadCreateEnRoadPathUrl {
    return @"/apiTransportNoteAction_loadCreate";
}

/**
 在途管理 - 编辑调度单初始化选择列表数据
 
 @return URL
 */
+ (NSString *)loadUpdateEnRoadPathUrl {
    return @"/apiTransportNoteAction_loadUpdate";
}

/**
 在途管理 - 创建或是编辑调度单
 
 @return URL
 */
+ (NSString *)updateEnRoadPathUrl {
    return @"/apiTransportNoteAction_update";
}

/**
 在途管理 - 生效
 
 @return URL
 */
+ (NSString *)effectiveEnRoadPathUrl {
    return @"/apiTransportNoteAction_effective";
}

/**
 在途管理 - 发车
 
 @return URL
 */
+ (NSString *)carStartEnRoadPathUrl {
    return @"/apiTransportNoteAction_carStart";
}

/**
 在途管理 - 到达
 
 @return URL
 */
+ (NSString *)carArriveEnRoadPathUrl {
    return @"/apiTransportNoteAction_carArrive";
}

/**
 在途管理 - 作废
 
 @return URL
 */
+ (NSString *)cancelEnRoadPathUrl {
    return @"/apiTransportNoteAction_cancel";
}

@end
