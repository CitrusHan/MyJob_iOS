//
//  BorrowingModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/17.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BorrowingModel : NSObject


/**
 借款
 */
@property (nonatomic, strong) NSString *list_id;//列表ID
@property (nonatomic, strong) NSString *loanNr;     //借款号
@property (nonatomic, strong) NSString *departureDate;         //发车日期
@property (nonatomic, strong) NSString *originatesite;         //始发地
@property (nonatomic, strong) NSString *destination;           //目的地
@property (nonatomic, strong) NSString *mileage;             //里程
@property (nonatomic, strong) NSString *vehicleSubsidy;      //出车补助
@property (nonatomic, strong) NSString *foreignaid;          //驻外补助
@property (nonatomic, strong) NSString *warrantyFee;         //洗车费/质保费
@property (nonatomic, strong) NSString *parkingFee;          //停车费
@property (nonatomic, strong) NSString *lookTraveExpense;    //带路费
@property (nonatomic, strong) NSString *fine;                //罚款
@property (nonatomic, strong) NSString *carPutFee;           //商品车提车费
@property (nonatomic, strong) NSString *carFuelCharge;       //商品车加油费
@property (nonatomic, strong) NSString *carTwater;           //大车加水
@property (nonatomic, strong) NSString *otherFee;            //其他费用
@property (nonatomic, strong) NSString *fuelChargeTotal;     //燃油费合计
@property (nonatomic, strong) NSString *loadFeeTotal;        //路桥费合计
@property (nonatomic, strong) NSString *remark;          //备注

/**
 分油
 */
@property (nonatomic, strong) NSString *distributeOilNr;     //分油号
@property (nonatomic, strong) NSString *dieselCardNr;          //油卡号
@property (nonatomic, strong) NSString *departurePlace;        //启运地
@property (nonatomic, strong) NSString *furthestdes;           //目的地
@property (nonatomic, strong) NSString *dieselConsum;        //油耗
@property (nonatomic, strong) NSString *dieselCost;          //油费
@property (nonatomic, strong) NSString *shouldBuckle;        //应补应扣
@property (nonatomic, strong) NSString *actuaDiemoney;       //实际划油金额

/**
 通用参数
 */
@property (nonatomic, strong) NSString *tractorId;             //车牌号
@property (nonatomic, strong) NSString *driverId;              //司机
@property (nonatomic, strong) NSString *transportNoteId;       //调度单号
@property (nonatomic, strong) NSString *reviewer;                 //审核人
@property (nonatomic, strong) NSString *state;                 //审核状态

/**
 暂时未开放
 */
@property (nonatomic, strong) NSString *tenantId;//  租户ID

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *dieselCardNrList;//油卡号下拉
@property (nonatomic, strong) NSArray *tractorIdList;//车牌号下拉
@property (nonatomic, strong) NSArray *transportNoteIdList;//调度单号下拉
@property (nonatomic, strong) NSArray *stateList;//审核状态下拉
@property (nonatomic, strong) NSArray *cityList;//城市下拉



@end
