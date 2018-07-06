//
//  VehicleManageModel.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/19.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "VehicleManageModel.h"

@implementation VehicleManageModel

/**
 替换服务器规定字段，设置前缀，便于了解、使用
 
 @return 服务器字段
 */
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"list_id": @"id",
             @"name": @"employeeName",
             @"carPlate": @"tracNumber",
             @"idCard": @"documentNumber",
             };
}


//车主姓名
- (NSString *)name {
    NSString *name = _name;
    if ( name == nil) {
        name = @"";
    }
    return name;
}
//车牌号码
- (NSString *)carPlate {
    NSString *carPlate = _carPlate;
    if ( carPlate == nil) {
        carPlate = @"";
    }
    return carPlate;
}
//手机号码
- (NSString *)phone {
    NSString *phone = _phone;
    if ( phone == nil) {
        phone = @"";
    }
    return phone;
}


//身份证
- (NSString *)idCard {
    NSString *idCard = _idCard;
    if ( idCard == nil) {
        idCard = @"";
    }
    return idCard;
}

//季审日期
- (NSString *)quarterDate {
    NSString *quarterDateStr = _quarterDate;
    if ( quarterDateStr == nil) {
        quarterDateStr = @"";
    }else {
       quarterDateStr  = [_quarterDate substringToIndex:10];

    }
    return quarterDateStr;
}

//季审到期日期
- (NSString *)quarterEndDate {
    NSString *quarterEndDateStr = _quarterEndDate;
    if ( quarterEndDateStr == nil) {
        quarterEndDateStr = @"";
    }else {
        quarterEndDateStr  = [_quarterEndDate substringToIndex:10];
        
    }
    return quarterEndDateStr;
}

//年审日期
- (NSString *)operatingDate {
    NSString *operatingDateStr = _operatingDate;
    if ( operatingDateStr == nil) {
        operatingDateStr = @"";
    }else {
        operatingDateStr  = [_operatingDate substringToIndex:10];
        
    }
    return operatingDateStr;
}

//年审到期日期
- (NSString *)operatingEndDate {
    NSString *operatingEndDateStr = _operatingEndDate;
    if ( operatingEndDateStr == nil) {
        operatingEndDateStr = @"";
    }else {
        operatingEndDateStr  = [_operatingEndDate substringToIndex:10];
        
    }
    return operatingEndDateStr;
}

//登记日期
- (NSString *)registerDate {
    NSString *registerDateStr = _registerDate;
    if ( registerDateStr == nil) {
        registerDateStr = @"";
    }else {
        registerDateStr  = [_registerDate substringToIndex:10];
        
    }
    return registerDateStr;
}

@end
