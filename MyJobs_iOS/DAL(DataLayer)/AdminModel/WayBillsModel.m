//
//  WayBillsModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/25.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "WayBillsModel.h"

@implementation WayBillsModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             };
}

//接单时间
- (NSString *)orderTime {
    NSString *orderTimeStr = [_orderTime substringToIndex:10];
    return orderTimeStr;
}

//接单时间
- (NSString *)crdersTime {
    NSString *crdersTimeStr = [_crdersTime substringToIndex:10];
    return crdersTimeStr;
}

//规定到达时间
- (NSString *)regarrivalTime{
    NSString *regarrivalTimeStr = [_regarrivalTime substringToIndex:10];
    return regarrivalTimeStr;
}


@end
