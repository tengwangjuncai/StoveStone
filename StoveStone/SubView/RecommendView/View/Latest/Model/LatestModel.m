//
//  LatestModel.m
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "LatestModel.h"

@implementation LatestModel


- (NSMutableArray *)arrayWithTheResponse:(id)response{
    NSMutableArray *result = [NSMutableArray new];
   
    NSArray *data = response[@"data"];
    for (NSDictionary *dic in data) {
        LatestModel *model = [[LatestModel alloc] init];
        model.theID = dic[@"id"];
        model.title = dic[@"title"];
        model.content = dic[@"content"];
        model.good_count = dic[@"good_count"];
        model.comment_count = dic[@"comment_count"];
        NSArray *arr = dic[@"recommend_covers"];
        model.recommend_covers = arr[0];
        model.publish_time = dic[@"publish_time"];
        if (dic[@"cover_image_url"] != NULL) {
            model.cover_image_url = dic[@"cover_image_url"];
            model.cover_url = dic[@"cover_url"];
        }
        [result addObject:model];
        //NSLog(@"%@",model.theID);
    }
    return result;
}

@end
