//
//  UILabel+util.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (util)

/**
 设置UILabel -- 文字、位置、颜色

 @param string 文字
 @param textAlignment 文字位置
 @param textColor textColor description字体颜色
 @return UILabel
 */
+ (UILabel *)labelWithString:(NSString *)string withTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor;
/**
 设置UILabel -- 文字位置、颜色、字体
 
 @param textAlignment 文字位置
 @param textColor 文本颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelwithTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont *)font ;

/**
 设置UILabel-- 文字、位置、颜色、字体
 
 @param string 文字
 @param textAlignment 文字位置
 @param textColor 文本颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithString:(NSString *)string withTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont *)font ;


@end
