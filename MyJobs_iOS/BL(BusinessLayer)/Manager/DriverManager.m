//
//  DriverManager.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "DriverManager.h"
#import "DriverUrlFile.h"
#import "LocationModel.h"
#import "TransportModel.h"
#import "CapacityModel.h"
#import "AccidentModel.h"
#import "MaintainModel.h"
#import "LeavingModel.h"
#import "SparePartModel.h"
#import "BorrowingModel.h"

@implementation DriverManager
// 静态变量
static DriverManager *default_driverManager = nil;
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (default_driverManager == nil) {
            default_driverManager = [DriverManager new];
        }
    });
    return default_driverManager;
}

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
                             failure:(void (^)(NSString *errorMessage))failure  {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkLocationListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(carId)) {
        [parameter setObject:carId forKey:@"carId"];
    }else {
        [parameter setObject:@"" forKey:@"carId"];
    }
    if (!isStringEmpty(transportNoteId)) {
        [parameter setObject:transportNoteId forKey:@"transportNoteId"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteId"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [LocationModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

/**
 司机位置上报 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param success success description
 @param failure failure description
 */
- (void)loadPositionDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, LocationModel *locationModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [DriverUrlFile loadCreatePositionDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [DriverUrlFile loadUpdatePositionDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                LocationModel *locationModel = [LocationModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,locationModel,nil);
            }else {
                success(NO,nil,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                              failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(carId), @"车牌号不能为空");
    Tooltips(isStringEmpty(driverId), @"驾驶员不能为空");
    Tooltips(isStringEmpty(transportNoteId), @"调度单号不能为空");
    Tooltips(isStringEmpty(longitude), @"经度不能为空");
    Tooltips(isStringEmpty(latitude), @"纬度不能为空");
    Tooltips(isStringEmpty(address), @"位置不能为空");
    Tooltips(isStringEmpty(uploadDate), @"上传日期不能为空");
    Tooltips(isStringEmpty(uploadType), @"上报方式不能为空");
    Tooltips(isStringEmpty(remark), @"备注不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile updatePositionDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:@([carId longLongValue]) forKey:@"carId"];
    [parameter setObject:@([driverId longLongValue]) forKey:@"driverId"];
    [parameter setObject:@([transportNoteId longLongValue]) forKey:@"transportNoteId"];
    [parameter setObject:longitude forKey:@"longitude"];
    [parameter setObject:latitude forKey:@"latitude"];
    [parameter setObject:address forKey:@"address"];
    [parameter setObject:uploadDate forKey:@"uploadDate"];
    [parameter setObject:@([uploadType longLongValue]) forKey:@"uploadType"];
    [parameter setObject:remark forKey:@"remark"];
    // 暂不开放
    [parameter setObject:@([tenantId longLongValue]) forKey:@"tenantId"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                success(YES,responseObject[@"message"]);
            }else {
                success(NO,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                                  failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    // 路径
    NSString *pathUrl ;
    if ([list_state isEqualToString:@"全部数据"] || [list_state isEqualToString:@"数据查找"]) {
        pathUrl  = [DriverUrlFile checkDriverTransportNoteListPathUrl];
        [parameter setObject:transportNoteNr forKey:@"transportNoteNr"];
        [parameter setObject:lineRouteId forKey:@"lineRouteId"];
        [parameter setObject:dispatchState forKey:@"dispatchState"];
        [parameter setObject:tractorId forKey:@"tractorId"];
        [parameter setObject:deparPlace forKey:@"deparPlace"];
        [parameter setObject:destination forKey:@"destination"];
        [parameter setObject:orderTime forKey:@"orderTime"];
        [parameter setObject:orderEndTime forKey:@"orderEndTime"];
    }else if ([list_state isEqualToString:@"运抵前数据"]) {
        pathUrl  = [DriverUrlFile arrivalingListPathUrl];
    }else if ([list_state isEqualToString:@"已运抵数据"]) {
        pathUrl  = [DriverUrlFile arrivaledListPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [TransportModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array;
                [array arrayByAddingObject:responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                         failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    if ([action_type isEqualToString:@"发运确认"]) {
        pathUrl  = [DriverUrlFile carStartPathUrl];
    }else if ([action_type isEqualToString:@"运抵确认"]) {
        pathUrl  = [DriverUrlFile carArrivePathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            success(YES,responseObject[@"message"]);
        }else {
            success(NO,responseObject[@"message"]);
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(tractorId)) {
        [parameter setObject:tractorId forKey:@"tractorId"];
    }else {
        [parameter setObject:@"" forKey:@"tractorId"];
    }
    if (!isStringEmpty(loadableNumber)) {
        [parameter setObject:loadableNumber forKey:@"loadableNumber"];
    }else {
        [parameter setObject:@"" forKey:@"loadableNumber"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(availableTimeFrom)) {
        [parameter setObject:availableTimeFrom forKey:@"availableTimeFrom"];
    }else {
        [parameter setObject:@"" forKey:@"availableTimeFrom"];
    }
    if (!isStringEmpty(availableTimeTo)) {
        [parameter setObject:availableTimeTo forKey:@"availableTimeTo"];
    }else {
        [parameter setObject:@"" forKey:@"availableTimeTo"];
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkCapacityListPathUrl];;
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [CapacityModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array;
                [array arrayByAddingObject:responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

/**
 运力上报 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param success success description
 @param failure failure description
 */
- (void)loadCapacityDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, CapacityModel *capacityModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [DriverUrlFile loadCreateCapacityDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [DriverUrlFile loadUpdateCapacityDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                CapacityModel *capacityModel = [CapacityModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,capacityModel,nil);
            }else {
                success(NO,nil,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                                    failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(driverId), @"当前司机不能为空");
    Tooltips(isStringEmpty(tractorId), @"车牌号码不能为空");
    Tooltips(isStringEmpty(telephone), @"电话不能为空");
    Tooltips(isStringEmpty(loadNr), @"装载位数不能为空");
    Tooltips(isStringEmpty(loadableNumber), @"可载位数不能为空");
    Tooltips(isStringEmpty(retenPlace), @"驻库地点不能为空");
    Tooltips(isStringEmpty(retenTime), @"驻库时间不能为空");
    Tooltips(isStringEmpty(availableTimeFrom), @"开始时间不能为空");
    Tooltips(isStringEmpty(availableTimeTo), @"结束时间不能为空");
    Tooltips(isStringEmpty(remark), @"上报备注不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile updateCapacityDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:@([tractorId longLongValue]) forKey:@"tractorId"];
    [parameter setObject:@([loadNr longLongValue]) forKey:@"loadNr"];
    [parameter setObject:telephone forKey:@"telephone"];
    [parameter setObject:@([loadableNumber longLongValue]) forKey:@"loadableNumber"];
    [parameter setObject:@([driverId longLongValue]) forKey:@"driverId"];
    [parameter setObject:retenPlace forKey:@"retenPlace"];
    [parameter setObject:retenTime forKey:@"retenTime"];
    [parameter setObject:availableTimeFrom forKey:@"availableTimeFrom"];
    [parameter setObject:availableTimeTo forKey:@"availableTimeTo"];
    [parameter setObject:remark forKey:@"remark"];
    if (!isStringEmpty(state)) {
        [parameter setObject:@([state longLongValue]) forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(reportState)) {
        [parameter setObject:@([reportState longLongValue]) forKey:@"reportState"];
    }else {
        [parameter setObject:@"" forKey:@"reportState"];
    }
    /**
     暂不开放
     */
    [parameter setObject:@([tenantId longLongValue]) forKey:@"tenantId"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                success(YES,responseObject[@"message"]);
            }else {
                success(NO,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                          failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    if ([action_type isEqualToString:@"上报"]) {
        pathUrl  = [DriverUrlFile commitCapacityDataPathUrl];
    }else if ([action_type isEqualToString:@"取消"]) {
        pathUrl  = [DriverUrlFile cancelCapacityDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            if ([action_type isEqualToString:@"上报"]) {
                success(YES,responseObject[@"content"]);
            }else {
                success(YES,responseObject[@"message"]);
            }
        }else {
            success(NO,responseObject[@"message"]);
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkAccidentListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(carId)) {
        [parameter setObject:carId forKey:@"carId"];
    }else {
        [parameter setObject:@"" forKey:@"carId"];
    }
    if (!isStringEmpty(transportNoteId)) {
        [parameter setObject:transportNoteId forKey:@"transportNoteId"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteId"];
    }
    if (!isStringEmpty(accidentType)) {
        [parameter setObject:accidentType forKey:@"accidentType"];
    }else {
        [parameter setObject:@"" forKey:@"accidentType"];
    }
    if (!isStringEmpty(underTakerId)) {
        [parameter setObject:underTakerId forKey:@"underTakerId"];
    }else {
        [parameter setObject:@"" forKey:@"underTakerId"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [AccidentModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [DriverUrlFile loadCreateAccidentDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [DriverUrlFile loadUpdateAccidentDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                AccidentModel *accidentModel = [AccidentModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,accidentModel,nil);
            }else {
                success(NO,nil,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                              failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    Tooltips(isStringEmpty(driverId), @"责任司机不能为空");
    Tooltips(isStringEmpty(year), @"事故年度不能为空");
    Tooltips(isStringEmpty(carId), @"车牌号码不能为空");
    Tooltips(isStringEmpty(accidentType), @"事故类型不能为空");
    Tooltips(isStringEmpty(accidentDate), @"事故时间不能为空");
    Tooltips(isStringEmpty(address), @"事故地点不能为空");
    Tooltips(isStringEmpty(content), @"事故简况不能为空");
    Tooltips(isStringEmpty(underTakerId), @"责任划分不能为空");
    Tooltips(isStringEmpty(needInsurance), @"是否申保不能为空");
    Tooltips(isStringEmpty(insuranceMoney), @"保险金额不能为空");
    Tooltips(isStringEmpty(insuranceSource), @"保金来源不能为空");
    Tooltips(isStringEmpty(remark), @"事故备注不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile updateAccidentDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    
    if (!isStringEmpty(accidentImage)) {
        [parameter setObject:accidentImage forKey:@"accidentImage"];
    }else {
        [parameter setObject:@"" forKey:@"accidentImage"];
    }
    
    if (!isStringEmpty(accidentVedio)) {
        [parameter setObject:accidentVedio forKey:@"accidentVedio"];
    }else {
        [parameter setObject:@"" forKey:@"accidentVedio"];
    }
    [parameter setObject:year forKey:@"year"];
    [parameter setObject:@([carId longLongValue]) forKey:@"carId"];
    [parameter setObject:@([driverId longLongValue]) forKey:@"driverId"];
    [parameter setObject:@([transportNoteId longLongValue]) forKey:@"transportNoteId"];
    [parameter setObject:@([accidentType longLongValue]) forKey:@"accidentType"];
    [parameter setObject:accidentDate forKey:@"accidentDate"];
    [parameter setObject:address forKey:@"address"];
    [parameter setObject:content forKey:@"content"];
    [parameter setObject:@([underTakerId longLongValue]) forKey:@"underTakerId"];
    [parameter setObject:@([needInsurance longLongValue]) forKey:@"needInsurance"];
    [parameter setObject:@([insuranceMoney longLongValue]) forKey:@"insuranceMoney"];
    [parameter setObject:insuranceSource forKey:@"insuranceSource"];
    [parameter setObject:remark forKey:@"remark"];
    
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                success(YES,responseObject[@"message"]);
            }else {
                success(NO,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkMaintainListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(carId)) {
        [parameter setObject:carId forKey:@"carId"];
    }else {
        [parameter setObject:@"" forKey:@"carId"];
    }
    if (!isStringEmpty(transportNoteId)) {
        [parameter setObject:transportNoteId forKey:@"transportNoteId"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteId"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(repairDate)) {
        [parameter setObject:repairDate forKey:@"repairDate"];
    }else {
        [parameter setObject:@"" forKey:@"repairDate"];
    }
    if (!isStringEmpty(repairEndDate)) {
        [parameter setObject:repairEndDate forKey:@"repairEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"repairEndDate"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [MaintainModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

/**
 在途维修 - 创建车辆事故加载新建数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadMaintainDataWithuser_id:(NSString *)user_id
                            list_id:(NSString *)list_id
                            success:(void (^)(BOOL isSuccess, MaintainModel *maintainModel ,NSString *message))success
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [DriverUrlFile loadCreateMaintainDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [DriverUrlFile loadUpdateMaintainDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                MaintainModel *maintainModel = [MaintainModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,maintainModel,nil);
            }else {
                success(NO,nil,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                                 failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    Tooltips(isStringEmpty(driverId), @"责任司机不能为空");
    Tooltips(isStringEmpty(carId), @"车牌号码不能为空");
    Tooltips(isStringEmpty(transportNoteId), @"调度单号不能为空");
    Tooltips(isStringEmpty(repairDate), @"维修时间不能为空");
    Tooltips(isStringEmpty(repairMoney), @"维修金额不能为空");
    Tooltips(isStringEmpty(repairPlace), @"维修地点不能为空");
    Tooltips(isStringEmpty(repairProject), @"维修项目不能为空");
    Tooltips(isStringEmpty(reason), @"未过原因不能为空");
    Tooltips(isStringEmpty(remark), @"维修备注不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile updateMaintainDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:@([carId longLongValue]) forKey:@"carId"];
    [parameter setObject:@([driverId longLongValue]) forKey:@"driverId"];
    [parameter setObject:@([transportNoteId longLongValue]) forKey:@"transportNoteId"];
    [parameter setObject:repairDate forKey:@"repairDate"];
    [parameter setObject:@([repairMoney longLongValue]) forKey:@"repairMoney"];
    [parameter setObject:repairPlace forKey:@"repairPlace"];
    [parameter setObject:repairProject forKey:@"repairProject"];
    [parameter setObject:@([state longLongValue]) forKey:@"state"];
    [parameter setObject:reason forKey:@"reason"];
    [parameter setObject:remark forKey:@"remark"];
    if (!isStringEmpty(repairImage)) {
        [parameter setObject:repairImage forKey:@"repairImage"];
    }else {
        [parameter setObject:@"" forKey:@"repairImage"];
    }
    if (!isStringEmpty(repairVedio)) {
        [parameter setObject:repairVedio forKey:@"repairVedio"];
    }else {
        [parameter setObject:@"" forKey:@"repairVedio"];
    }
    if (!isStringEmpty(auditor)) {
        [parameter setObject:auditor forKey:@"auditor"];
    }else {
        [parameter setObject:@"" forKey:@"auditor"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                success(YES,responseObject[@"message"]);
            }else {
                success(NO,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkLeavingListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(leaveType)) {
        [parameter setObject:leaveType forKey:@"leaveType"];
    }else {
        [parameter setObject:@"" forKey:@"leaveType"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(leaveDate)) {
        [parameter setObject:leaveDate forKey:@"leaveDate"];
    }else {
        [parameter setObject:@"" forKey:@"leaveDate"];
    }
    if (!isStringEmpty(leaveEndDate)) {
        [parameter setObject:leaveEndDate forKey:@"leaveEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"leaveEndDate"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [LeavingModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                           failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [DriverUrlFile loadCreateLeavingDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [DriverUrlFile loadUpdateLeavingDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                LeavingModel *leavingModel = [LeavingModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,leavingModel,nil);
            }else {
                success(NO,nil,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                                 failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(employeeId), @"员工不能为空");
    Tooltips(isStringEmpty(reason), @"请假事由不能为空");
    Tooltips(isStringEmpty(leaveType), @"请假类型不能为空");
    Tooltips(isStringEmpty(situation), @"交接情况不能为空");
    Tooltips(isStringEmpty(leaveDate), @"开始时间不能为空");
    Tooltips(isStringEmpty(leaveEndDate), @"结束时间不能为空");
    Tooltips(isStringEmpty(days), @"请假天数不能为空");
    Tooltips(isStringEmpty(remark), @"请假备注不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile updateLeavingDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:employeeId forKey:@"employeeId"];
    [parameter setObject:reason forKey:@"reason"];
    [parameter setObject:@([leaveType longLongValue]) forKey:@"leaveType"];
    [parameter setObject:situation forKey:@"situation"];
    [parameter setObject:leaveDate forKey:@"leaveDate"];
    [parameter setObject:leaveEndDate forKey:@"leaveEndDate"];
    [parameter setObject:@([days longLongValue]) forKey:@"days"];
    [parameter setObject:remark forKey:@"remark"];
    /**
     暂不开放
     */
    if (!isStringEmpty(state)) {
        [parameter setObject:@([state longLongValue]) forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
        
    }
    if (!isStringEmpty(reviewer)) {
        [parameter setObject:reviewer forKey:@"reviewer"];
    }else {
        [parameter setObject:@"" forKey:@"reviewer"];
    }
    //    [parameter setObject:@([tenantId longLongValue]) forKey:@"tenantId"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                success(YES,responseObject[@"message"]);
            }else {
                success(NO,responseObject[@"message"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                               failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkSparePartListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(outStockNr)) {
        [parameter setObject:outStockNr forKey:@"outStockNr"];
    }else {
        [parameter setObject:@"" forKey:@"outStockNr"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(outStockDate)) {
        [parameter setObject:outStockDate forKey:@"outStockDate"];
    }else {
        [parameter setObject:@"" forKey:@"outStockDate"];
    }
    if (!isStringEmpty(outStockEndDate)) {
        [parameter setObject:outStockEndDate forKey:@"outStockEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"outStockEndDate"];
    }
    if (!isStringEmpty(carId)) {
        [parameter setObject:carId forKey:@"carId"];
    }else {
        [parameter setObject:@"" forKey:@"carId"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [SparePartModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                              failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkSparePartItemPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:@(page) forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [SparePartModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                                        failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [DriverUrlFile confirmSparePartOutStockPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            success(YES,responseObject[@"message"]);
        }else {
            success(NO,responseObject[@"message"]);
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                              failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkBorrowingListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(loanNr)) {
        [parameter setObject:loanNr forKey:@"loanNr"];
    }else {
        [parameter setObject:@"" forKey:@"loanNr"];
    }
    if (!isStringEmpty(tractorId)) {
        [parameter setObject:tractorId forKey:@"tractorId"];
    }else {
        [parameter setObject:@"" forKey:@"tractorId"];
    }
    if (!isStringEmpty(departureDate)) {
        [parameter setObject:departureDate forKey:@"departureDate"];
    }else {
        [parameter setObject:@"" forKey:@"departureDate"];
    }
    if (!isStringEmpty(departureEndDate)) {
        [parameter setObject:departureEndDate forKey:@"departureEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"departureEndDate"];
    }
    if (!isStringEmpty(TransportNoteId)) {
        [parameter setObject:TransportNoteId forKey:@"TransportNoteId"];
    }else {
        [parameter setObject:@"" forKey:@"TransportNoteId"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(originatesite)) {
        [parameter setObject:originatesite forKey:@"originatesite"];
    }else {
        [parameter setObject:@"" forKey:@"originatesite"];
    }
    if (!isStringEmpty(destination)) {
        [parameter setObject:destination forKey:@"destination"];
    }else {
        [parameter setObject:@"" forKey:@"destination"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [BorrowingModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                               failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [DriverUrlFile checkDistributeListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(distributeOilNr)) {
        [parameter setObject:distributeOilNr forKey:@"distributeOilNr"];
    }else {
        [parameter setObject:@"" forKey:@"distributeOilNr"];
    }
    if (!isStringEmpty(tractorId)) {
        [parameter setObject:tractorId forKey:@"tractorId"];
    }else {
        [parameter setObject:@"" forKey:@"tractorId"];
    }
    if (!isStringEmpty(dieselCardNr)) {
        [parameter setObject:dieselCardNr forKey:@"dieselCardNr"];
    }else {
        [parameter setObject:@"" forKey:@"dieselCardNr"];
    }
    if (!isStringEmpty(transportNoteId)) {
        [parameter setObject:transportNoteId forKey:@"transportNoteId"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteId"];
    }
    if (!isStringEmpty(departurePlace)) {
        [parameter setObject:departurePlace forKey:@"departurePlace"];
    }else {
        [parameter setObject:@"" forKey:@"departurePlace"];
    }
    if (!isStringEmpty(furthestdes)) {
        [parameter setObject:furthestdes forKey:@"furthestdes"];
    }else {
        [parameter setObject:@"" forKey:@"furthestdes"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [BorrowingModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}


@end

