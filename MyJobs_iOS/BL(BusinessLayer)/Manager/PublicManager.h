//
//  PublicManager.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/12.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicManager : NSObject
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager ;

#pragma mark - 调度单明细

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
                                  failure:(void (^)(NSString *errorMessage))failure ;
@end
