//
//  MyJobs_Prefix.h
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/8.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#ifndef MyJobs_Prefix_h
#define MyJobs_Prefix_h

/*--------------------------------------severApi-----------------------------------------*/
//#define SeverApiOfJave @"http://10.1.70.205:8001" //java本地服务器
#define SeverApiOfJave @"http://119.254.13.226:8080/FMS" //java外网服务器

/*---------------------------------应用常用文件的头文件-------------------------------------*/
// 常用类别
#import "UIView+util.h"
#import "UILabel+util.h"
#import "UIImage+util.h"
#import "UIButton+util.h"
#import "UITextField+util.h"
#import "NSAttributedString+util.h"
// 常用第三方
#import "Masonry.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "HJMBProgressHUD.h"
#import "HJNetworkManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ClusterPrePermissions.h"
//#import "RMUniversalAlert.h"

// 常用项目文件
#import "UserManager.h"
#import "UserModel.h"

/*--------------------------------------屏幕宽度和高度------------------------------------*/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_HEIGHT_NoNavigationBar [UIScreen mainScreen].bounds.size.height - 64
#define SCREEN_HEIGHT_NoTabBar [UIScreen mainScreen].bounds.size.height - 49
#define SCREEN_HEIGHT_NoBar [UIScreen mainScreen].bounds.size.height  - 64 - 49

/*----------------------------------View的比例宽度和比例高度(这里以6的尺寸为参照)--------------------------------*/
// double ceil (double); 取上整:如果参数是小数，则求最小的整数但不小于本身.  float floorf(float); 取下整：如果参数是小数，则求最大的整数但不大于本身.
#define viewWidth(width) ceil(width * SCREEN_WIDTH / 375)
#define viewHeight(height) ceil(height * SCREEN_HEIGHT / 668)
#define floorViewWidth(width) floorf(width * SCREEN_WIDTH / 375)
#define floorViewHeight(height) floorf(height * SCREEN_HEIGHT / 668)

/*-----------------------------------------Color---------------------------------------*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define AppPromptColor UIColorFromRGB(0xFBB543) // 提示 or 鼓励操作颜色
#define AppFontColor [UIColor blackColor] // 黑色字体

/*-------------------------------------Application KeyWindow----------------------------*/
#define AppMainWindow [UIApplication sharedApplication].keyWindow

/*---------------------------------------Font and size--------------------------------*/
#define SystemFont(F) [UIFont systemFontOfSize:F]

//----------------------------PlaceHolder Img ---------------------------
#define Rectangle_PlaceHolderImg [UIImage imageNamed:@"icon_rectangle_placeholder"]
#define Square_PlaceHolderImg [UIImage imageNamed:@"icon_square_placeholder"]

/*------------------------------ 判断对象（object）是否为空-------------------------------*/
// 判断字符串是否为空
#define isStringEmpty(string)  (!string || [string isEqual:[NSNull null]] || [string isEqualToString:@""] || string.length <= 0)
// 判断条件是否成立，失败则返回错误信息，主要针对Manager层
#define Tooltips(condition, failMessage) if(condition){ if(failure) failure(failMessage); return ;}


/*------------------------------ iOS系统 -------------------------------*/
#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)

/*---------------------------------替代开发中Debug时的NSLog-------------------------------------*/
// 替代开发中Debug时的NSLog，release模式编译的程序不会用NSLog输出，而以debug模式编译的程序将执行NSLog的全部功能，在发布时不用再删除输出操作
#ifdef DEBUG
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DebugLog( s, ... )
#endif


#endif /* MyJobs_Prefix_h */
