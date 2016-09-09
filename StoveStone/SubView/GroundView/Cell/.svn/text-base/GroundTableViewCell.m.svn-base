//
//  GroundTableViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "GroundTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
#import "CustomTool.h"

@implementation GroundTableViewCell

- (void)configData:(GroundCommentModel *)model {
  

    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]];
    _userNameLabel.text = model.user_name;
    if ([model.gender isEqualToString:@"2"]) {
        _genderLabel.image = [UIImage imageNamed:kGenderWomanPlaceHolder];
    } else {
        _genderLabel.image = [UIImage imageNamed:kGenderManPlaceHolder];
    }

    
    if (model.images.count == 0) {
        
      
    }else {
        for (int i = 0; i < model.images.count; i ++ ) {
         
            GroundImageModel *imagemodel = model.images[i];

            CGFloat width = _mainImageView.frame.size.width/model.images.count;
            CGFloat height = _mainImageView.frame.size.height;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width,height)];
           
            [imageView sd_setImageWithURL:[NSURL URLWithString:imagemodel.url]];
            
            [_mainImageView addSubview:imageView];
        }
        
        
        for (int i = 0; i < model.images.count; i++) {
            GroundImageModel *imagemodel = model.images[i];
            CGFloat width = _mainImageView.frame.size.width/model.images.count;
            CGFloat height = _mainImageView.frame.size.height;
        }
    }
    
    _publishTimeLabel.text = [CustomTool publishIntervalWith:model.publish_time];
    
    _contentLabel.text = model.content;

    _likeLabel.text = model.good_count;
    _commentLabel.text = model.comment_count;
}








- (void)awakeFromNib {
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
