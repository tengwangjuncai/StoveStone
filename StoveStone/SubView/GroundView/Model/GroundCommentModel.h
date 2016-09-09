//
//  GroundCommentModel.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "JSONModel.h"
#import "GroundImageModel.h"

@protocol GroundImageModel <NSObject>



@end

@interface GroundCommentModel : JSONModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *publish_time;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *good_count;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, strong) NSArray <GroundImageModel> *images;
@end
