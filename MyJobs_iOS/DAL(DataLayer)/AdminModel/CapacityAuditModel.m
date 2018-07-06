//
//  CapacityAuditModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/19.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "CapacityAuditModel.h"

@implementation CapacityAuditModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             };
}

//驻库时间
- (NSString *)retenTime {
    NSString *retenTimeStr = [_retenTime substringToIndex:10];
    return retenTimeStr;
    
}

//可用时间从
- (NSString *)availableTimeFrom {
    NSString *availableTimeFromStr = [_availableTimeFrom substringToIndex:10];
    return availableTimeFromStr;
}

//到
- (NSString *)availableTimeTo {
    NSString *availableTimeToStr = [_availableTimeTo substringToIndex:10];
    return availableTimeToStr;
}

@end
