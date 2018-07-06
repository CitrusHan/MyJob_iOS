//
//  ViewController.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 单例
 
 @return return value description
 */
+ (ViewController *)defaultRootViewController ;

/**
 未登录登录
 */
- (void)transitionDisplayViewController ;

/**
 登录
 */
- (void)transitionMainViewController ;

/**
 退出登录
 */
- (void)transitionLogoutViewController ;
@end

