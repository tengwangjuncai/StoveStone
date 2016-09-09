//
//  LWWHttpEngine.m
//  接口测试
//
//  Created by qianfeng0 on 16/3/9.
//  Copyright © 2016年 李伟. All rights reserved.
//

#import "HttpEngine.h"
#import "AFNetworking.h"

@interface HttpEngine ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end

@implementation HttpEngine

//单例
+ (instancetype)shareEngine {
    //保证block中执行一次
    static dispatch_once_t onceToken = 0;
    static HttpEngine *engine = nil;
    dispatch_once(&onceToken, ^{
        engine = [[self alloc] init];
    });
    return engine;
}

- (instancetype)init {
    if (self = [super init]) {
        //初始化
        _manager = [AFHTTPRequestOperationManager manager];
       // _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    return self;
}

- (void)Post:(NSString*)urlAPI parameter:(id)para success:(SuccessBlock)success failure:(FailureBlock)failure {
    NSString *url = @"http://lscs.service.zhangyoubao.com/service/rest?%@&game=lscs&platformVersion=2.2.2&userid=17809496";
    url = [NSString stringWithFormat:url, urlAPI];
    
    [_manager POST:url parameters:para success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}


@end
