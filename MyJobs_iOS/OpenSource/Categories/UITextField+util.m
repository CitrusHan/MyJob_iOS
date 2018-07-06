//
//  UITextField+util.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UITextField+util.h"

@implementation UITextField (util)

/**
 重写UITextField的简单配置
 
 @param textAlignment 文字位置
 @param textColor 文字色值
 @param font 字体及其大小
 @return textField
 */
+ (UITextField *)textFieldWithTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont*)font {
    
    UITextField *textField = [[UITextField alloc] init];
    if (textColor) {
        
        textField.textColor = textColor;
    }
    if (font) {
        
        textField.font = font;
    }
    textField.textAlignment = textAlignment;
    return textField;
}

@end
