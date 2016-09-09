//
//  LatestCell.m
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "LatestCell.h"

@implementation LatestCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)configWithModel:(LatestModel *)model{
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.recommend_covers] placeholderImage:nil];
    
    self.titleName.text = model.title;
    self.contentLabel.text = model.content;
  
    self.goodAndFav.text = [NSString stringWithFormat:@"赞 %@       评论 %@",model.good_count,model.comment_count];

}

- (void)configCardPlayWithModel:(LatestModel *)model{
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:nil];
    
    self.titleName.text = model.title;
    self.contentLabel.text = model.content;
    
    self.goodAndFav.text = [NSString stringWithFormat:@"赞 %@       评论 %@",model.good_count,model.comment_count];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
