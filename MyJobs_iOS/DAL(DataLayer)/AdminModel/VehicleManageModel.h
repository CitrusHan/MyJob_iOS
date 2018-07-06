//
//  VehicleManageModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/19.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VehicleManageModel : NSObject

//列表ID
@property (nonatomic, strong) NSString *list_id;
//车主姓名
@property (nonatomic, strong) NSString *name;
//车牌号码
@property (nonatomic, strong) NSString *carPlate;
//手机号码
@property (nonatomic, strong) NSString *phone;
//季审日期
@property (nonatomic, strong) NSString *quarterDate;
//季审到期日期
@property (nonatomic, strong) NSString *quarterEndDate;
//年审日期
@property (nonatomic, strong) NSString *operatingDate;
//年审到期日期
@property (nonatomic, strong) NSString *operatingEndDate;
//登记日期
@property (nonatomic, strong) NSString *registerDate;
//身份证
@property (nonatomic, strong) NSString *idCard;

@property (nonatomic, strong) NSString *state;//状态 1是有效 0是无效
@property (nonatomic, strong) NSString *equipmentId;//车辆底盘号
@property (nonatomic, strong) NSString *tracNumber;//车牌号
@property (nonatomic, strong) NSString *department;//部门
@property (nonatomic, strong) NSString *transportertemId;//隶属车队id
@property (nonatomic, strong) NSString *employeeId;//驾驶员id
@property (nonatomic, strong) NSString *carType;//车辆类型id
@property (nonatomic, strong) NSString *brandType;//品牌类型id
@property (nonatomic, strong) NSString *displacementPower;//排量/功率
@property (nonatomic, strong) NSString *outlineSize;//外廓尺寸
@property (nonatomic, strong) NSString *insideSize;//内部尺寸
@property (nonatomic, strong) NSString *totalWeight;//总质量
@property (nonatomic, strong) NSString *ureaNr;//尿素量（每公里）
@property (nonatomic, strong) NSString *fullOil;//满载油耗（每公里）
@property (nonatomic, strong) NSString *bareOil;//空驶油耗（每公里）
@property (nonatomic, strong) NSString *emptySubsidy; //空驶补助（每公里）
@property (nonatomic, strong) NSString *heavySubsidy; //重驶补助（每公里）

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *transportertemMap;     // 隶属车队
@property (nonatomic, strong) NSArray *employeeMap;    //员工下拉
@property (nonatomic, strong) NSArray *carTypeMap; //车辆类型下拉
@property (nonatomic, strong) NSArray *brandTypeMap;  //品牌类型下拉

@end
