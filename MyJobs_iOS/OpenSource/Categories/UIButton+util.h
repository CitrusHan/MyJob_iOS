//
//  UIButton+util.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (util)

/**
 重写UIButton的简单配置
 
 @param string 命名
 @param image 背景图片
 @param color 背景色
 @param textAlignment 文字位置
 @param textColor 文字色
 @param font 字体和大小
 @return UIButton
 */
+ (UIButton *)buttonWithString:(NSString *)string withBackgroundImage:(UIImage *)image withBackgroundColor:(UIColor *)color  withTextAlignment:(NSTextAlignment)textAlignment  withTextColor:(UIColor *)textColor withFont:(UIFont *)font ;

@end
