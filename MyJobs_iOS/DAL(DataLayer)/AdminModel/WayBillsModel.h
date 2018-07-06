//
//  WayBillsModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/25.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WayBillsModel : NSObject
//列表ID
@property (nonatomic, strong) NSString *list_id;
@property (nonatomic, strong) NSString *organization;    //委托方
@property (nonatomic, strong) NSString *deliveryNoteNr;//运单号
@property (nonatomic, strong) NSString *dealer;          //经销商
@property (nonatomic, strong) NSString *deparPlace;        //出发地
@property (nonatomic, strong) NSString *destination;     //目的地
@property (nonatomic, strong) NSString *orderTime;         //接单时间
@property (nonatomic, strong) NSString *state;             //运单状态
@property (nonatomic, strong) NSString *carrier;       //承运商
@property (nonatomic, strong) NSString *dealerPhone;//经销商号码
@property (nonatomic, strong) NSString *carrierPhone;//承运商号码
@property (nonatomic, strong) NSString *totalCost;//合计运输费用
@property (nonatomic, strong) NSString *settleAmount;      //结算数量
@property (nonatomic, strong) NSString *orderType;//订单类型id
@property (nonatomic, strong) NSString *brand;//品牌
@property (nonatomic, strong) NSString *settleType;//结算类型id
@property (nonatomic, strong) NSString *deliveryAddress;//交车地址
@property (nonatomic, strong) NSString *insurance;//保险费
@property (nonatomic, strong) NSString *freight;//运费
@property (nonatomic, strong) NSString *deliveryFee;//送货费
@property (nonatomic, strong) NSString *disburseFee;//垫付费
@property (nonatomic, strong) NSString *otherExpense;//其他费用
@property (nonatomic, strong) NSString *receivable;//应收
@property (nonatomic, strong) NSString *payable;//应付
@property (nonatomic, strong) NSString *grossProfit;




/**
 详情
 */
@property (nonatomic, strong) NSString *vinCode;//VIN码
@property (nonatomic, strong) NSString *carModel;//车型
@property (nonatomic, strong) NSString *transportNoteNr;       //调度单号
@property (nonatomic, strong) NSString *carrierCompany;//承运公司
@property (nonatomic, strong) NSString *crdersTime;//接单时间
@property (nonatomic, strong) NSString *regarrivalTime;//规定到达时间
@property (nonatomic, strong) NSString *remake;//备注
@property (nonatomic, strong) NSString *warehouseName;//所属仓库名称

/**
 数据源 - 下拉列表
 */
@property (nonatomic, strong) NSArray *stateList;//运单状态下拉
@property (nonatomic, strong) NSArray *cityList; //城市下拉
@property (nonatomic, strong) NSArray *employeeList;
@property (nonatomic, strong) NSArray *tractorList;
@property (nonatomic, strong) NSArray *lineRouteList;
@property (nonatomic, strong) NSArray *organizationList;
@property (nonatomic, strong) NSArray *orderTypeList;
@property (nonatomic, strong) NSArray *settleTypeList;
@property (nonatomic, strong) NSArray *dealerList;
@property (nonatomic, strong) NSArray *carrierList;


@end
