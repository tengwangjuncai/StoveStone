//
//  Control.m
//  StoveStone
//
//  Created by qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "Control.h"

@implementation Control

+(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title forState:(UIControlState)style{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem ];
    button.frame = frame;
    [button setTitle:title forState:style];
    return button;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    
    return imageView;

}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageNameWithUrl:(NSString *)imageName{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
    
    return imageView;
}


+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text titleColor:(UIColor *)titleColor{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = titleColor;
    return label;
}

@end
