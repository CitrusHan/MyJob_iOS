//
//  HJMBProgressHUD.h
//  MyJob_iOS
//
//  Created by Jing on 2017/12/4.
//  Copyright © 2017年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface HJMBProgressHUD : NSObject
#pragma mark - 常用加载样式
/**
 信息提示（在1.5S后自动隐藏）HJMBProgressHUD
 @param view 需要显示的view视图
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isAutoHide 是否自动隐藏
 */
+ (void)showLoadingTipsInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail withIsAutoHide:(BOOL)isAutoHide ;

#pragma mark  根据UI选择加载颜色 深色背景 浅色加载 适用于浅色UI界面
/**
 菊花加载：黑色背景 白色菊花  (白色背景 黑色菊花 默认色)

 @param view 需要显示在的View层
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view isResponse:(BOOL)isResponse ;

/**
 菊花加载：黑色背景 白色菊花  (白色背景 黑色菊花 默认色)
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view title:(NSString *)title isResponse:(BOOL)isResponse ;

/**
 菊花加载：黑色背景 白色菊花  (白色背景 黑色菊花 默认色)
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail isResponse:(BOOL)isResponse ;


#pragma mark  根据UI选择加载颜色 浅色背景 深色加载 适用于深色UI界面
/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view isResponse:(BOOL)isResponse ;

/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view title:(NSString *)title isResponse:(BOOL)isResponse ;

/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail isResponse:(BOOL)isResponse ;

#pragma mark - 不常用加载样式
/**
 圆饼图带文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithDeterminateInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse ;

/**
 圆环带文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithAnnularDeterminateInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse ;

/**
 进度条文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithDeterminateHorizontalBarInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse ;

/**
 隐藏动画
 
 @param view 隐藏动画
 */
+ (void)hideWithView:(UIView *)view ;

@end
