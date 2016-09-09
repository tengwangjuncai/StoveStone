//
//  LWWHttpEngine.h
//  接口测试
//
//  Created by qianfeng0 on 16/3/9.
//  Copyright © 2016年 李伟. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  自定义网络解析类（单例）
 *  需要导入AFNetWorking第三方库
 */

typedef void(^SuccessBlock)(id responseObj);
typedef void(^FailureBlock)(NSError *error);

@interface HttpEngine : NSObject
//初始化方法
+ (instancetype)shareEngine;
/**
 *  请求数据POST方法
 *  urlAPI 页面的参数
 *  para 参数
 */
- (void)Post:(NSString*)urlAPI parameter:(id)para success:(SuccessBlock)success failure:(FailureBlock)failure;
@end
