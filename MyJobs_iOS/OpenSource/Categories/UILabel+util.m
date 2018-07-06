//
//  UILabel+util.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UILabel+util.h"

@implementation UILabel (util)

/**
 设置UILabel -- 文字、位置、颜色
 
 @param string 文字
 @param textAlignment 文字位置
 @param textColor textColor description字体颜色
 @return UILabel
 */
+ (UILabel *)labelWithString:(NSString *)string withTextAlignment:(NSTextAlignment)textAlignment   withTextColor:(UIColor *)textColor {
    return [self labelWithString:string withTextAlignment:textAlignment withTextColor:textColor withFont:nil];
}

/**
 设置UILabel -- 文字位置、颜色、字体
 
 @param textAlignment 文字位置
 @param textColor 文本颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelwithTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont *)font {
    return [self labelWithString:nil withTextAlignment:textAlignment withTextColor:textColor withFont:font];
}

/**
 设置UILabel-- 文字、位置、颜色、字体
 
 @param string 文字
 @param textAlignment 文字位置
 @param textColor 文本颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithString:(NSString *)string withTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    // 设置文字
    if (string) {
        label.text = string;
    }
    // 设置文字颜色
    if (textColor) {
        label.textColor = textColor;
    }
    
    // 设置字体
    if (font) {
        label.font = font;
    }
    
    label.textAlignment = textAlignment;
    return label;
}
@end
