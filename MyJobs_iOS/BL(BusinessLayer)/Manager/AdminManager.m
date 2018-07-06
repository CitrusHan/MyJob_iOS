//
//  AdminManager.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/18.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "AdminManager.h"
#import "AdminUrlFile.h"
#import "DriverManageModel.h"
#import "VehicleManageModel.h"
#import "CapacityAuditModel.h"
#import "WayBillsModel.h"
#import "EnRouteModel.h"

@implementation AdminManager
// 静态变量
static AdminManager *default_adminManager = nil;
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (default_adminManager == nil) {
            default_adminManager = [AdminManager new];
        }
    });
    return default_adminManager;
}

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
                                 failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [AdminUrlFile checkDriverManageListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(name)) {
        [parameter setObject:name forKey:@"name"];
    }else {
        [parameter setObject:@"" forKey:@"name"];
    }
    if (!isStringEmpty(titleId)) {
        [parameter setObject:titleId forKey:@"titleId"];
    }else {
        [parameter setObject:@"" forKey:@"titleId"];
    }
    if (!isStringEmpty(phone)) {
        [parameter setObject:phone forKey:@"phone"];
    }else {
        [parameter setObject:@"" forKey:@"phone"];
    }
    [parameter setObject:[NSString stringWithFormat:@"%ld",(long)page] forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [DriverManageModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
 司机管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadDriverManageDataWithUser_id:(NSString *)user_id
                                list_id:(NSString *)list_id
                                success:(void (^)(BOOL isSuccess, DriverManageModel *driverManageModel ,NSString *message))success
                                failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [AdminUrlFile loadCreateDriverManageDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [AdminUrlFile loadUpdateDriverManageDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                DriverManageModel *driverManageModel = [DriverManageModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,driverManageModel,nil);
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
                                  failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(name), @"姓名不能为空");
    Tooltips(isStringEmpty(gender), @"性别不能为空");
    Tooltips(isStringEmpty(birthPlace), @"籍贯不能为空");
    Tooltips(isStringEmpty(post), @"岗位不能为空");
    Tooltips(isStringEmpty(born), @"司机住址不能为空");
    Tooltips(isStringEmpty(phone), @"手机号不能为空");
    Tooltips(isStringEmpty(age), @"年龄不能为空");
    Tooltips(isStringEmpty(cityOfBirth), @"出生城市不能为空");
    Tooltips(isStringEmpty(registeredResidence), @"户口所在地不能为空");
    Tooltips(isStringEmpty(documentType), @"驾驶证类型不能为空");
    Tooltips(isStringEmpty(documentNumber), @"身份证号码不能为空");
    Tooltips(isStringEmpty(payrollCardAccount), @"工资卡账号不能为空");
    Tooltips(isStringEmpty(bank), @"开户行不能为空");
    Tooltips(isStringEmpty(specialty), @"所属公司不能为空");
    Tooltips(isStringEmpty(title), @"司机分类不能为空");
    Tooltips(isStringEmpty(titleLevel), @"职称等级不能为空");
    Tooltips(isStringEmpty(entryDate), @"入职日期不能为空");
    Tooltips(isStringEmpty(employeeStatus), @"员工状态不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateDriverManageDataPathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    if (!isStringEmpty(number)) {
        [parameter setObject:number forKey:@"number"];
    }else {
        [parameter setObject:@"" forKey:@"number"];
    }
    [parameter setObject:name forKey:@"name"];
    if ([gender isEqualToString:@"女"]) {
        [parameter setObject:@(0) forKey:@"gender"];
    }else {
        [parameter setObject:@(1) forKey:@"gender"];
    }
    [parameter setObject:birthPlace forKey:@"birthPlace"];
    [parameter setObject:@([post longLongValue])  forKey:@"post"];
    [parameter setObject:born forKey:@"born"];
    [parameter setObject:phone forKey:@"phone"];
    [parameter setObject:@([age longLongValue])  forKey:@"age"];
    [parameter setObject:@([cityOfBirth longLongValue]) forKey:@"cityOfBirth"];
    [parameter setObject:registeredResidence forKey:@"registeredResidence"];
    [parameter setObject:@([documentType longLongValue]) forKey:@"documentType"];
    [parameter setObject:documentNumber forKey:@"documentNumber"];
    [parameter setObject:payrollCardAccount forKey:@"payrollCardAccount"];
    [parameter setObject:bank forKey:@"bank"];
    [parameter setObject:specialty forKey:@"specialty"];
    [parameter setObject:@([title longLongValue]) forKey:@"title"];
    [parameter setObject:@([titleLevel longLongValue]) forKey:@"titleLevel"];
    [parameter setObject:entryDate forKey:@"entryDate"];
    [parameter setObject:@([employeeStatus longLongValue]) forKey:@"employeeStatus"];
    // 暂不开放
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
                                    failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile carAllotDriverManageDataPathUrl];;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                DriverManageModel *driverManageModel = [DriverManageModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,driverManageModel,nil);
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
                                          failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    Tooltips(isStringEmpty(tracNumberId), @"车辆的ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile commitCarAllotDriverManageDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:tracNumberId forKey:@"tracNumberId"];
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
                                          failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    Tooltips(isStringEmpty(tracNumber), @"车辆的ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile removeCarAllotDriverManageDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:tracNumber forKey:@"tracNumber"];
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
                                  failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile cancelDriverManageDataPathUrl];
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
                                      failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [AdminUrlFile checkVehicleManageListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:[NSString stringWithFormat:@"%ld",(long)page] forKey:@"page"];
    if (!isStringEmpty(tracNumber)) {
        [parameter setObject:tracNumber forKey:@"tracNumber"];
    }else {
        [parameter setObject:@"" forKey:@"tracNumber"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(quarterEndDate)) {
        [parameter setObject:quarterEndDate forKey:@"quarterEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"quarterEndDate"];
    }
    if (!isStringEmpty(operatingEndDate)) {
        [parameter setObject:operatingEndDate forKey:@"operatingEndDate"];
    }else {
        [parameter setObject:@"" forKey:@"operatingEndDate"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [VehicleManageModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
 车辆管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadVehicleManageDataWithUser_id:(NSString *)user_id
                                 list_id:(NSString *)list_id
                                 success:(void (^)(BOOL isSuccess, VehicleManageModel *vehicleManageModel ,NSString *message))success
                                 failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [AdminUrlFile loadCreateVehicleManageDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [AdminUrlFile loadUpdateVehicleManageDataPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                VehicleManageModel *vehicleManageModel = [VehicleManageModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,vehicleManageModel,nil);
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
                                   failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(quarterDate), @"季审日期不能为空");
    Tooltips(isStringEmpty(quarterEndDate), @"季审到期日期不能为空");
    Tooltips(isStringEmpty(operatingDate), @"年审日期不能为空");
    Tooltips(isStringEmpty(operatingEndDate), @"年审到期日期不能为空");
    Tooltips(isStringEmpty(state), @"状态不能为空");
    Tooltips(isStringEmpty(equipmentId), @"车辆底盘号不能为空");
    Tooltips(isStringEmpty(tracNumber), @"车牌号不能为空");
    Tooltips(isStringEmpty(transportertemId), @"隶属车队不能为空");
    Tooltips(isStringEmpty(employeeId), @"驾驶员不能为空");
    Tooltips(isStringEmpty(carType), @"车辆类型不能为空");
    Tooltips(isStringEmpty(brandType), @"品牌不能为空");
    Tooltips(isStringEmpty(displacementPower), @"排量/功率不能为空");
    Tooltips(isStringEmpty(outlineSize), @"外廓尺寸不能为空");
    Tooltips(isStringEmpty(insideSize), @"内部尺寸不能为空");
    Tooltips(isStringEmpty(totalWeight), @"总质量不能为空");
    Tooltips(isStringEmpty(registerDate), @"登记日期不能为空");
    Tooltips(isStringEmpty(ureaNr), @"尿素量不能为空");
    Tooltips(isStringEmpty(fullOil), @"满载油耗不能为空");
    Tooltips(isStringEmpty(bareOil), @"空驶油耗不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateVehicleManageDataPathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:quarterDate forKey:@"quarterDate"];
    [parameter setObject:quarterEndDate forKey:@"quarterEndDate"];
    [parameter setObject:operatingDate forKey:@"operatingDate"];
    [parameter setObject:operatingEndDate forKey:@"operatingEndDate"];
    [parameter setObject:equipmentId forKey:@"equipmentId"];
    [parameter setObject:tracNumber forKey:@"tracNumber"];
    [parameter setObject:@([transportertemId longLongValue]) forKey:@"transportertemId"];
    [parameter setObject:@([employeeId longLongValue]) forKey:@"employeeId"];
    [parameter setObject:@([carType longLongValue]) forKey:@"carType"];
    [parameter setObject:@([brandType longLongValue]) forKey:@"brandType"];
    [parameter setObject:displacementPower forKey:@"displacementPower"];
    [parameter setObject:outlineSize forKey:@"outlineSize"];
    [parameter setObject:insideSize forKey:@"insideSize"];
    [parameter setObject:@([totalWeight longLongValue]) forKey:@"totalWeight"];
    [parameter setObject:registerDate forKey:@"registerDate"];
    [parameter setObject:@([ureaNr longLongValue]) forKey:@"ureaNr"];
    [parameter setObject:@([fullOil longLongValue]) forKey:@"fullOil"];
    [parameter setObject:@([bareOil longLongValue]) forKey:@"bareOil"];
    [parameter setObject:@([state longLongValue])  forKey:@"state"];
    [parameter setObject:@([emptySubsidy longLongValue]) forKey:@"emptySubsidy"];     //空驶补助
    [parameter setObject:@([heavySubsidy longLongValue]) forKey:@"heavySubsidy"];    //重驶补助
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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"请选择要操作的车辆");
    Tooltips(isStringEmpty(quarterDate), @"季审日期不能为空");
    Tooltips(isStringEmpty(quarterEndDate), @"季审到期日期不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateQuarterDatePathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:quarterDate forKey:@"quarterDate"];
    [parameter setObject:quarterEndDate forKey:@"quarterEndDate"];
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
                               failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"请选择要操作的车辆");
    Tooltips(isStringEmpty(operatingDate), @"年审日期不能为空");
    Tooltips(isStringEmpty(operatingEndDate), @"年审到期日期不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateOperatingDatePathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:operatingDate forKey:@"operatingDate"];
    [parameter setObject:operatingEndDate forKey:@"operatingEndDate"];
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
                            failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"请选择要操作的车辆");
    Tooltips(isStringEmpty(tracNumber), @"车牌号不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateTracNumberPathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:tracNumber forKey:@"tracNumber"];
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
    NSString *pathUrl;
    if (isAudit == NO) { // 请求全部列表
        pathUrl = [AdminUrlFile checkCapacityAuditListPathUrl];
        if (!isStringEmpty(tractorId)) {
            [parameter setObject:tractorId forKey:@"tractorId"];
        }else {
            [parameter setObject:@"" forKey:@"tractorId"];
        }
        if (!isStringEmpty(driverId)) {
            [parameter setObject:driverId forKey:@"driverId"];
        }else {
            [parameter setObject:@"" forKey:@"driverId"];
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
        if (!isStringEmpty(loadableNumber)) {
            [parameter setObject:loadableNumber forKey:@"loadableNumber"];
        }else {
            [parameter setObject:@"" forKey:@"loadableNumber"];
        }
    }else { // 请求审核列表
        pathUrl = [AdminUrlFile findNotCommitCapacityAuditListPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [CapacityAuditModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
 运力审核 - 查看审核流程
 
 @param user_id 用户的ID
 @param list_id list_id description
 @param success success description
 @param failure failure description
 */
- (void)lookProCapacityAuditListWithUser_id:(NSString *)user_id
                                    list_id:(NSString *)list_id
                                    success:(void (^)(BOOL isSuccess, CapacityAuditModel *capacityAuditModel, NSString *message))success
                                    failure:(void (^)(NSString *errorMessage))failure{
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"请选择要操作的数据");
    // 路径
    NSString *pathUrl = [AdminUrlFile lookProCapacityAuditListPathUrl];;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                CapacityAuditModel *capacityAuditModel = [CapacityAuditModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,capacityAuditModel,nil);
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
                                 failure:(void (^)(NSString *errorMessage))failure  {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"请选择要操作的数据");
    // 路径
    NSString *pathUrl;
    if (isAudit == YES) { // yes 通过审核
        pathUrl = [AdminUrlFile examineCapacityAuditListPathUrl];
        
    }else { // no未通过审核
        pathUrl = [AdminUrlFile noExamineCapacityAuditListPathUrl];
    }
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    if (!isStringEmpty(remake)) {
        [parameter setObject:remake forKey:@"remake"];
    }else {
        [parameter setObject:@"" forKey:@"remake"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if ([responseObject[@"code"] integerValue] == 0) {
            success(YES,responseObject[@"message"]);
        }else {
            if (![responseObject[@"message"] isEqual: [NSNull null]]) {
            }else {
                success(NO,@"操作异常，请联系管理员");
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}


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
                                failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile checkWaybillListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    if (!isStringEmpty(deliveryNoteNr)) {
        [parameter setObject:deliveryNoteNr forKey:@"deliveryNoteNr"];
    }else {
        [parameter setObject:@"" forKey:@"deliveryNoteNr"];
    }
    if (!isStringEmpty(state)) {
        [parameter setObject:state forKey:@"state"];
    }else {
        [parameter setObject:@"" forKey:@"state"];
    }
    if (!isStringEmpty(deparPlace)) {
        [parameter setObject:deparPlace forKey:@"deparPlace"];
    }else {
        [parameter setObject:@"" forKey:@"deparPlace"];
    }
    if (!isStringEmpty(destination)) {
        [parameter setObject:destination forKey:@"destination"];
    }else {
        [parameter setObject:@"" forKey:@"destination"];
    }
    if (!isStringEmpty(orderTime)) {
        [parameter setObject:orderTime forKey:@"orderTime"];
    }else {
        [parameter setObject:@"" forKey:@"orderTime"];
    }
    if (!isStringEmpty(orderEndTime)) {
        [parameter setObject:orderEndTime forKey:@"orderEndTime"];
    }else {
        [parameter setObject:@"" forKey:@"orderEndTime"];
    }
    if (page <= 0) {
        page = 1;
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [WayBillsModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
                                    failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile checkWaybillInfoPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:@(page) forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [WayBillsModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
 运单管理 - 创建或是编辑时加载初始化数据
 
 @param user_id 用户ID
 @param list_id 记录ID
 @param success success description
 @param failure failure description
 */
- (void)loadWaybillDataWithUser_id:(NSString *)user_id
                           list_id:(NSString *)list_id
                           success:(void (^)(BOOL isSuccess, WayBillsModel *wayBillsModel ,NSString *message))success
                           failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [AdminUrlFile loadCreateWaybillDataPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [AdminUrlFile loadUpdateWaybillDatePathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                WayBillsModel *wayBillsModel = [WayBillsModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,wayBillsModel,nil);
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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(deliveryNoteNr), @"运单号不能为空");
    Tooltips(isStringEmpty(organization), @"委托方能为空");
    Tooltips(isStringEmpty(deparPlace), @"出发地不能为空");
    Tooltips(isStringEmpty(destination), @"目的地不能为空");
    Tooltips(isStringEmpty(brand), @"品牌不能为空");
    Tooltips(isStringEmpty(orderType), @"订单类型不能为空");
    Tooltips(isStringEmpty(orderTime), @"接单时间不能为空");
    Tooltips(isStringEmpty(settleType), @"结算类型不能为空");
    Tooltips(isStringEmpty(state), @"运单状态不能为空");
    Tooltips(isStringEmpty(dealer), @"经销商不能为空");
    Tooltips(isStringEmpty(carrier), @"承运商不能为空");
    Tooltips(isStringEmpty(dealerPhone), @"经销商号码不能为空");
    Tooltips(isStringEmpty(carrierPhone), @"承运商号码不能为空");
    Tooltips(isStringEmpty(insurance), @"保险费不能为空");
    Tooltips(isStringEmpty(freight), @"运费不能为空");
    Tooltips(isStringEmpty(deliveryFee), @"送货费不能为空");
    Tooltips(isStringEmpty(disburseFee), @"垫付费不能为空");
    Tooltips(isStringEmpty(otherExpense), @"其他费用不能为空");
    Tooltips(isStringEmpty(totalCost), @"合计运输费用不能为空空");
    Tooltips(isStringEmpty(grossProfit), @"单车毛利不能为空");
    Tooltips(isStringEmpty(receivable), @"应收不能为空");
    Tooltips(isStringEmpty(payable), @"应付不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateWaybillDatePathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    [parameter setObject:deliveryNoteNr forKey:@"deliveryNoteNr"];
    [parameter setObject:@([organization longLongValue])  forKey:@"organization"];
    [parameter setObject:@([deparPlace longLongValue])  forKey:@"deparPlace"];
    [parameter setObject:@([destination longLongValue])  forKey:@"destination"];
    [parameter setObject:brand forKey:@"brand"];
    [parameter setObject:@([orderType longLongValue]) forKey:@"orderType"];
    [parameter setObject:orderTime forKey:@"orderTime"];
    [parameter setObject:@([settleType longLongValue]) forKey:@"settleType"];
    [parameter setObject:@([state longLongValue]) forKey:@"state"];
    [parameter setObject:dealer forKey:@"dealer"];
    [parameter setObject:deliveryAddress forKey:@"deliveryAddress"];
    [parameter setObject:@([settleAmount longLongValue])  forKey:@"settleAmount"];
    [parameter setObject:@([carrier longLongValue]) forKey:@"carrier"];
    [parameter setObject:dealerPhone forKey:@"dealerPhone"];
    [parameter setObject:carrierPhone forKey:@"carrierPhone"];
    [parameter setObject:@([insurance longLongValue]) forKey:@"insurance"];
    [parameter setObject:@([freight longLongValue]) forKey:@"freight"];
    [parameter setObject:@([deliveryFee longLongValue]) forKey:@"deliveryFee"];
    [parameter setObject:@([disburseFee longLongValue]) forKey:@"disburseFee"];
    [parameter setObject:@([otherExpense longLongValue]) forKey:@"otherExpense"];
    [parameter setObject:@([totalCost longLongValue]) forKey:@"totalCost"];
    [parameter setObject:grossProfit forKey:@"grossProfit"];
    [parameter setObject:receivable forKey:@"receivable"];
    [parameter setObject:payable forKey:@"payable"];
    // 暂不开放
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

/**
 运单管理 - 车辆调度初始化
 
 @param user_id 用户的ID
 @param success success description
 @param failure failure description
 */
- (void)allotVspWaybillDataWithUser_id:(NSString *)user_id
                               success:(void (^)(BOOL isSuccess, WayBillsModel *wayBillsModel ,NSString *message))success
                               failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile allotVspWaybillDataPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                WayBillsModel *wayBillsModel = [WayBillsModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,wayBillsModel,nil);
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
                                     failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    Tooltips(isStringEmpty(employee), @"司机不能为空");
    Tooltips(isStringEmpty(tractor), @"车辆不能为空");
    Tooltips(isStringEmpty(lineRoute), @"线路不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile commitAllotVspWaybillPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:employee forKey:@"employee"];
    [parameter setObject:tractor forKey:@"tractor"];
    [parameter setObject:lineRoute forKey:@"lineRoute"];
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
                                 failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile deleteNoteWaybillPathUrl];
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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile cancelWaybillPathUrl];
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
                                failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [AdminUrlFile checkEnRoadListPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:@(page) forKey:@"page"];
    
    if (!isStringEmpty(transportNoteNr)) {
        [parameter setObject:transportNoteNr forKey:@"transportNoteNr"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteNr"];
    }
    if (!isStringEmpty(lineRouteId)) {
        [parameter setObject:lineRouteId forKey:@"lineRouteId"];
    }else {
        [parameter setObject:@"" forKey:@"lineRouteId"];
    }
    if (!isStringEmpty(dispatchState)) {
        [parameter setObject:dispatchState forKey:@"dispatchState"];
    }else {
        [parameter setObject:@"" forKey:@"dispatchState"];
    }
    if (!isStringEmpty(tractorId)) {
        [parameter setObject:tractorId forKey:@"tractorId"];
    }else {
        [parameter setObject:@"" forKey:@"tractorId"];
    }
    if (!isStringEmpty(driver)) {
        [parameter setObject:transportNoteNr forKey:@"driver"];
    }else {
        [parameter setObject:@"" forKey:@"driver"];
    }
    if (!isStringEmpty(deparPlace)) {
        [parameter setObject:deparPlace forKey:@"deparPlace"];
    }else {
        [parameter setObject:@"" forKey:@"deparPlace"];
    }
    if (!isStringEmpty(destination)) {
        [parameter setObject:destination forKey:@"destination"];
    }else {
        [parameter setObject:@"" forKey:@"destination"];
    }
    if (!isStringEmpty(orderTime)) {
        [parameter setObject:orderTime forKey:@"orderTime"];
    }else {
        [parameter setObject:@"" forKey:@"orderTime"];
    }
    if (!isStringEmpty(orderEndTime)) {
        [parameter setObject:orderEndTime forKey:@"orderEndTime"];
    }else {
        [parameter setObject:@"" forKey:@"orderEndTime"];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [EnRouteModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

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
                           failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (isStringEmpty(list_id)) { // 记录ID为空，创建加载请求
        pathUrl  = [AdminUrlFile loadCreateEnRoadPathUrl];
    }else { // 记录ID不为空，编辑加载请求
        [parameter setObject:list_id forKey:@"id"];
        pathUrl  = [AdminUrlFile loadUpdateEnRoadPathUrl];
    }
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                EnRouteModel *enRouteModel = [EnRouteModel mj_objectWithKeyValues:responseObject[@"content"]];
                success(YES,enRouteModel,nil);
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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(lineRouteId), @"线路不能为空");
    Tooltips(isStringEmpty(carrier), @"承运商不能为空");
    Tooltips(isStringEmpty(orderTime), @"下单时间不能为空");
    Tooltips(isStringEmpty(dispatchState), @"调度单状态不能为空");
    Tooltips(isStringEmpty(comcarNumber), @"商品车数量不能为空");
    Tooltips(isStringEmpty(orderTime), @"接单时间不能为空");
    Tooltips(isStringEmpty(weight), @"重量不能为空");
    Tooltips(isStringEmpty(tractorId), @"车牌号不能为空");
    Tooltips(isStringEmpty(deparPlace), @"出发地不能为空");
    Tooltips(isStringEmpty(destination), @"目的地不能为空");
    Tooltips(isStringEmpty(driver), @"司机不能为空");
    Tooltips(isStringEmpty(contactNumber), @"联系电话不能为空");
    Tooltips(isStringEmpty(mileage), @"里程不能为空");
    Tooltips(isStringEmpty(shipType), @"运输方式不能为空");
    Tooltips(isStringEmpty(transportType), @"运输类型不能为空");
    Tooltips(isStringEmpty(planDepartureTime), @"计划出发时间不能为空");
    Tooltips(isStringEmpty(planArrivalTime), @"计划到达时间不能为空");
    Tooltips(isStringEmpty(actualDepartureTime), @"实际出发时间不能为空");
    Tooltips(isStringEmpty(actualArrivalTime), @"实际到达时间不能为空");
    Tooltips(isStringEmpty(conveyance), @"运输工具不能为空");
    Tooltips(isStringEmpty(deliveryNoteID), @"相关运单不能为空");
    Tooltips(isStringEmpty(transporterTeamId), @"车队不能为空");
    Tooltips(isStringEmpty(appInState), @"在途位置不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile updateEnRoadPathUrl];
    // 参数（必填项）
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    if (!isStringEmpty(list_id)) { // 不为空时说明是编辑，作为参数
        [parameter setObject:@([list_id longLongValue]) forKey:@"id"];
    }
    if (!isStringEmpty(transportNoteNr)) {
        [parameter setObject:transportNoteNr forKey:@"transportNoteNr"];
    }else {
        [parameter setObject:@"" forKey:@"transportNoteNr"];
    }
    [parameter setObject:@([lineRouteId longLongValue])  forKey:@"lineRouteId"];
    [parameter setObject:@([carrier longLongValue])  forKey:@"carrier"];
    [parameter setObject:orderTime forKey:@"orderTime"];
    [parameter setObject:@([dispatchState longLongValue])  forKey:@"dispatchState"];
    [parameter setObject:@([comcarNumber longLongValue])  forKey:@"comcarNumber"];
    [parameter setObject:weight forKey:@"weight"];
    [parameter setObject:@([tractorId longLongValue]) forKey:@"tractorId"];
    [parameter setObject:@([deparPlace longLongValue]) forKey:@"deparPlace"];
    [parameter setObject:@([destination longLongValue]) forKey:@"destination"];
    [parameter setObject:@([driver longLongValue]) forKey:@"driver"];
    [parameter setObject:contactNumber forKey:@"contactNumber"];
    [parameter setObject:mileage forKey:@"mileage"];
    [parameter setObject:@([shipType longLongValue]) forKey:@"shipType"];
    [parameter setObject:@([transportType longLongValue]) forKey:@"transportType"];
    [parameter setObject:planDepartureTime forKey:@"planDepartureTime"];
    [parameter setObject:planArrivalTime forKey:@"planArrivalTime"];
    [parameter setObject:actualDepartureTime forKey:@"actualDepartureTime"];
    [parameter setObject:actualArrivalTime forKey:@"actualArrivalTime"];
    [parameter setObject:@([conveyance longLongValue])  forKey:@"conveyance"];
    [parameter setObject:deliveryNoteID forKey:@"deliveryNoteID"];
    [parameter setObject:@([transporterTeamId longLongValue])  forKey:@"transporterTeamId"];
    [parameter setObject:@([appInState longLongValue])  forKey:@"appInState"];
    // 暂不开放
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
                           failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [AdminUrlFile checkEnRoadInfoPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:@(page) forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [EnRouteModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
                             failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(transportItemIds), @"调度单明细号不能为空");
    Tooltips(isStringEmpty(transportNoteId), @"调度单号不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile removeTransItemPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:transportItemIds forKey:@"transportItemIds"];
    [parameter setObject:transportNoteId forKey:@"transportNoteId"];
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
                                   failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [AdminUrlFile findDeliveryItemEnRoadInfoPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:@(page) forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [EnRouteModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
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
                          failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(deliveryItemIds), @"运单单明细号不能为空");
    Tooltips(isStringEmpty(transportNoteId), @"调度单号不能为空");
    // 路径
    NSString *pathUrl = [AdminUrlFile addDeliveryItemPathUrl];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:deliveryItemIds forKey:@"deliveryItemIds"];
    [parameter setObject:transportNoteId forKey:@"transportNoteId"];
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

/**
 在途管理 - 操作： 生效、 发车、 到达、 作废
 
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
                         failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    // 路径
    NSString *pathUrl;
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    if ([action_type isEqualToString:@"生效"]) {
        pathUrl  = [AdminUrlFile effectiveEnRoadPathUrl];
    }else if ([action_type isEqualToString:@"发车"]) {
        pathUrl  = [AdminUrlFile carStartEnRoadPathUrl];
    }else if ([action_type isEqualToString:@"到达"]) {
        pathUrl  = [AdminUrlFile carArriveEnRoadPathUrl];
    }else if ([action_type isEqualToString:@"作废"]) {
        pathUrl  = [AdminUrlFile cancelEnRoadPathUrl];
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














@end

