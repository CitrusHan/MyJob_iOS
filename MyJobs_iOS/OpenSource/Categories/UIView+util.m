//
//  UIView+util.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "UIView+util.h"

@implementation UIView (util)

/**
 新建View，配置其颜色
 
 @param lineColor 颜色
 @return UIView
 */
+ (UIView *)lineViewWithColor:(UIColor *)lineColor {
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = lineColor;
    return lineView;
}

@end
