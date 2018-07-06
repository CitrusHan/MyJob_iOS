//
//  LocationModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/9.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             };
}

/**
 上传日期

 @return uploadDate
 */
- (NSString *)uploadDate {
    NSString *uploadDateStr = [_uploadDate substringToIndex:10];
    return uploadDateStr;
}

@end
