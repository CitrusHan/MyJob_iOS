//
//  UITextField+util.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (util)

/**
 重写UITextField的简单配置
 
 @param textAlignment 文字位置
 @param textColor 文字色值
 @param font 字体及其大小
 @return textField
 */
+ (UITextField *)textFieldWithTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)textColor withFont:(UIFont*)font ;
@end
