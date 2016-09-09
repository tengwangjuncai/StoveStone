//
//  WPYSegmentView.m
//  TestStoveStone
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 wangpengyu. All rights reserved.
//

#import "WPYSegmentView.h"

@implementation WPYSegmentView

/**
 *  自定义初始化函数
 *
 *  @param frame 传过来的frame
 *
 *  @return view
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
        _popItemMenu = NO;
        _titlesArray = @[@"德鲁伊",@"猎人",@"法师",@"圣骑士",@"牧师",@"潜行者",@"萨满",@"术士",@"战士"];
    }
    return self;
}


- (void)initView {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    backView.backgroundColor = [UIColor whiteColor];
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 40, 30)];
    [backView addSubview:_iconImageView];
    CGFloat iconImageViewX = CGRectGetMaxX(_iconImageView.frame);
    _iconImageView.image = [UIImage imageNamed:@"职业攻略-德鲁伊"];
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconImageViewX + 8, 12, 50, 20)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.text = @"德鲁伊";
    [backView addSubview:_nameLabel];
    _professionalBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 130, 10, 120, 24)];
    [_professionalBtn setTitle:@"职业切换" forState:UIControlStateNormal];
    [_professionalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_professionalBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    _professionalBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_professionalBtn setImage:[UIImage imageNamed:@"卡牌图鉴-标签-下拉"] forState:UIControlStateNormal];
    [_professionalBtn setImage:[UIImage imageNamed:@"卡牌图鉴-标签-下拉-点击"] forState:UIControlStateSelected];
    [_professionalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 100, 0, 0)];
    [_professionalBtn addTarget:self action:@selector(professionalBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:_professionalBtn];
    [self addSubview:backView];
}

- (void)createProfessionalView {
    _btnArray = [NSMutableArray new];
    CGFloat   horizonalInterVal = 15;
    CGFloat   verticalInterVal = 10;
    CGFloat   btnH = 25;
    CGFloat   btnX = 20;
    _professionalView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, ScreenWidth, 80)];
    _professionalView.alpha = 0.9;
    _professionalView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < _titlesArray.count; i++) {
        CGFloat width = [_titlesArray[i] sizeWithFont:[UIFont systemFontOfSize:15]].width + 20;
        if((btnX + width)>ScreenWidth ) {
            btnX = 20;
            verticalInterVal += 35;
        }
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX , verticalInterVal, width, btnH)];
        btnX += (width+horizonalInterVal);
        [btn setTitle:_titlesArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 10;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.borderWidth = 0.2;
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100 + i;
        if (i==0) {
            [btn setSelected:YES];
            btn.backgroundColor = [UIColor orangeColor];
            _currentprofession = 0;
        }
        [_btnArray addObject:btn];
        [_professionalView addSubview:btn];
    }
    [self addSubview:_professionalView];
}
- (void)btnPressed:(UIButton *)sender {
    if (_currentprofession != (sender.tag - 100)) {
        
        [self.btnArray[_currentprofession] setSelected:NO];
        [self.btnArray[_currentprofession] setBackgroundColor:[UIColor clearColor]];
        [self.btnArray[sender.tag - 100] setSelected:YES];
        [self.btnArray[sender.tag - 100] setBackgroundColor:[UIColor orangeColor]];
        _currentprofession = sender.tag - 100;
        _nameLabel.text = _titlesArray[sender.tag - 100];
        
        NSString * str = [NSString stringWithFormat:@"职业攻略-%@",_titlesArray[sender.tag - 100]];
        _iconImageView.image = [UIImage imageNamed:str];
    }
    
}
- (void)professionalBtnTouched:(UIButton *)sender {
    _popItemMenu = ! _popItemMenu;
    _professionalBtn.selected = !_professionalBtn.selected;
    if (_popItemMenu) {
        [UIView animateWithDuration:0.2 animations:^{
            if (!_professionalView) {
                [self createProfessionalView];
            }
            self.frame = CGRectMake(0,0, ScreenWidth, 124);
            _professionalView.hidden = NO;
        }];
    }else {
        [UIView animateWithDuration:0.2 animations:^{
            _professionalView.hidden = !_professionalView.hidden;
            self.frame = CGRectMake(0,0, ScreenWidth, 44);
        }];
    }
}


@end
