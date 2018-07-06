//
//  NSAttributedString+util.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (util)

/**
 NSAttributedString的尺寸

 @return Size
 */
- (CGSize)attributedStringSize ;

/**
 NSAttributedString的高度
 
 @param width string的宽度
 @return 高度
 */
- (CGFloat)heightOfStringWithWidth:(CGFloat)width ;

/**
 NSAttributedString的宽度
 
 @param height string的高度
 @return 宽度
 */
- (CGFloat)widthOfStringWithHeight:(CGFloat)height ;

/**
 根据String创建行间距、字间距

 @param string 原文字
 @param lineSpacing 行间距
 @param kernSpacing 字间距
 @return NSAttributedString
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string lineSpacing:(CGFloat)lineSpacing kernSpacing:(CGFloat)kernSpacing ;

/**
 设置String的行间距、字间距、字体颜色
 
 @param string      原NSString
 @param lineSpacing 行间距
 @param kernSpacing 字间距
 @param fontColor   字体颜色
 @return NSAttributedString
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string lineSpacing:(CGFloat)lineSpacing kernSpacing:(CGFloat)kernSpacing fontColor:(UIColor *)fontColor ;

/**
 设置富文本
 
 @param string 文字
 @param kernSpace 字间距
 @param font 字体
 @param fontColor 字体颜色
 @return 富文本
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string kernSpace:(CGFloat)kernSpace lineSpace:(CGFloat)lineSpace font:(UIFont *)font fontColor:(UIColor *)fontColor ;

/**
 设置段落样式
 @param string    段落
 @param lineSpace 行高
 @param kernSpace 字间距
 @param font      字体
 @return NSAttributedString
 */
+ (NSMutableAttributedString *)paragraphOfString:(NSString *)string withParagraphSpeace:(CGFloat)lineSpace WithKernSpace:(CGFloat)kernSpace withFont:(UIFont *)font withFontColor:(UIColor *)fontColor ;

/**
 设置富文本
 
 @param string 文字
 @param kernSpace 字间距
 @param font 字体
 @param fontColor 字体颜色
 @return 富文本
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string kernSpace:(CGFloat)kernSpace font:(UIFont *)font fontColor:(UIColor *)fontColor;

@end
