//
//  DetailView.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/17.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailView.h"
#import "UIImageView+WebCache.h"
@implementation DetailView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatDetailView];
        [self addTap];
    }
    return self;
}

- (void)creatDetailView {
    self.frame = kScreenFrame;
    self.backgroundColor = [UIColor blackColor];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/4, kScreenWidth/5, kScreenWidth/2, kScreenWidth/5*4)];
    [self addSubview:_imageView];
    CGFloat imageViewY = CGRectGetMaxY(_imageView.frame);
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/6, imageViewY + 20, kScreenWidth/3*2, 20)];
    [self addSubview:_nameLabel];
    _nameLabel.textColor = [UIColor whiteColor];
    CGFloat nameLabelY = CGRectGetMaxY(_nameLabel.frame);
    _fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/6, nameLabelY + 10 , kScreenWidth/3*2, 20)];
    self.fromLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_fromLabel];
    CGFloat fromLabelY = CGRectGetMaxY(_fromLabel.frame);
    _fromLabel.textColor = [UIColor whiteColor];
    _Label = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/6, fromLabelY + 10, kScreenWidth/3*2, 20)];
    self.Label.font = [UIFont systemFontOfSize:15];
    _Label.textColor = [UIColor whiteColor];
    [self addSubview:_Label];
    CGFloat labelY = CGRectGetMaxY(_Label.frame);
    _qtLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/6, labelY + 5, 80, 20)];
    _qtLabel.textColor = [UIColor yellowColor];
    _qtLabel.font = [UIFont systemFontOfSize:14];
    _qtLabel.clipsToBounds = YES;
    _qtLabel.layer.cornerRadius = 5;
    _qtLabel.layer.borderWidth = 0.5;
    _qtLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_qtLabel];
    _quotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/6, labelY+30, kScreenWidth/3*2, 60)];
    _quotationLabel.numberOfLines = 0;
    _quotationLabel.textColor = [UIColor whiteColor];
    _quotationLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_quotationLabel];

}
//2 -> 免费  1 -> 普通  3 -> 稀有  4-> 史诗  5 -> 传说
- (void)configData:(CardDetailModel *)model {
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url_ossdata] placeholderImage:[UIImage imageNamed:@""]];
    NSInteger rarity_id = [model.rarity_id integerValue];
    NSString *str;
    switch (rarity_id) {
        case 1: {str = @"普通";};break;
        case 2: {str = @"免费";};break;
        case 3:{str = @"稀有";};break;
        case 4:{str = @"史诗";};break;
        case 5:{str = @"传说";};break;
        default:
        break;
    }
    
    self.nameLabel.text =[NSString stringWithFormat:@"%@   %@",model.name,str];
    if ([model.source_detail length]) {
        self.fromLabel.text = [NSString stringWithFormat:@"出处  %@",model.source_detail];
    }
    CGRect frame = self.Label.frame;
    if ([model.decompositiom length] && [model.synthesis length])
    {
        self.Label.text = [NSString stringWithFormat:@"分解 %@          合成 %@",model.decompositiom,model.synthesis];
        frame.size.height = 20;
        self.Label.frame = frame;
        
    }else {
        frame.size.height = 0;
        self.Label.frame = frame;
    }
    CGFloat labelY = CGRectGetMaxY(_Label.frame);
    _qtLabel.frame = CGRectMake(kScreenWidth/6,labelY +5 , 80, 20);
    _quotationLabel.frame = CGRectMake(kScreenWidth/6, labelY+30, kScreenWidth/3*2, 60);
    if ([model.quotations length]) {
        self.qtLabel.text = @"画师语录:";
        self.qtLabel.layer.borderColor = [UIColor yellowColor].CGColor;
        self.quotationLabel.text = [NSString stringWithFormat:@"%@",model.quotations];
    }
}
- (void)addTap {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}
- (void)tap:(UITapGestureRecognizer *)tap {
    self.nameLabel.text = @"";
    self.fromLabel.text = @"";
    self.Label.text = @"";
    self.quotationLabel.text = @"";
    self.qtLabel.text = @"";
    self.qtLabel.layer.borderColor = [UIColor clearColor].CGColor;
    self.hidden = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
