//
//  NSAttributedString+util.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "NSAttributedString+util.h"

@implementation NSAttributedString (util)

/**
 NSAttributedString的尺寸
 
 @return Size
 */
- (CGSize)attributedStringSize {
    if (self.string.length == 0) {
        
        return CGSizeZero;
    }else {
        
        NSRange range = NSMakeRange(0, self.string.length);
        NSDictionary *dic = [self attributesAtIndex:0 effectiveRange:&range];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        CGRect rect = [self.string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil];
        return rect.size;
    }
}

/**
 NSAttributedString的高度
 
 @param width string的宽度
 @return 高度
 */
- (CGFloat)heightOfStringWithWidth:(CGFloat)width {
    
    if (self.string.length == 0) {
        
        return 0;
    }else {
        
        NSRange range = NSMakeRange(0, self.string.length);
        NSDictionary *dic = [self attributesAtIndex:0 effectiveRange:&range];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        CGRect rect = [self.string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil];
        return rect.size.height;
    }
}

/**
 NSAttributedString的宽度
 
 @param height string的高度
 @return宽度
 */
- (CGFloat)widthOfStringWithHeight:(CGFloat)height {
    
    if (self.string.length == 0) {
        
        return 0;
    }else {
        
        NSRange range = NSMakeRange(0, self.string.length);
        NSDictionary *dic = [self attributesAtIndex:0 effectiveRange:&range];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        CGFloat maxHeight = height;
        CGRect rect = [self.string boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil];
        
        return rect.size.width;
    }
}

/**
 根据String创建行间距、字间距
 
 @param string 原文字
 @param lineSpacing 行间距
 @param kernSpacing 字间距
 @return NSAttributedString
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string lineSpacing:(CGFloat)lineSpacing kernSpacing:(CGFloat)kernSpacing {
    
    if (!string) {
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (lineSpacing > 0) {
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        //调整行间距
        [paragraphStyle1 setLineSpacing:lineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, string.length)];
    }
    
    if (kernSpacing > 0) {
        [attributedString addAttribute:NSKernAttributeName value:@(kernSpacing) range:NSMakeRange(0, string.length)];
    }
    
    return attributedString;
}

/**
 设置String的行间距、字间距、字体颜色
 
 @param string      原NSString
 @param lineSpacing 行间距
 @param kernSpacing 字间距
 @param fontColor   字体颜色
 @return NSAttributedString
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string lineSpacing:(CGFloat)lineSpacing kernSpacing:(CGFloat)kernSpacing fontColor:(UIColor *)fontColor{
    
    if (!string) {
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (lineSpacing > 0) {
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        //调整行间距
        [paragraphStyle1 setLineSpacing:lineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, string.length)];
    }
    
    if (kernSpacing > 0) {
        [attributedString addAttribute:NSKernAttributeName value:@(kernSpacing) range:NSMakeRange(0, string.length)];
    }
    
    if (fontColor) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:fontColor range:NSMakeRange(0, string.length)];
    }
    
    return attributedString;
}

/**
 设置富文本
 
 @param string 文字
 @param kernSpace 字间距
 @param font 字体
 @param fontColor 字体颜色
 @return 富文本
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string kernSpace:(CGFloat)kernSpace font:(UIFont *)font fontColor:(UIColor *)fontColor {
    return [self paragraphOfString:string withParagraphSpeace:0 WithKernSpace:kernSpace withFont:font withFontColor:fontColor];
}

/**
 设置富文本
 
 @param string 文字
 @param kernSpace 字间距
 @param font 字体
 @param fontColor 字体颜色
 @return 富文本
 */
+ (NSMutableAttributedString *)util_attributedStringOfString:(NSString *)string kernSpace:(CGFloat)kernSpace lineSpace:(CGFloat)lineSpace font:(UIFont *)font fontColor:(UIColor *)fontColor {
    return [self paragraphOfString:string withParagraphSpeace:lineSpace WithKernSpace:kernSpace withFont:font withFontColor:fontColor];
}

/**
 设置段落样式
 @param string    段落
 @param lineSpace 行高
 @param kernSpace 字间距
 @param font      字体
 @return 富文本
 */
+ (NSMutableAttributedString *)paragraphOfString:(NSString *)string withParagraphSpeace:(CGFloat)lineSpace WithKernSpace:(CGFloat)kernSpace withFont:(UIFont *)font withFontColor:(UIColor *)fontColor {
    
    if (!string) {
        
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    if (lineSpace > 0) {
        
        // 设置段落
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        //调整行间距
        [paragraphStyle1 setLineSpacing:lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, string.length)];
    }
    if (kernSpace > 0) {
        
        // NSKernAttributeName字体间距
        [attributedString addAttribute:NSKernAttributeName value:@(kernSpace) range:NSMakeRange(0, string.length)];
    }
    if (font) {
        
        // 创建文字属性
        [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    }
    if (fontColor) {
        
        // 设置文字颜色
        [attributedString addAttribute:NSForegroundColorAttributeName value:fontColor range:NSMakeRange(0, string.length)];
    }
    return attributedString;
}
@end
