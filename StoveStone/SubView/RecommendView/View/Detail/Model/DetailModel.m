//
//  DetailModel.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
//@property (nonatomic, copy) NSString *author;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *publish_time;
//
//@property (nonatomic, copy) NSString *content;
//@property (nonatomic, copy) NSString *cover_url;
//@property (nonatomic, strong) NSArray *image_urls;
//@property (nonatomic, strong) NSArray *videos;
+ (NSMutableArray*)arrayofmodelsFromCustomDic:(NSDictionary*)dic {
    NSMutableArray *ret = [NSMutableArray array];
    
    DetailModel *model = [[DetailModel alloc] init];
          model.author  =  dic[@"author"];
           model.title  =  dic[@"title"];
    model.publish_time  =  dic[@"publish_time"];
    
         model.content  =  dic[@"content"];
     NSArray *imageArr  =  dic[@"image_urls"];
      model.image_urls  =  imageArr;
    NSArray *videosArr  =  dic[@"videos"];
          model.videos  =  videosArr;
    
    [ret addObject:model];
    
    return ret;
}

@end
