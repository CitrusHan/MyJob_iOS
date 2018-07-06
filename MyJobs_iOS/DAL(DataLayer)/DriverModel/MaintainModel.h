//
//  MaintainModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/15.
//  Copyright © 2018年 JaneHan. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface MaintainModel : NSObject

@property (nonatomic, strong) NSString *list_id;//列表ID
@property (nonatomic, strong) NSString *carId;       //  车辆ID
@property (nonatomic, strong) NSString *driverId;       //  司机
@property (nonatomic, strong) NSString *transportNoteId;  //  调度单ID
@property (nonatomic, strong) NSString *repairDate;    //  维修时间
@property (nonatomic, strong) NSString *repairMoney;   //  维修金额
@property (nonatomic, strong) NSString *repairPlace;   //  维修地点
@property (nonatomic, strong) NSString *repairProject;   //  维修项目
@property (nonatomic, strong) NSString *state;      //  审核状态
@property (nonatomic, strong) NSString *reason;   //  审核不通过原因
@property (nonatomic, strong) NSString *auditor;      //  审核人
@property (nonatomic, strong) NSString *remark ;      //  备注
@property (nonatomic, strong) NSString *repairImage;   //  维修图片
@property (nonatomic, strong) NSString *repairVedio;     //  维修视频
/**
 暂时未开放
 */
@property (nonatomic, strong) NSString *tenantId;//  租户ID

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *carIdList;//车辆下拉
@property (nonatomic, strong) NSArray *transportNoteIdList;//调度单下拉
@property (nonatomic, strong) NSArray *stateList;//审核状态下拉

@end
