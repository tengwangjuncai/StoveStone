//
//  CacheManager.m
//  接口测试
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 李伟. All rights reserved.
//

#import "CacheManager.h"
#import "NSString+Hashing.h"
@implementation CacheManager

// 指定一个  沙盒路径
+ (NSString*)cacheDirectory {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheDir = [cacheDir stringByAppendingPathComponent:@"stovestoneCache"];
    //先判断这个路径是否不存在， 不存在就创建一个
    NSError *error;
    BOOL bret = [[NSFileManager defaultManager] createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:&error];
    //如果error存在 bret = 0
    if (!bret) {
        return nil;
    }
    return cacheDir;
}
//返回全部路径
+ (NSString*)fullPathWithUrl:(NSString*)url {
    //先去得到缓存路径
    NSString *cacheDir = [self cacheDirectory];
    //用md5加密
    NSString *md5Str = [url MD5Hash];
    //拼接完整路径
    NSString *fullPath = [cacheDir stringByAppendingString:md5Str];
    
    return fullPath;
}

+ (void)saveData:(id)object withUrl:(NSString *)urlStr {
    NSString *path = [self fullPathWithUrl:urlStr];
    //数据转化成二进制
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    //把数据写入文件
    BOOL res = [data writeToFile:path atomically:YES];
    if (res) {
        //写入成功
    } else {
        //写入失败
    }
}

+ (id)readData:(NSString *)urlStr {
    NSString *path = [self fullPathWithUrl:urlStr];
    //读取数据 解档
    NSData *data = [NSData dataWithContentsOfFile:path];
    //返回值 为解档的id
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}



@end
