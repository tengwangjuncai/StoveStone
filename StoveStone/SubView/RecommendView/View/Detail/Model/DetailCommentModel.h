//
//  DetailCommentModel.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "JSONModel.h"

@interface DetailCommentModel : JSONModel
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *publish_time;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *id;

@end
