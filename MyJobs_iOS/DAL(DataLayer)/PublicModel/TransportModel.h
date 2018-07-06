//
//  TransportModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/12.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 调度单
 */
@interface TransportModel : NSObject
//列表ID
@property (nonatomic, strong) NSString *list_id;
@property (nonatomic, strong) NSString *transportNoteNr;      //调度单号
@property (nonatomic, strong) NSString *lineRouteId;           //线路
@property (nonatomic, strong) NSString *dispatchState;         //调度单状态
@property (nonatomic, strong) NSString *tractorId;             //车牌号
@property (nonatomic, strong) NSString *deparPlace;            //出发地
@property (nonatomic, strong) NSString *destination;           //目的地
@property (nonatomic, strong) NSString *driver;                //司机
@property (nonatomic, strong) NSString *contactNumber;       //联系电话
@property (nonatomic, strong) NSString *orderTime;             //下单时间
@property (nonatomic, strong) NSString *planDepartureTime;     //计划出发时间
@property (nonatomic, strong) NSString *planArrivalTime;       //计划到达时间
@property (nonatomic, strong) NSString *actualDepartureTime;   //实际出发时间
@property (nonatomic, strong) NSString *actualArrivalTime;     //实际到达时间

/**
 明细
 */
@property (nonatomic, strong) NSString *vinCode;//VIN码
@property (nonatomic, strong) NSString *carModel;//车型
@property (nonatomic, strong) NSString *deliveryNoteNr;//运单号
@property (nonatomic, strong) NSString *carrierCompany;//承运公司
@property (nonatomic, strong) NSString *dealer;//经销商
@property (nonatomic, strong) NSString *crdersTime;//接单时间
@property (nonatomic, strong) NSString *orderType;//订单类型
@property (nonatomic, strong) NSString *regarrivalTime;//规定到达时间
@property (nonatomic, strong) NSString *organization;//委托方

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *cityList; //城市下拉
@property (nonatomic, strong) NSArray *dispatchStateList;//调度单状态下拉
@property (nonatomic, strong) NSArray *lineRouteList;//线路下拉
@property (nonatomic, strong) NSArray *tractorList;//车牌号下拉
@property (nonatomic, strong) NSArray *driverList;//司机下拉
@end
