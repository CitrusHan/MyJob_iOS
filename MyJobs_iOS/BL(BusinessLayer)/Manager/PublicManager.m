//
//  PublicManager.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/12.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "PublicManager.h"
#import "PublicUrlFile.h"
#import "TransportModel.h"

@implementation PublicManager
// 静态变量
static PublicManager *default_publicManager = nil;
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (default_publicManager == nil) {
            default_publicManager = [PublicManager new];
        }
    });
    return default_publicManager;
}

/**
 调度单明细 - 管理员端在途管理查看明细 or 司机端我的任务：查看调度单明细
 
 @param user_id 用户的ID
 @param list_id 要处理的ID
 @param page 页码
 @param success success description
 @param failure failure description
 */
- (void)checkTransportItemDataWithuser_id:(NSString *)user_id
                                  list_id:(NSString *)list_id
                                     page:(NSInteger )page
                                  success:(void (^)(BOOL isSuccess, NSArray *array))success
                                  failure:(void (^)(NSString *errorMessage))failure {
    Tooltips(isStringEmpty(user_id), @"用户ID不能为空");
    Tooltips(isStringEmpty(list_id), @"记录ID不能为空");
    if (page <= 0) {
        page = 1;
    }
    // 路径
    NSString *pathUrl = [PublicUrlFile checkTransportItem];
    // 参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:user_id forKey:@"user_id"];
    [parameter setObject:list_id forKey:@"id"];
    [parameter setObject:@(page) forKey:@"page"];
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue] == 0) {
                NSArray *array = [TransportModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
                success(YES,array);
            }else {
                NSArray *array = @[responseObject[@"message"]];
                success(NO,array);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
    
}

@end
