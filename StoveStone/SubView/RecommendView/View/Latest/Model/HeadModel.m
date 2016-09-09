//
//  HeadModel.m
//  StoveStone
//
//  Created by qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "HeadModel.h"

@implementation HeadModel


-(NSMutableArray *)arrayWithTheResponse:(id)response{
    
    NSMutableArray *result = [NSMutableArray new];
    NSDictionary *data = response[@"data"];
    NSArray *list = data[@"list"];
    for (NSDictionary *dic in list) {
        HeadModel *model = [[HeadModel alloc] init];
        model.redirect_data = dic[@"redirect_data"];
        model.redirect_type = dic[@"redirect_type"];
        model.image_url = dic[@"image_url"];
        [result addObject:model];
    }
    
    return result;
}
@end
