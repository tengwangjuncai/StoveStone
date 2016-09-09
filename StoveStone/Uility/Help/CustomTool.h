//
//  CustomTool.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  自定义工具类 --> publish,
 */
@interface CustomTool : NSObject
/**
 *  用来计算消息事件的方法
 *  传入字符串 发布时间
 *  返回一个字符串： 多久发布的时间差
 */
+ (NSString*)publishIntervalWith:(NSString*)publishTime;
@end
