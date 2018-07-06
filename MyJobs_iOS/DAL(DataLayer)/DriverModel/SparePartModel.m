//
//  SparePartModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/17.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "SparePartModel.h"

@implementation SparePartModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             };
}

//出库日期
- (NSString *)outStockDate {
    NSString *outStockDateStr = [_outStockDate substringToIndex:10];
    return outStockDateStr;
}

@end
