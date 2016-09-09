//
//  DetailCommentTableViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailCommentTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CustomTool.h"


@implementation DetailCommentTableViewCell

- (void)configData:(DetailCommentModel *)model {
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]];
    _iconImageView.clipsToBounds = YES;
    _iconImageView.layer.cornerRadius = _iconImageView.frame.size.width/2;
    
    _nameLabel.text = model.user_name;
    _timeLabel.text = [CustomTool publishIntervalWith:model.publish_time];
    
    _contentLabel.text = model.content;
    
    _praiseLabel.text = model.comment_count;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
