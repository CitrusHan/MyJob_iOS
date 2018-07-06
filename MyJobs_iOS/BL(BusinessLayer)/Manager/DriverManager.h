//
//  DriverManager.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LocationModel;
@class CapacityModel;
@class AccidentModel;
@class MaintainModel;
@class LeavingModel;

@interface DriverManager : NSObject
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager ;

#pragma mark - 位置上报
/**
 司机位置上报 - 司机位置上报列表 条件查询
 
 @param user_id 用户的ID
 @param carId 车牌号id
 @param state 状态
 @param transportNoteId 调度单号id
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkLocationListWithuser_id:(NSString *)user_id
                               carId:(NSString *)carId
                     transportNoteId:(NSString *)transportNoteId
                               state:(NSString *)state
                                page:(NSInteger )page
                             success:(void (^)(BOOL isSuccess, NSArray *array))success
                             failure:(void (^)(NSString *errorMessage))failure  ;

/**
 司机位置上报 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadPositionDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, LocationModel *locationModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure ;


/**
 司机位置上报 - 提交创建或是编辑数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param carId 车牌号
 @param driverId  驾驶员
 @param transportNoteId 调度单号
 @param longitude 经度
 @param latitude 纬度
 @param address 位置
 @param uploadDate 上传日期
 @param uploadType 上报方式
 @param remark 备注
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updatePositionDataWithuser_id:(NSString *)user_id
                              list_id:(NSString *)list_id
                                carId:(NSString *)carId
                             driverId:(NSString *)driverId
                      transportNoteId:(NSString *)transportNoteId
                            longitude:(NSString *)longitude
                             latitude:(NSString *)latitude
                              address:(NSString *)address
                           uploadDate:(NSString *)uploadDate
                           uploadType:(NSString *)uploadType
                               remark:(NSString *)remark
                             tenantId:(NSString *)tenantId
                              success:(void (^)(BOOL isSuccess, NSString *message))success
                              failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 我的任务：调度单管理
/**
 调度单管理 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param list_state 调度单管理列表  运抵前列表 已运抵列表
 @param transportNoteNr 调度单号id
 @param lineRouteId 线路id
 @param dispatchState 调度单状态id
 @param tractorId 车牌号id
 @param deparPlace 出发地id
 @param destination  目的地id
 @param orderTime     下单时间开始
 @param orderEndTime 下单时间到
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkDispatchOrderListWithuser_id:(NSString *)user_id
                               list_state:(NSString *)list_state
                          transportNoteNr:(NSString *)transportNoteNr
                              lineRouteId:(NSString *)lineRouteId
                            dispatchState:(NSString *)dispatchState
                                tractorId:(NSString *)tractorId
                               deparPlace:(NSString *)deparPlace
                              destination:(NSString *)destination
                                orderTime:(NSString *)orderTime
                             orderEndTime:(NSString *)orderEndTime
                                     page:(NSInteger )page
                                  success:(void (^)(BOOL isSuccess, NSArray *array))success
                                  failure:(void (^)(NSString *errorMessage))failure ;

/**
 调度单管理 - 发运确认、运抵确认
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param action_type 操作类型：发运确认or运抵确认
 @param success success description
 @param failure failure description
 */
- (void)confirmActionWithuser_id:(NSString *)user_id
                         list_id:(NSString *)list_id
                     action_type:(NSString *)action_type
                         success:(void (^)(BOOL isSuccess, NSString *message))success
                         failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 运力上报
/**
 运力上报 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param tractorId 车牌号id
 @param loadableNumber 可装载位数
 @param state 审核状态id
 @param availableTimeFrom 可用时间从
 @param availableTimeTo 可用时间到
 @param page 分页
 @param success success description
 @param failure failure description
 */
- (void)checkCapacityListWithuser_id:(NSString *)user_id
                           tractorId:(NSString *)tractorId
                      loadableNumber:(NSString *)loadableNumber
                               state:(NSString *)state
                   availableTimeFrom:(NSString *)availableTimeFrom
                     availableTimeTo:(NSString *)availableTimeTo
                                page:(NSInteger )page
                             success:(void (^)(BOOL isSuccess, NSArray *array))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 运力上报 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadCapacityDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, CapacityModel *capacityModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure ;

/**
 运力上报 - 创建或是编辑运力上报
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param driverId 司机
 @param tractorId 车牌号
 @param telephone 电话
 @param loadNr 装载位数
 @param loadableNumber 可装载位数
 @param retenPlace 驻库地点
 @param retenTime 驻库时间
 @param availableTimeFrom 可用时间从
 @param availableTimeTo /到
 @param remark 备注
 @param reportState 运力单状态
 @param state 状态
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updateCapacityReportDataWithuser_id:(NSString *)user_id
                                    list_id:(NSString *)list_id
                                   driverId:(NSString *)driverId
                                  tractorId:(NSString *)tractorId
                                  telephone:(NSString *)telephone
                                     loadNr:(NSString *)loadNr
                             loadableNumber:(NSString *)loadableNumber
                                 retenPlace:(NSString *)retenPlace
                                  retenTime:(NSString *)retenTime
                          availableTimeFrom:(NSString *)availableTimeFrom
                            availableTimeTo:(NSString *)availableTimeTo
                                     remark:(NSString *)remark
                                reportState:(NSString *)reportState
                                      state:(NSString *)state
                                   tenantId:(NSString *)tenantId
                                    success:(void (^)(BOOL isSuccess, NSString *message))success
                                    failure:(void (^)(NSString *errorMessage))failure ;

/**
 运力上报 -  上报 or 取消
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param action_type 操作类型：上报or取消
 @param success success description
 @param failure failure description
 */
- (void)capacityActionWithuser_id:(NSString *)user_id
                          list_id:(NSString *)list_id
                      action_type:(NSString *)action_type
                          success:(void (^)(BOOL isSuccess, NSString *message))success
                          failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 车辆事故
/**
 车辆事故 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param carId     车辆ID
 @param transportNoteId     调度单ID
 @param accidentType 事故类型id
 @param underTakerId 责任划分id
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkAccidentListWithuser_id:(NSString *)user_id
                               carId:(NSString *)carId
                     transportNoteId:(NSString *)transportNoteId
                        accidentType:(NSString *)accidentType
                        underTakerId:(NSString *)underTakerId
                                page:(NSInteger )page
                             success:(void (^)(BOOL isSuccess, NSArray *array))success
                             failure:(void (^)(NSString *errorMessage))failure ;
/**
 车辆事故 - 创建车辆事故加载新建数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadAccidentDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, AccidentModel *accidentModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure ;

/**
 车辆事故 - 创建或是编辑车辆事故
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param driverId 责任司机
 @param year 年度
 @param carId 车辆ID
 @param transportNoteId 调度单ID
 @param accidentType 事故类型
 @param accidentDate  事故时间
 @param address  事故地点
 @param content  事故简况
 @param underTakerId 责任划分
 @param needInsurance 是否申报保险
 @param insuranceMoney 保险金额
 @param insuranceSource 保险金额来源
 @param accidentImage  事故图片
 @param accidentVedio 事故视频
 @param remark  备注
 @param success success description
 @param failure failure description
 */
- (void)updateAccidentDataWithuser_id:(NSString *)user_id
                              list_id:(NSString *)list_id
                             driverId:(NSString *)driverId
                                 year:(NSString *)year
                                carId:(NSString *)carId
                      transportNoteId:(NSString *)transportNoteId
                         accidentType:(NSString *)accidentType
                         accidentDate:(NSString *)accidentDate
                              address:(NSString *)address
                              content:(NSString *)content
                         underTakerId:(NSString *)underTakerId
                        needInsurance:(NSString *)needInsurance
                       insuranceMoney:(NSString *)insuranceMoney
                      insuranceSource:(NSString *)insuranceSource
                        accidentImage:(NSString *)accidentImage
                        accidentVedio:(NSString *)accidentVedio
                               remark:(NSString *)remark
                              success:(void (^)(BOOL isSuccess, NSString *message))success
                              failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 在途维修
/**
 在途维修 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param state     审核状态
 @param transportNoteId 调度单ID
 @param carId 车辆ID
 @param repairDate 维修时间开始
 @param repairEndDate     维修时间到
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkMaintainListWithuser_id:(NSString *)user_id
                               state:(NSString *)state
                     transportNoteId:(NSString *)transportNoteId
                               carId:(NSString *)carId
                          repairDate:(NSString *)repairDate
                       repairEndDate:(NSString *)repairEndDate
                                page:(NSInteger )page
                             success:(void (^)(BOOL isSuccess, NSArray *array))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途维修 - 新建\编辑初始数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadMaintainDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, MaintainModel *maintainModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途维修 - 创建或是编辑在途维修
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param driverId 司机
 @param carId  车辆ID
 @param transportNoteId  调度单ID
 @param repairDate 维修时间
 @param repairMoney 维修金额
 @param repairPlace 维修地点
 @param repairProject 维修项目
 @param reason 审核不通过原因
 @param remark 备注
 @param state  审核状态
 @param auditor 审核人
 @param repairImage 维修图片
 @param repairVedio  维修视频
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updateMaintainDataWithuser_id:(NSString *)user_id
                              list_id:(NSString *)list_id
                             driverId:(NSString *)driverId
                                carId:(NSString *)carId
                      transportNoteId:(NSString *)transportNoteId
                           repairDate:(NSString *)repairDate
                          repairMoney:(NSString *)repairMoney
                          repairPlace:(NSString *)repairPlace
                        repairProject:(NSString *)repairProject
                               reason:(NSString *)reason
                               remark:(NSString *)remark
                                state:(NSString *)state
                              auditor:(NSString *)auditor
                          repairImage:(NSString *)repairImage
                          repairVedio:(NSString *)repairVedio
                             tenantId:(NSString *)tenantId
                              success:(void (^)(BOOL isSuccess, NSString *message))success
                              failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 请假申请
/**
 请假申请 - 可用于列表展示 也可条件查询
 
 @param user_id  用户的ID
 @param leaveType 请假类型id
 @param state 审核状态id
 @param leaveDate 开始时间
 @param leaveEndDate 结束时间
 @param page 分页
 @param success success description
 @param failure failure description
 */
- (void)checkLeavingListWithuser_id:(NSString *)user_id
                          leaveType:(NSString *)leaveType
                              state:(NSString *)state
                          leaveDate:(NSString *)leaveDate
                       leaveEndDate:(NSString *)leaveEndDate
                               page:(NSInteger )page
                            success:(void (^)(BOOL isSuccess, NSArray *array))success
                            failure:(void (^)(NSString *errorMessage))failure ;


/**
 请假申请 - 新建\编辑初始数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadLeavingDataWithuser_id:(NSString *)user_id
                           list_id:(NSString *)list_id
                           success:(void (^)(BOOL isSuccess, LeavingModel *leavingModel ,NSString *message))success
                           failure:(void (^)(NSString *errorMessage))failure ;

/**
 请假申请 - 创建或是编辑请假申请
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param employeeId 员工
 @param reason 请假事由
 @param leaveType 请假类型
 @param situation 请假期间工作交接情况
 @param leaveDate 开始时间
 @param leaveEndDate 结束时间
 @param days 请假天数
 @param remark 备注
 @param state 审核状态
 @param reviewer 审核人
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updateLeavingDataWithuser_id:(NSString *)user_id
                             list_id:(NSString *)list_id
                          employeeId:(NSString *)employeeId
                              reason:(NSString *)reason
                           leaveType:(NSString *)leaveType
                           situation:(NSString *)situation
                           leaveDate:(NSString *)leaveDate
                        leaveEndDate:(NSString *)leaveEndDate
                                days:(NSString *)days
                              remark:(NSString *)remark
                               state:(NSString *)state
                            reviewer:(NSString *)reviewer
                            tenantId:(NSString *)tenantId
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 备品领取

/**
 备品领取:出库单 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param outStockNr 出库单号
 @param state 状态id
 @param outStockDate 出库日期开始
 @param outStockEndDate 出库日期到
 @param carId 车牌id
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkSparesPartListWithuser_id:(NSString *)user_id
                            outStockNr:(NSString *)outStockNr
                                 state:(NSString *)state
                          outStockDate:(NSString *)outStockDate
                       outStockEndDate:(NSString *)outStockEndDate
                                 carId:(NSString *)carId
                                  page:(NSInteger )page
                               success:(void (^)(BOOL isSuccess, NSArray *array))success
                               failure:(void (^)(NSString *errorMessage))failure ;

/**
 备品领取:出库单 - 查看明细
 
 @param user_id 用户的ID
 @param list_id 记录ID
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkSparePartItemWithuser_id:(NSString *)user_id
                              list_id:(NSString *)list_id
                                 page:(NSInteger )page
                              success:(void (^)(BOOL isSuccess, NSArray *array))success
                              failure:(void (^)(NSString *errorMessage))failure ;

/**
 备品领取:出库单 - 确认出库
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)confirmSparePartItemOutStockWithuser_id:(NSString *)user_id
                                        list_id:(NSString *)list_id
                                        success:(void (^)(BOOL isSuccess, NSString *message))success
                                        failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 借款
/**
 借款 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param loanNr 借款号
 @param TransportNoteId 调度单号id
 @param state 审核状态id
 @param tractorId 车牌号id
 @param departureDate 发车日期开始
 @param departureEndDate 发车日期到
 @param originatesite 始发地
 @param destination 目的地
 @param page 分页
 @param success success description
 @param failure failure description
 */
- (void)checkBorrowingListWithuser_id:(NSString *)user_id
                               loanNr:(NSString *)loanNr
                      TransportNoteId:(NSString *)TransportNoteId
                                state:(NSString *)state
                            tractorId:(NSString *)tractorId
                        departureDate:(NSString *)departureDate
                     departureEndDate:(NSString *)departureEndDate
                        originatesite:(NSString *)originatesite
                          destination:(NSString *)destination
                                 page:(NSInteger )page
                              success:(void (^)(BOOL isSuccess, NSArray *array))success
                              failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 分油

/**
 分油 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param distributeOilNr 分油号
 @param transportNoteId 调度单号id
 @param state 审核状态id
 @param tractorId 车牌号id
 @param dieselCardNr 油卡号id
 @param departurePlace 启运地id
 @param furthestdes 目的地id
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkDistributeListWithuser_id:(NSString *)user_id
                       distributeOilNr:(NSString *)distributeOilNr
                       transportNoteId:(NSString *)transportNoteId
                                 state:(NSString *)state
                             tractorId:(NSString *)tractorId
                          dieselCardNr:(NSString *)dieselCardNr
                        departurePlace:(NSString *)departurePlace
                           furthestdes:(NSString *)furthestdes
                                  page:(NSInteger )page
                               success:(void (^)(BOOL isSuccess, NSArray *array))success
                               failure:(void (^)(NSString *errorMessage))failure ;

@end

