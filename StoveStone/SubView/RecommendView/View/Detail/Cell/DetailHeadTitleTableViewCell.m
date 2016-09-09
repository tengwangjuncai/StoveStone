//
//  DetailHeadTitleTableViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailHeadTitleTableViewCell.h"
#import "CustomTool.h"

@implementation DetailHeadTitleTableViewCell

- (void)configData:(DetailModel *)model {
    _titleLabel.text = model.title;
    _authorNameLabel.text = model.author;
    
    _publishTimeLabel.text = [CustomTool publishIntervalWith:model.publish_time];
    

    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
