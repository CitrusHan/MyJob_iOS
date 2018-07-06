//
//  AccidentModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/15.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccidentModel : NSObject
@property (nonatomic, strong) NSString *list_id;//列表ID
@property (nonatomic, strong) NSString *year;             //  年度
@property (nonatomic, strong) NSString *carId;       //  车辆ID
@property (nonatomic, strong) NSString *driverId;      //  责任司机
@property (nonatomic, strong) NSString *transportNoteId;  //  调度单ID
@property (nonatomic, strong) NSString *accidentType;    //  事故类型
@property (nonatomic, strong) NSString *accidentDate;    //  事故时间
@property (nonatomic, strong) NSString *address;     //  事故地点
@property (nonatomic, strong) NSString *content;         //  事故简况
@property (nonatomic, strong) NSString *underTakerId;   //  责任划分
@property (nonatomic, strong) NSString *needInsurance;      //  是否申报保险
@property (nonatomic, strong) NSString *insuranceMoney;   //  保险金额
@property (nonatomic, strong) NSString *insuranceSource;   //  保险金额来源
@property (nonatomic, strong) NSString *remark ;      //  备注

/**
 暂时未开放
 */
@property (nonatomic, strong) NSString *tenantId;//  租户ID


/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *carIdList;//车辆下拉
@property (nonatomic, strong) NSArray *transportNoteIdList;//调度单下拉
@property (nonatomic, strong) NSArray *accidentTypeList;//事故类型下拉
@property (nonatomic, strong) NSArray *underTakerIdList;//责任划分下拉
@end
