//
//  UserManager.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UserManager.h"
#import "UserUrlFile.h"
#import "UserModel.h"

@interface UserManager ()

@end

@implementation UserManager
static UserManager *default_userManager = nil;
/**
 单例
 
 @return defaultManager
 */
+ (instancetype)defaultManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (default_userManager == nil) {
            default_userManager = [UserManager new];
        }
    });
    return default_userManager;
}

/**
 登录
 
 @param login 账号
 @param password 密码
 @param success success description
 @param failure failure description
 */
- (void)logInUserWithLogin:(NSString *)login
                  password:(NSString *)password
                   success:(void (^)(BOOL isSuccess, NSString *message))success
                   failure:(void (^)(NSString *errorMessage))failure{
    Tooltips(isStringEmpty(login), @"账号不能为空");
    Tooltips(isStringEmpty(password), @"密码不能为空");
    // 路径
    NSString *pathUrl = [UserUrlFile userLoginPathUrl];
    // 请求的Body
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setObject:login forKey:@"loginId"];
    [parameter setObject:password forKey:@"password"];
    __weak typeof(self) weakself = self;
    [[HJNetworkManager defaultManager] sendRequestMethod:(HTTPMethodPOST) serverUrl:SeverApiOfJave apiPath:pathUrl parameters:parameter progress:NULL success:^(BOOL isSuccess, id  _Nullable responseObject) {
        if (isSuccess) {
            if ([responseObject[@"code"] integerValue]== 0) {
                NSString *message = nil;
                UserModel *userModel = [UserModel mj_objectWithKeyValues:responseObject[@"content"]];
                weakself.activeUser = userModel;
                DebugLog(@"用户信息 == %@",weakself.activeUser);
                BOOL isResult = [weakself saveResponseObject:responseObject errorMessage:&message];
                if (isResult) {
                    DebugLog(@"文件存入成功");
                }
                success(YES,@"登录成功");
            }else {
                success(NO,responseObject[@"content"]);
            }
        }
    } failure:^(NSString * _Nullable errorMessage) {
        if (failure){
            failure(errorMessage);
        }
    }];
}

#pragma mark - private action
#pragma mark 保存用户信息
- (BOOL)saveResponseObject:(id)responseObject errorMessage:(NSString **)errorMessage {
    // 获取到存储路径
    NSString *userFilePath = [self documentFilePathWithUserInfo:@"userInfo"];
    // 用户信息转化
    UserModel *userModel = [UserModel mj_objectWithKeyValues:responseObject[@"content"]];
    NSDictionary *userDic = [userModel mj_keyValues];
    // 将数据写入沙盒
    BOOL userResult = [userDic writeToFile:userFilePath atomically:YES];
    if (userResult) {
        //        DebugLog(@"文件存入成功");
        return YES;
    }else {
        return NO;
    }
}

/**
 *  沙盒路径
 *
 *  @return path
 */
- (NSString *)documentFilePathWithUserInfo:(NSString *)name {
    // 获取到当前的Document文件夹的路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    // 将前面的路径格式和后面的普通的字符串格式链接在一起，并且以路径格式返回。
    NSString * filePath = [documentPath stringByAppendingPathComponent:name];
    return filePath;
}

/**
 *  当前用户信息
 *
 *  @return activeUser
 */
- (UserModel *)activeUser {
    
    if (_activeUser) {
        
        return _activeUser;
    }
    // 获取数据存储路径
    NSString *filePath = [self documentFilePathWithUserInfo:@"userInfo"];
    // 查询数据是否存在
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (isExist) {
        NSDictionary *activeUserDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        if (activeUserDict) {
            
            UserModel * userModel = [UserModel mj_objectWithKeyValues:activeUserDict];
            if (userModel) {
                
                _activeUser = userModel;
                DebugLog(@"用户个人信息：userModel = %@",userModel);
            }
        }
        return _activeUser;
    }else {
        return nil;
    }
}

#pragma mark - 退出登录

/**
 退出当前用户 （删除沙盒里的文件）
 */
- (void)logOutActiveUser {
    // 数据置为空
    [UserManager defaultManager].activeUser = nil;
    // 检查沙盒文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *userFilePath = [self documentFilePathWithUserInfo:@"userInfo"];
    // 文件是否存在
    BOOL  isUserExist = [[NSFileManager defaultManager] fileExistsAtPath:userFilePath];
    NSError *usererror = nil;
    if (!isUserExist) {
        
        DebugLog(@"用户信息文件不存在");
        return ;
    }else {
        DebugLog(@"用户信息文件存在");
        // 删除用户信息
        [fileManager removeItemAtPath:userFilePath error:&usererror];
        if (usererror) {
            DebugLog(@"移除文件失败，错误信息：%@ ", usererror);
        }else {
            DebugLog(@"成功移除文件");
        }
    }
    DebugLog(@"activeUser == %@  ",self.activeUser);
}
@end
