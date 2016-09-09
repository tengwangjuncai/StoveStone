//
//  CardTacticCell.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CardTacticCell.h"
#import "UIImageView+WebCache.h"
@implementation CardTacticCell

- (void)awakeFromNib {
    
}

- (void)configData:(CardTacticModel *)model {
    if (model.cover_image_url != NULL) {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:[UIImage imageNamed:@""]];
    }
    self.nameLabel.text = model.title;
    self.clickLabel.text = model.good_count;
}
@end
