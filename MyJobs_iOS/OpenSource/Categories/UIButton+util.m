//
//  UIButton+util.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UIButton+util.h"

@implementation UIButton (util)

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
+ (UIButton *)buttonWithString:(NSString *)string withBackgroundImage:(UIImage *)image withBackgroundColor:(UIColor *)color  withTextAlignment:(NSTextAlignment)textAlignment  withTextColor:(UIColor *)textColor withFont:(UIFont *)font {
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    if (string) {
        
        [button setTitle:string forState:UIControlStateNormal];
    }
    if (image) {
        
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    if (color) {
        
        button.backgroundColor = color;
    }
    if (textColor) {
        
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (font) {
        
        button.titleLabel.font = font;
    }
    button.titleLabel.textAlignment = textAlignment;
    return button;
}
@end
