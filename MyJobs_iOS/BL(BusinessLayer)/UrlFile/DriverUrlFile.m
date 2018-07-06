//
//  DriverUrlFile.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "DriverUrlFile.h"

@implementation DriverUrlFile
#pragma mark - 位置上报
/**
 司机位置上报 - 司机位置上报列表 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkLocationListPathUrl {
    return @"/apiDriverCarPositionAction_findByCond";
}

/**
司机位置上报 - 创建时加载初始化数据

@return URL
*/
+ (NSString *)loadCreatePositionDataPathUrl {
    return @"/apiDriverCarPositionAction_loadCreate";
}

/**
 司机位置上报 - 编辑时加载初始化数据
 
 @return URL
 */
+ (NSString *)loadUpdatePositionDataPathUrl {
    return @"/apiDriverCarPositionAction_loadUpdate";
}

/**
 司机位置上报 - 提交创建或是编辑数据
 
 @return URL
 */
+ (NSString *)updatePositionDataPathUrl {
    return @"/apiDriverCarPositionAction_update";
}

#pragma mark - 我的任务：调度单管理
/**
 调度单管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDriverTransportNoteListPathUrl {
    return @"/apiDriverTransportNoteAction_findByCond";
}

/**
 调度单管理 - 运抵前列表
 
 @return URL
 */
+ (NSString *)arrivalingListPathUrl {
    return @"/apiDriverTransportNoteAction_priorToArrival";
}

/**
 调度单管理 - 已运抵列表
 
 @return URL
 */
+ (NSString *)arrivaledListPathUrl {
    return @"/apiDriverTransportNoteAction_arrival";
}

/**
 调度单管理 - 发运确认
 
 @return URL
 */
+ (NSString *)carStartPathUrl {
    return @"/apiDriverTransportNoteAction_carStart";
}

/**
 调度单管理 - 运抵确认
 
 @return URL
 */
+ (NSString *)carArrivePathUrl {
    return @"/apiDriverTransportNoteAction_carArrive";
}

#pragma mark - 运力上报
/**
 运力上报 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkCapacityListPathUrl {
    return @"/apiDriverReporCapacityAction_findByCond";
}

/**
 运力上报 - 创建运力上报加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateCapacityDataPathUrl {
    return @"/apiDriverReporCapacityAction_loadCreate";
}

/**
 运力上报 - 创建运力上报加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateCapacityDataPathUrl {
    return @"/apiDriverReporCapacityAction_loadUpdate";
}

/**
 运力上报 - 创建或是编辑运力上报
 
 @return URL
 */
+ (NSString *)updateCapacityDataPathUrl {
    return @"/apiDriverReporCapacityAction_update";
}

/**
 运力上报 - 运力上报
 
 @return URL
 */
+ (NSString *)commitCapacityDataPathUrl {
    return @"/apiDriverReporCapacityAction_commit";
}

/**
 运力上报 - 取消运力上报
 
 @return URL
 */
+ (NSString *)cancelCapacityDataPathUrl {
    return @"/apiDriverReporCapacityAction_cancel";
}

#pragma mark - 车辆事故
/**
 车辆事故 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkAccidentListPathUrl {
    return @"/apiDriverCarAccidentAction_findByCond";
}

/**
 车辆事故 - 创建车辆事故加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateAccidentDataPathUrl {
    return @"/apiDriverCarAccidentAction_loadCreate";
}

/**
 车辆事故 - 编辑车辆事故加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateAccidentDataPathUrl {
    return @"/apiDriverCarAccidentAction_loadUpdate";
}

/**
 车辆事故 - 创建或是编辑车辆事故
 
 @return URL
 */
+ (NSString *)updateAccidentDataPathUrl {
    return @"/apiDriverCarAccidentAction_update";
}

#pragma mark - 在途维修
/**
 在途维修 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkMaintainListPathUrl {
    return @"/apiDriverCarRepairAction_findByCond";
}

/**
 在途维修 - 创建在途维修加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateMaintainDataPathUrl {
    return @"/apiDriverCarRepairAction_loadCreate";
}

/**
 在途维修 - 创建在途维修加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateMaintainDataPathUrl {
    return @"/apiDriverCarRepairAction_loadUpdate";
}

/**
 在途维修 - 创建或是编辑在途维修
 
 @return URL
 */
+ (NSString *)updateMaintainDataPathUrl {
    return @"/apiDriverCarRepairAction_update";
}

#pragma mark - 请假申请
/**
 请假申请 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkLeavingListPathUrl {
    return @"/apiDriverLeaveAction_findByCond";
}

/**
 请假申请 - 创建请假申请加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateLeavingDataPathUrl {
    return @"/apiDriverLeaveAction_loadCreate";
}

/**
 请假申请 - 创建请假申请加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateLeavingDataPathUrl {
    return @"/apiDriverLeaveAction_loadUpdate";
}

/**
 请假申请 - 创建或是编辑请假申请
 
 @return URL
 */
+ (NSString *)updateLeavingDataPathUrl {
    return @"/apiDriverLeaveAction_update";
}

#pragma mark - 备品领取

/**
 备品领取:出库单 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkSparePartListPathUrl {
    return @"/apiDriverCarSparesOutStockAction_findByCond";
}

/**
 备品领取:出库单 - 查看明细
 
 @return URL
 */
+ (NSString *)checkSparePartItemPathUrl {
    return @"/apiDriverCarSparesOutStockAction_findItem";
}

/**
 备品领取:出库单 - 确认出库
 
 @return URL
 */
+ (NSString *)confirmSparePartOutStockPathUrl {
    return @"/apiDriverCarSparesOutStockAction_confirm";
}

#pragma mark - 借款
/**
 借款 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkBorrowingListPathUrl {
    return @"/apiDriverLoanAction_findByCond";
}

#pragma mark - 分油

/**
 分油 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDistributeListPathUrl {
    return @"/apiDriverDistributeOilAction_findByCond";
}

@end
