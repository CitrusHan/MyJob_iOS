//
//  SparePartModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/17.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SparePartModel : NSObject

@property (nonatomic, strong) NSString *list_id;//列表ID
/**
 出库列表
 */
@property (nonatomic, strong) NSString *outStockNr;//出库单号
@property (nonatomic, strong) NSString *outStockName; //出库单名称
@property (nonatomic, strong) NSString *outStockDate;    //出库日期
@property (nonatomic, strong) NSString *carId;//车头
@property (nonatomic, strong) NSString *driverId;//驾驶员
@property (nonatomic, strong) NSString *state; //状态

/**
 出库明细
 */
@property (nonatomic, strong) NSString *carSparesOutStockId;//出库单ID
@property (nonatomic, strong) NSString *project;//项目
@property (nonatomic, strong) NSString *tireId;//轮胎
@property (nonatomic, strong) NSString *carSpareId;//车辆备品
@property (nonatomic, strong) NSString *amount;//数量
@property (nonatomic, strong) NSString *unit;//单位


@property (nonatomic, strong) NSString *remark;//备注

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *carIdList;//车头下拉
@property (nonatomic, strong) NSArray *stateList;//状态下拉
@end
