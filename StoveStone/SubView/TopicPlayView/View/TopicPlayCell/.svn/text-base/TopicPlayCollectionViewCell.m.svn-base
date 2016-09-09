//
//  TopicPlayCollectionViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "TopicPlayCollectionViewCell.h"

@implementation TopicPlayCollectionViewCell

- (void)configData:(NSDictionary *)dic {
    _mainImageView.image = [[UIImage imageNamed:dic[@"iconName"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _titleLabel.text = dic[@"title"];
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
    
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
