//
//  HJMBProgressHUD.m
//  MyJob_iOS
//
//  Created by Jing on 2017/12/4.
//  Copyright © 2017年 JaneHan. All rights reserved.
//

#import "HJMBProgressHUD.h"
#import "MBProgressHUD.h"

@implementation HJMBProgressHUD
#pragma mark - 常用加载样式
/**
 信息提示（在1.5S后自动隐藏）
 
 @param view 需要显示的view视图
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isAutoHide 是否自动隐藏
 */
+ (void)showLoadingTipsInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail withIsAutoHide:(BOOL)isAutoHide {
    
    if (view == nil) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud == nil) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    // 设置模式和文字
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color = [UIColor blackColor];
    if (title) {
        
        hud.label.text = title;
        hud.label.textColor = [UIColor whiteColor];
    }
    if (detail) {
        
        hud.detailsLabel.text = detail;
        hud.detailsLabel.textColor = [UIColor whiteColor];
    }
    if (isAutoHide) {
        
        [hud hideAnimated:YES afterDelay:1.5f];
    }
}
#pragma mark - 根据UI选择加载颜色 深色背景 浅色加载 适用于浅色UI界面
/**
 菊花加载：黑色背景 白色菊花
 
 @param view 需要显示在的View层
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置展示颜色
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}


/**
 菊花加载：黑色背景 白色菊花  (白色背景 黑色菊花 默认色)
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view title:(NSString *)title isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    // 设置展示颜色
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}

/**
 菊花加载：黑色背景 白色菊花  (白色背景 黑色菊花 默认色)
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithWhiteColorIndeterminateInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.detailsLabel.text = detail;
    // 设置展示颜色
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}

#pragma mark - 根据UI选择加载颜色 浅色背景 深色加载 适用于深色UI界面
/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置展示颜色
    hud.contentColor = [UIColor blackColor];
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}

/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view title:(NSString *)title isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    // 设置展示颜色
    hud.contentColor = [UIColor blackColor];
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}

/**
 菊花加载：白色背景 黑色菊花 默认色
 
 @param view 需要显示在的View层
 @param title 需要显示的文字
 @param detail 需要显示的描述文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithBlackColorIndeterminateInView:(UIView *)view title:(NSString *)title detail:(NSString *)detail isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.detailsLabel.text = detail;
    // 设置展示颜色
    hud.contentColor = [UIColor blackColor];
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    // 响应
    hud.userInteractionEnabled = !isResponse;
}

#pragma mark - 不常用加载样式
/**
 圆饼图带文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithDeterminateInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeDeterminate;
    // 响应
    hud.userInteractionEnabled = !isResponse;
    // Do something useful in the background and update the HUD periodically.
    [self doSomeWorkWithProgressInView:view];
}

/**
 圆环带文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithAnnularDeterminateInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    // 响应
    hud.userInteractionEnabled = !isResponse;
    // Do something useful in the background and update the HUD periodically.
    [self doSomeWorkWithProgressInView:view];
}

/**
 进度条文字加载
 
 @param view       需要显示的view视图
 @param text       需要显示的文字
 @param isResponse 加载期间是否可以响应
 */
+ (void)showLoadingWithDeterminateHorizontalBarInView:(UIView *)view text:(NSString *)text isResponse:(BOOL)isResponse {
    if (view == nil) {
        return ;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    // 响应
    hud.userInteractionEnabled = !isResponse;
    // Do something useful in the background and update the HUD periodically.
    [self doSomeWorkWithProgressInView:view];
}


/**
 在后台做一些有用的事情，并定期更新HUD

 @param view 需要显示的view视图
 */
+ (void)doSomeWorkWithProgressInView:(UIView *)view {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // This just increases the progress indicator in a loop.
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            dispatch_async(dispatch_get_main_queue(), ^{
                // Instead we could have also passed a reference to the HUD
                // to the HUD to myProgressTask as a method parameter.
                [MBProgressHUD HUDForView:view].progress = progress;
            });
            usleep(50000);
        }
    });
}

/**
 隐藏动画
 
 @param view 是否隐藏动画
 */
+ (void)hideWithView:(UIView *)view {
    if (view == nil ) {
        return ;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
