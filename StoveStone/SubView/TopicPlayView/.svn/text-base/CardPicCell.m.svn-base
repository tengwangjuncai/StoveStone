//
//  CardPicCell.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/16.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CardPicCell.h"
#import "UIImageView+WebCache.h"
@implementation CardPicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configData:(CardDetailModel *)mode {
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:mode.pic_url_ossdata] placeholderImage:nil];
    self.nameLabel.text = mode.name;
}
@end
