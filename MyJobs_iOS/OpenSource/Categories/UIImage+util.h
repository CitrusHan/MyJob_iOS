//
//  UIImage+util.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
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
