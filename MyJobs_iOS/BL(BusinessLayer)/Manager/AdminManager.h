//
//  AdminManager.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/18.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DriverManageModel;
@class VehicleManageModel;
@class CapacityAuditModel;
@class WayBillsModel;
@class EnRouteModel;

@interface AdminManager : NSObject
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager ;

#pragma mark - 司机管理
/**
 司机管理 -  可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param name 姓名
 @param phone 电话
 @param titleId 司机分类
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkDriverManageListWithUser_id:(NSString *)user_id
                                    name:(NSString *)name
                                   phone:(NSString *)phone
                                 titleId:(NSString *)titleId
                                    page:(NSInteger )page
                                 success:(void (^)(BOOL isSuccess, NSArray *array))success
                                 failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadDriverManageDataWithUser_id:(NSString *)user_id
                                list_id:(NSString *)list_id
                                success:(void (^)(BOOL isSuccess, DriverManageModel *driverManageModel ,NSString *message))success
                                failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 创建或是编辑司机档案
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param number 员工编号
 @param name 姓名
 @param gender 性别
 @param birthPlace 籍贯
 @param post 岗位
 @param born 司机住址
 @param phone 手机
 @param age 年龄
 @param cityOfBirth 出生地城市
 @param registeredResidence 户口所在地
 @param documentType 驾驶证类型
 @param documentNumber 身份证号码
 @param payrollCardAccount 工资卡账号
 @param bank 工资卡办卡银行
 @param specialty 所属公司
 @param title 司机分类
 @param titleLevel 职称等级
 @param entryDate 入职日期
 @param employeeStatus 员工状态
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updateDriverManageDataWithUser_id:(NSString *)user_id
                                  list_id:(NSString *)list_id
                                   number:(NSString *)number
                                     name:(NSString *)name
                                   gender:(NSString *)gender
                               birthPlace:(NSString *)birthPlace
                                     post:(NSString *)post
                                     born:(NSString *)born
                                    phone:(NSString *)phone
                                      age:(NSString *)age
                              cityOfBirth:(NSString *)cityOfBirth
                      registeredResidence:(NSString *)registeredResidence
                             documentType:(NSString *)documentType
                           documentNumber:(NSString *)documentNumber
                       payrollCardAccount:(NSString *)payrollCardAccount
                                     bank:(NSString *)bank
                                specialty:(NSString *)specialty
                                    title:(NSString *)title
                               titleLevel:(NSString *)titleLevel
                                entryDate:(NSString *)entryDate
                           employeeStatus:(NSString *)employeeStatus
                                 tenantId:(NSString *)tenantId
                                  success:(void (^)(BOOL isSuccess, NSString *message))success
                                  failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 车辆分配初始加载数据
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param success success description
 @param failure failure description
 */
- (void)carAllotDriverManageDataWithUser_id:(NSString *)user_id
                                    list_id:(NSString *)list_id
                                    success:(void (^)(BOOL isSuccess,  DriverManageModel *driverManageModel ,NSString *message))success
                                    failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 提交车辆分配操作
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param tracNumberId     车辆的id
 @param success success description
 @param failure failure description
 */
- (void)commitCarAllotDriverManageDataWithUser_id:(NSString *)user_id
                                          list_id:(NSString *)list_id
                                     tracNumberId:(NSString *)tracNumberId
                                          success:(void (^)(BOOL isSuccess, NSString *message))success
                                          failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 取消分配
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param tracNumber 车牌号
 @param success success description
 @param failure failure description
 */
- (void)removeCarAllotDriverManageDataWithUser_id:(NSString *)user_id
                                          list_id:(NSString *)list_id
                                       tracNumber:(NSString *)tracNumber
                                          success:(void (^)(BOOL isSuccess, NSString *message))success
                                          failure:(void (^)(NSString *errorMessage))failure ;

/**
 司机管理 - 作废
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param success success description
 @param failure failure description
 */
- (void)cancelDriverManageDataWithUser_id:(NSString *)user_id
                                  list_id:(NSString *)list_id
                                  success:(void (^)(BOOL isSuccess, NSString *message))success
                                  failure:(void (^)(NSString *errorMessage))failure ;

#pragma mark - 车辆管理
/**
 车辆管理 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param tracNumber 车牌号
 @param state 状态
 @param quarterEndDate 季审到期日期
 @param operatingEndDate 年审到期日期
 @param page 分页
 @param success success description
 @param failure failure description
 */
- (void)checkVehicleManageListDataWithUser_id:(NSString *)user_id
                                   tracNumber:(NSString *)tracNumber
                                        state:(NSString *)state
                               quarterEndDate:(NSString *)quarterEndDate
                             operatingEndDate:(NSString *)operatingEndDate
                                         page:(NSInteger )page
                                      success:(void (^)(BOOL isSuccess, NSArray *array))success
                                      failure:(void (^)(NSString *errorMessage))failure ;

/**
 车辆管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadVehicleManageDataWithUser_id:(NSString *)user_id
                                 list_id:(NSString *)list_id
                                 success:(void (^)(BOOL isSuccess, VehicleManageModel *vehicleManageModel ,NSString *message))success
                                 failure:(void (^)(NSString *errorMessage))failure ;

/**
 车辆管理 - 创建车辆档案或编辑
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param quarterDate 季审日期
 @param quarterEndDate 季审到期日期
 @param operatingDate 年审日期
 @param operatingEndDate 年审到期日期
 @param state 状态 1是有效 0是无效
 @param equipmentId 车辆底盘号
 @param tracNumber 车牌号
 @param transportertemId 隶属车队id
 @param employeeId 驾驶员id
 @param carType 车辆类型id
 @param brandType 品牌类型id
 @param displacementPower 排量/功率
 @param outlineSize 外廓尺寸
 @param insideSize 内部尺寸
 @param totalWeight 总质量
 @param registerDate 登记日期
 @param ureaNr 尿素量（每公里）
 @param fullOil 满载油耗（每公里）
 @param bareOil 空驶油耗（每公里）
 @param emptySubsidy 空驶补助（每公里）
 @param heavySubsidy 重驶补助（每公里）
 @param success success description
 @param failure failure description
 */
- (void)updateVehicleManageDataWithUser_id:(NSString *)user_id
                                   list_id:(NSString *)list_id
                               quarterDate:(NSString *)quarterDate
                            quarterEndDate:(NSString *)quarterEndDate
                             operatingDate:(NSString *)operatingDate
                          operatingEndDate:(NSString *)operatingEndDate
                                     state:(NSString *)state
                               equipmentId:(NSString *)equipmentId
                                tracNumber:(NSString *)tracNumber
                          transportertemId:(NSString *)transportertemId
                                employeeId:(NSString *)employeeId
                                   carType:(NSString *)carType
                                 brandType:(NSString *)brandType
                         displacementPower:(NSString *)displacementPower
                               outlineSize:(NSString *)outlineSize
                                insideSize:(NSString *)insideSize
                               totalWeight:(NSString *)totalWeight
                              registerDate:(NSString *)registerDate
                                    ureaNr:(NSString *)ureaNr
                                   fullOil:(NSString *)fullOil
                                   bareOil:(NSString *)bareOil
                              emptySubsidy:(NSString *)emptySubsidy
                              heavySubsidy:(NSString *)heavySubsidy
                                   success:(void (^)(BOOL isSuccess, NSString *message))success
                                   failure:(void (^)(NSString *errorMessage))failure ;

/**
 车辆管理 - 季审到期处理
 
 @param user_id 用户ID
 @param list_id 要处理的ID
 @param quarterDate 季审日期
 @param quarterEndDate 季审到期日期
 @param success success description
 @param failure failure description
 */
- (void)updateQuarterDateWithUser_id:(NSString *)user_id
                             list_id:(NSString *)list_id
                         quarterDate:(NSString *)quarterDate
                      quarterEndDate:(NSString *)quarterEndDate
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 车辆管理 - 年审到期处理
 
 @param user_id 用户ID
 @param list_id 要处理的ID
 @param operatingDate 年审日期
 @param operatingEndDate 年审到期日期
 @param success success description
 @param failure failure description
 */
- (void)updateOperatingDateWithUser_id:(NSString *)user_id
                               list_id:(NSString *)list_id
                         operatingDate:(NSString *)operatingDate
                      operatingEndDate:(NSString *)operatingEndDate
                               success:(void (^)(BOOL isSuccess, NSString *message))success
                               failure:(void (^)(NSString *errorMessage))failure ;


/**
 车辆管理 - 牌照变更
 
 @param user_id 用户ID
 @param list_id 要处理的ID
 @param tracNumber 车牌号
 @param success success description
 @param failure failure description
 */
- (void)updateTracNumberWithUser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                         tracNumber:(NSString *)tracNumber
                            success:(void (^)(BOOL isSuccess, NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure ;


#pragma mark - 运力审核
/**
 运力审核 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param driverId 司机id
 @param state 状态id
 @param tractorId 车牌号id
 @param availableTimeFrom 可用时间从
 @param availableTimeTo 可用时间到
 @param loadableNumber 可装载位数
 @param page  页码
 @param isAudit  是否是审核列表 YES 请求审核列表  NO请求全部列表
 @param success success description
 @param failure failure description
 */
- (void)checkCapacityAuditListDataWithUser_id:(NSString *)user_id
                                     driverId:(NSString *)driverId
                                        state:(NSString *)state
                                    tractorId:(NSString *)tractorId
                            availableTimeFrom:(NSString *)availableTimeFrom
                              availableTimeTo:(NSString *)availableTimeTo
                               loadableNumber:(NSString *)loadableNumber
                                         page:(NSInteger )page
                                      isAudit:(BOOL)isAudit
                                      success:(void (^)(BOOL isSuccess, NSArray *array))success
                                      failure:(void (^)(NSString *errorMessage))failure ;

/**
 运力审核 - 查看审核流程
 
 @param user_id 用户的ID
 @param list_id list_id description
 @param success success description
 @param failure failure description
 */
- (void)lookProCapacityAuditListWithUser_id:(NSString *)user_id
                                    list_id:(NSString *)list_id
                                    success:(void (^)(BOOL isSuccess, CapacityAuditModel *capacityAuditModel, NSString *message))success
                                    failure:(void (^)(NSString *errorMessage))failure;


/**
 运力审核 - 运力审核操作
 
 @param user_id 用户的ID
 @param list_id 要操作的运力单id
 @param isAudit  yes 通过审核 or  no未通过审核
 @param remake 备注
 @param success success description
 @param failure failure description
 */
- (void)examineCapacityReviewWithUser_id:(NSString *)user_id
                                 list_id:(NSString *)list_id
                                  remake:(NSString *)remake
                                 isAudit:(BOOL)isAudit
                                 success:(void (^)(BOOL isSuccess, NSString *message))success
                                 failure:(void (^)(NSString *errorMessage))failure ;


#pragma mark - 运单管理
/**
 运单管理 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param deliveryNoteNr 运单号
 @param state 状态id
 @param deparPlace 出发地id
 @param destination 目的地id
 @param orderTime 接单时间从
 @param orderEndTime 接单时间到
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkWaybillListDataWithUser_id:(NSString *)user_id
                         deliveryNoteNr:(NSString *)deliveryNoteNr
                                  state:(NSString *)state
                             deparPlace:(NSString *)deparPlace
                            destination:(NSString *)destination
                              orderTime:(NSString *)orderTime
                           orderEndTime:(NSString *)orderEndTime
                                   page:(NSInteger )page
                                success:(void (^)(BOOL isSuccess, NSArray *array))success
                                failure:(void (^)(NSString *errorMessage))failure ;

/**
 运单管理 - 查看详情
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkWaybillInfoListDataWithUser_id:(NSString *)user_id
                                    list_id:(NSString *)list_id
                                       page:(NSInteger )page
                                    success:(void (^)(BOOL isSuccess, NSArray *array))success
                                    failure:(void (^)(NSString *errorMessage))failure ;

/**
 运单管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadWaybillDataWithUser_id:(NSString *)user_id
                           list_id:(NSString *)list_id
                           success:(void (^)(BOOL isSuccess, WayBillsModel *wayBillsModel ,NSString *message))success
                           failure:(void (^)(NSString *errorMessage))failure ;


/**
 运单管理 - 创建或是编辑运单
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param deliveryNoteNr 运单号
 @param organization 委托方id
 @param deparPlace 出发地id
 @param destination 目的地id
 @param brand 品牌
 @param orderType 订单类型id
 @param orderTime 接单时间
 @param settleType 结算类型id
 @param state 运单状态id
 @param dealer 经销商
 @param deliveryAddress 交车地址
 @param settleAmount 结算数量
 @param carrier 承运商id
 @param dealerPhone 经销商号码
 @param carrierPhone 承运商号码
 @param insurance 保险费
 @param freight 运费
 @param deliveryFee 送货费
 @param disburseFee 垫付费
 @param otherExpense 其他费用
 @param totalCost 合计运输费用
 @param grossProfit 单车毛利
 @param receivable 应收
 @param payable 应付
 @param tenantId 租户ID
 @param success success description
 @param failure failure description
 */
- (void)updateWaybillDataWithUser_id:(NSString *)user_id
                             list_id:(NSString *)list_id
                      deliveryNoteNr:(NSString *)deliveryNoteNr
                        organization:(NSString *)organization
                          deparPlace:(NSString *)deparPlace
                         destination:(NSString *)destination
                               brand:(NSString *)brand
                           orderType:(NSString *)orderType
                           orderTime:(NSString *)orderTime
                          settleType:(NSString *)settleType
                               state:(NSString *)state
                              dealer:(NSString *)dealer
                     deliveryAddress:(NSString *)deliveryAddress
                        settleAmount:(NSString *)settleAmount
                             carrier:(NSString *)carrier
                         dealerPhone:(NSString *)dealerPhone
                        carrierPhone:(NSString *)carrierPhone
                           insurance:(NSString *)insurance
                             freight:(NSString *)freight
                         deliveryFee:(NSString *)deliveryFee
                         disburseFee:(NSString *)disburseFee
                        otherExpense:(NSString *)otherExpense
                           totalCost:(NSString *)totalCost
                         grossProfit:(NSString *)grossProfit
                          receivable:(NSString *)receivable
                             payable:(NSString *)payable
                            tenantId:(NSString *)tenantId
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 运单管理 - 车辆调度初始化
 
 @param user_id 用户的ID
 @param success success description
 @param failure failure description
 */
- (void)allotVspWaybillDataWithUser_id:(NSString *)user_id
                               success:(void (^)(BOOL isSuccess, WayBillsModel *wayBillsModel ,NSString *message))success
                               failure:(void (^)(NSString *errorMessage))failure ;

/**
 运单管理 - 车辆调度
 
 @param user_id 用户的ID
 @param list_id 要处理的ID  运单id的拼接
 @param employee 司机id
 @param tractor 车辆id
 @param lineRoute 线路id
 @param success success description
 @param failure failure description
 */
- (void)commitAllotVspWaybillDataWithUser_id:(NSString *)user_id
                                     list_id:(NSString *)list_id
                                    employee:(NSString *)employee
                                     tractor:(NSString *)tractor
                                   lineRoute:(NSString *)lineRoute
                                     success:(void (^)(BOOL isSuccess, NSString *message))success
                                     failure:(void (^)(NSString *errorMessage))failure ;


/**
 运单管理 - 取消车辆调度
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param success success description
 @param failure failure description
 */
- (void)deleteNoteWaybillDataWithUser_id:(NSString *)user_id
                                 list_id:(NSString *)list_id
                                 success:(void (^)(BOOL isSuccess, NSString *message))success
                                 failure:(void (^)(NSString *errorMessage))failure ;

/**
 运单管理 - 运单作废
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param success success description
 @param failure failure description
 */
- (void)cancelWaybillDataWithUser_id:(NSString *)user_id
                             list_id:(NSString *)list_id
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;


#pragma mark - 在途管理
/**
 在途管理 - 可用于列表展示 也可条件查询
 
 @param user_id 用户的ID
 @param transportNoteNr 调度单号
 @param lineRouteId 线路id
 @param dispatchState 调度单状态id
 @param tractorId 车牌号id
 @param driver 司机id
 @param deparPlace     出发地id
 @param destination 目的地id
 @param orderTime 下单时间起
 @param orderEndTime 下单时间止
 @param page     分页
 @param success success description
 @param failure failure description
 */
- (void)checkEnRouteListDataWithUser_id:(NSString *)user_id
                        transportNoteNr:(NSString *)transportNoteNr
                          dispatchState:(NSString *)dispatchState
                            lineRouteId:(NSString *)lineRouteId
                              tractorId:(NSString *)tractorId
                                 driver:(NSString *)driver
                             deparPlace:(NSString *)deparPlace
                            destination:(NSString *)destination
                              orderTime:(NSString *)orderTime
                           orderEndTime:(NSString *)orderEndTime
                                   page:(NSInteger )page
                                success:(void (^)(BOOL isSuccess, NSArray *array))success
                                failure:(void (^)(NSString *errorMessage))failure ;


/**
 在途管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadEnRouteDataWithUser_id:(NSString *)user_id
                           list_id:(NSString *)list_id
                           success:(void (^)(BOOL isSuccess, EnRouteModel *enRouteModel ,NSString *message))success
                           failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途管理 - 创建或是编辑调度单
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param transportNoteNr 调度单号
 @param lineRouteId 线路id
 @param carrier 承运商id
 @param orderTime 下单时间
 @param dispatchState 调度单状态id
 @param comcarNumber 商品车数量
 @param weight 重量
 @param tractorId 车牌号id
 @param deparPlace 出发地id
 @param destination 目的地id
 @param driver 司机id
 @param contactNumber 联系电话
 @param mileage 里程
 @param shipType 运输方式
 @param transportType 运输类型
 @param planDepartureTime 计划出发时间
 @param planArrivalTime 计划到达时间
 @param  actualDepartureTime 实际出发时间
 @param actualArrivalTime 实际到达时间
 @param conveyance 运输工具id
 @param deliveryNoteID 相关运单
 @param transporterTeamId 车队id
 @param appInState APP在途位置状态id
 @param tenantId 租户ID
 @param success success description
 @param failure failure descriptionz
 */
- (void)updateEnRouteDataWithUser_id:(NSString *)user_id
                             list_id:(NSString *)list_id
                     transportNoteNr:(NSString *)transportNoteNr
                         lineRouteId:(NSString *)lineRouteId
                             carrier:(NSString *)carrier
                           orderTime:(NSString *)orderTime
                       dispatchState:(NSString *)dispatchState
                        comcarNumber:(NSString *)comcarNumber
                              weight:(NSString *)weight
                           tractorId:(NSString *)tractorId
                          deparPlace:(NSString *)deparPlace
                         destination:(NSString *)destination
                              driver:(NSString *)driver
                       contactNumber:(NSString *)contactNumber
                             mileage:(NSString *)mileage
                            shipType:(NSString *)shipType
                       transportType:(NSString *)transportType
                   planDepartureTime:(NSString *)planDepartureTime
                     planArrivalTime:(NSString *)planArrivalTime
                 actualDepartureTime:(NSString *)actualDepartureTime
                   actualArrivalTime:(NSString *)actualArrivalTime
                          conveyance:(NSString *)conveyance
                      deliveryNoteID:(NSString *)deliveryNoteID
                   transporterTeamId:(NSString *)transporterTeamId
                          appInState:(NSString *)appInState
                            tenantId:(NSString *)tenantId
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途管理 - 查看调度单明细
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)gainEnRouteDataWithUser_id:(NSString *)user_id
                           list_id:(NSString *)list_id
                              page:(NSInteger )page
                           success:(void (^)(BOOL isSuccess, NSArray *array))success
                           failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途管理 - 移除调度单明细
 
 @param user_id 用户的ID
 @param transportItemIds 多选的调度单明细号id，id，id
 @param transportNoteId 调度单号
 @param success success description
 @param failure failure description
 */
- (void)removeEnRouteItemWithUser_id:(NSString *)user_id
                    transportItemIds:(NSString *)transportItemIds
                     transportNoteId:(NSString *)transportNoteId
                             success:(void (^)(BOOL isSuccess, NSString *message))success
                             failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途管理 - 查看未分配运单明细
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)findDeliveryItemListDataWithUser_id:(NSString *)user_id
                                   list_id:(NSString *)list_id
                                      page:(NSInteger )page
                                   success:(void (^)(BOOL isSuccess, NSArray *array))success
                                   failure:(void (^)(NSString *errorMessage))failure ;

/**
 在途管理 - 添加运单明细
 
 @param user_id 用户的ID
 @param deliveryItemIds 多选的运单明细号id，id，id
 @param transportNoteId 调度单号
 @param success success description
 @param failure failure description
 */
- (void)addDeliveryItemWithUser_id:(NSString *)user_id
                  deliveryItemIds:(NSString *)deliveryItemIds
                  transportNoteId:(NSString *)transportNoteId
                          success:(void (^)(BOOL isSuccess, NSString *message))success
                          failure:(void (^)(NSString *errorMessage))failure ;


/**
 在途管理 - 操作：生效、 发车、 到达、 作废
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param action_type 操作类型：生效、 发车、 到达、 作废
 @param success success description
 @param failure failure description
 */
- (void)enRouteActionWithUser_id:(NSString *)user_id
                         list_id:(NSString *)list_id
                     action_type:(NSString *)action_type
                         success:(void (^)(BOOL isSuccess, NSString *message))success
                         failure:(void (^)(NSString *errorMessage))failure ;

@end

