//
//  DetailModel.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "JSONModel.h"

@interface DetailModel : JSONModel
//头标题
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *content;
//@property (nonatomic, copy) NSString *cover_url;
@property (nonatomic, strong) NSArray *image_urls;
@property (nonatomic, strong) NSArray *videos;

/**
 *  自定义解析方法
 */

+ (NSMutableArray*)arrayofmodelsFromCustomDic:(NSDictionary*)dic;

@end
