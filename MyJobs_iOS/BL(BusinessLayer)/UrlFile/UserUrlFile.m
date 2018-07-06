//
//  UserUrlFile.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserUrlFile.h"

@implementation UserUrlFile
#pragma mark - 登录接口
/**
 用户登录 - 登录接口
 
 @return URL
 */
+ (NSString *)userLoginPathUrl {
    return @"/apiLoginAction_login";
}
@end
