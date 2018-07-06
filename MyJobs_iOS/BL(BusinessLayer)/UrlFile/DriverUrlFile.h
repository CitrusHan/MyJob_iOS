//
//  DriverUrlFile.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DriverUrlFile : NSObject
#pragma mark - 位置上报
/**
 司机位置上报 - 司机位置上报列表 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkLocationListPathUrl ;

/**
 司机位置上报 - 创建时加载初始化数据
 
 @return URL
 */
+ (NSString *)loadCreatePositionDataPathUrl ;

/**
 司机位置上报 - 编辑时加载初始化数据
 
 @return URL
 */
+ (NSString *)loadUpdatePositionDataPathUrl ;

/**
 司机位置上报 - 提交创建或是编辑数据
 
 @return URL
 */
+ (NSString *)updatePositionDataPathUrl ;

#pragma mark - 我的任务：调度单管理
/**
 调度单管理 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDriverTransportNoteListPathUrl ;

/**
 调度单管理 - 运抵前列表
 
 @return URL
 */
+ (NSString *)arrivalingListPathUrl ;

/**
 调度单管理 - 已运抵列表
 
 @return URL
 */
+ (NSString *)arrivaledListPathUrl ;

/**
 调度单管理 - 发运确认
 
 @return URL
 */
+ (NSString *)carStartPathUrl ;

/**
 调度单管理 - 运抵确认
 
 @return URL
 */
+ (NSString *)carArrivePathUrl ;

#pragma mark - 运力上报
/**
 运力上报 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkCapacityListPathUrl ;

/**
 运力上报 - 创建运力上报加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateCapacityDataPathUrl ;

/**
 运力上报 - 创建运力上报加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateCapacityDataPathUrl ;

/**
 运力上报 - 创建或是编辑运力上报
 
 @return URL
 */
+ (NSString *)updateCapacityDataPathUrl ;

/**
 运力上报 - 运力上报
 
 @return URL
 */
+ (NSString *)commitCapacityDataPathUrl ;
/**
 运力上报 - 取消运力上报
 
 @return URL
 */
+ (NSString *)cancelCapacityDataPathUrl ;

#pragma mark - 车辆事故
/**
 车辆事故 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkAccidentListPathUrl ;

/**
 车辆事故 - 创建车辆事故加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateAccidentDataPathUrl ;

/**
 车辆事故 - 编辑车辆事故加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateAccidentDataPathUrl ;

/**
 车辆事故 - 创建或是编辑车辆事故
 
 @return URL
 */
+ (NSString *)updateAccidentDataPathUrl ;

#pragma mark - 在途维修
/**
 在途维修 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkMaintainListPathUrl ;

/**
 在途维修 - 创建在途维修加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateMaintainDataPathUrl ;

/**
 在途维修 - 创建在途维修加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateMaintainDataPathUrl ;

/**
 在途维修 - 创建或是编辑在途维修
 
 @return URL
 */
+ (NSString *)updateMaintainDataPathUrl ;

#pragma mark - 请假申请
/**
 请假申请 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkLeavingListPathUrl ;

/**
 请假申请 - 创建请假申请加载新建数据
 
 @return URL
 */
+ (NSString *)loadCreateLeavingDataPathUrl ;

/**
 请假申请 - 创建请假申请加载编辑数据
 
 @return URL
 */
+ (NSString *)loadUpdateLeavingDataPathUrl ;

/**
 请假申请 - 创建或是编辑请假申请
 
 @return URL
 */
+ (NSString *)updateLeavingDataPathUrl ;

#pragma mark - 备品领取

/**
 备品领取:出库单 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkSparePartListPathUrl ;

/**
 备品领取:出库单 - 查看明细
 
 @return URL
 */
+ (NSString *)checkSparePartItemPathUrl ;

/**
 备品领取:出库单 - 确认出库
 
 @return URL
 */
+ (NSString *)confirmSparePartOutStockPathUrl ;

#pragma mark - 借款
/**
 借款 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkBorrowingListPathUrl ;

#pragma mark - 分油

/**
 分油 - 可用于列表展示 也可条件查询
 
 @return URL
 */
+ (NSString *)checkDistributeListPathUrl ;

@end
