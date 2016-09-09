//
//  CustomTool.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CustomTool.h"
/**
 *  自定义工具类 --> publish
 */
@implementation CustomTool
+ (NSString*)publishIntervalWith:(NSString*)publishTime {
    float publishtimeN = [publishTime floatValue];
    NSDate *curDate = [NSDate date];
    float curInterval = [curDate timeIntervalSince1970];
    
    float gap = curInterval - publishtimeN;
    if (gap == 0) {
        return @"刚刚";
    }
    if (gap < 60) {
        //小于一分钟
        NSInteger temp = (NSInteger)gap;
        NSString *ret = [NSString stringWithFormat:@"%ld秒", temp];
        return ret;
    } else if (gap < 60 * 60) {
        //小于一个小时
        NSInteger temp = (NSInteger)gap/60;
        NSString *ret = [NSString stringWithFormat:@"%ld分钟", temp];
        return ret;
    } else if (gap < 60 * 60 * 24) {
        NSInteger temp = (NSInteger)gap/ (60 * 60);
        NSString *ret = [NSString stringWithFormat:@"%ld小时",temp];
        return ret;
    } else if (gap < 60 * 60 * 24 * 30) {
        NSInteger temp = (NSInteger)gap / (60 * 60 * 24);
        NSString *ret = [NSString stringWithFormat:@"%ld天", temp];
        return ret;
    }
    return @"很久以前";
}
@end
