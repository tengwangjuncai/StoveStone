//
//  WPYSegmentView.h
//  TestStoveStone
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 wangpengyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SegmentViewH 44
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHight  [UIScreen mainScreen].bounds.size.hight
@interface WPYSegmentView : UIView
@property (nonatomic, strong)UIImageView * iconImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIButton *professionalBtn;
@property (nonatomic, strong)UIView * professionalView;
@property (nonatomic)NSInteger currentprofession;
@property (nonatomic,strong)NSArray *titlesArray;
@property (nonatomic, strong)NSMutableArray *btnArray;
@property (nonatomic) BOOL popItemMenu;
@end
