//
//  TransportModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/12.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "TransportModel.h"

@implementation TransportModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             };
}
//下单时间
- (NSString *)orderTime {
    NSString *orderTimeStr = [_orderTime substringToIndex:10];
    return orderTimeStr;
}

//计划出发时间
- (NSString *)planDepartureTime {
    NSString *planDepartureTimeStr = [_planDepartureTime substringToIndex:10];
    return planDepartureTimeStr;
}

//计划到达时间
- (NSString *)planArrivalTime {
    NSString *planArrivalTimeStr = [_planArrivalTime substringToIndex:10];
    return planArrivalTimeStr;
}

//实际出发时间
- (NSString *)actualDepartureTime {
    NSString *actualDepartureTimeStr = [_actualDepartureTime substringToIndex:10];
    return actualDepartureTimeStr;
}

//实际到达时间
- (NSString *)actualArrivalTime {
    NSString *actualArrivalTimeStr = [_actualArrivalTime substringToIndex:10];
    return actualArrivalTimeStr;
}

@end
