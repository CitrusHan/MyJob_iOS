//
//  PublicUrlFile.m
//  MyJobs_iOS
//
//  Created by Jing on 2018/1/12.
//  Copyright © 2018年 JaneHan. All rights reserved.
//

#import "PublicUrlFile.h"

@implementation PublicUrlFile
/**
 调度单明细 - 管理员端在途管理查看明细 or 司机端我的任务：查看调度单明细
 */
+ (NSString *)checkTransportItem {
    return @"/apiTransportNoteAction_findTrasItem";
}

@end
