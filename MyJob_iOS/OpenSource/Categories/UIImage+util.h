//
//  UIImage+util.h
//  MyJob_iOS
//
//  Created by Jing on 2017/8/24.
//  Copyright © 2017年 JaneHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (util)

/**
 *  图片压缩
 *
 *  @param sourceImage   被压缩的图片
 *  @param defineWidth 被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+(UIImage *)imageCompressed:(UIImage *)sourceImage withdefineWidth:(CGFloat)defineWidth ;

/**
 设置图片颜色
 
 @param tintColor 色值
 @return return value description
 */
- (UIImage *) tintImageWithColor:(UIColor *)tintColor ;
@end
