//
//  CacheManager.h
//  接口测试
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 李伟. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  缓存管理类
 *  用来存放读取数据
 */
@interface CacheManager : NSObject
/**
 *  保存数据 ☞沙盒
 *
 *  @param object 存储的对象
 *  @param urlStr 存储的URL
 */
+ (void)saveData:(id)object withUrl:(NSString*)urlStr;
/**
 *  读取数据 From 沙盒
 *
 *  @param 从沙盒中读取urlStr的数据
 */
+ (id)readData:(NSString*)urlStr;
@end
