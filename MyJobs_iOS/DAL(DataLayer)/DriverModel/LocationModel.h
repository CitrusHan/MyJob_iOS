//
//  LocationModel.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationModel : NSObject
@property (nonatomic, strong) NSString *list_id;//列表ID
@property (nonatomic, strong) NSString *carId;//车牌号
@property (nonatomic, strong) NSString *driverId;//  驾驶员
@property (nonatomic, strong) NSString *transportNoteId;//调度单号
@property (nonatomic, strong) NSString *longitude;//经度
@property (nonatomic, strong) NSString *latitude;//纬度
@property (nonatomic, strong) NSString *address;//位置
@property (nonatomic, strong) NSString *uploadDate;//上传日期
@property (nonatomic, strong) NSString *uploadType;//上报方式
@property (nonatomic, strong) NSString *remark;//备注

/**
 暂时未开放
 */
@property (nonatomic, strong) NSString *tenantId;//  租户ID

/**
 下拉列表
 */
@property (nonatomic, strong) NSArray *carIdList;//车牌号下拉列表数组
@property (nonatomic, strong) NSArray *transportNoteIdList;//调度单号下拉列表数组
@property (nonatomic, strong) NSArray *uploadTypeList;//上报方式下拉列表数组

@end
