//
//  GroundCustomTableViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/15.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "GroundCustomTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
#import "CustomTool.h"

@interface GroundCustomTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UIImageView *genderImageView;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UILabel *praiseLabel;

@property (nonatomic, strong) UILabel *commentLabel;

@property (nonatomic, strong) UIImageView *publishImageView;

@end

@implementation GroundCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)configData:(GroundCommentModel *)model {
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]];
    
    _authorLabel.text = model.user_name;
    
    if ([model.gender isEqualToString:@"2"]) {
        _genderImageView.image = [UIImage imageNamed:kGenderWomanPlaceHolder];
    } else {
        _genderImageView.image = [UIImage imageNamed:kGenderManPlaceHolder];
    }
    
    _timeLabel.text = [CustomTool publishIntervalWith:model.publish_time];
   
    _contentLabel.text = model.content;
    CGSize heightSize = [model.content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _contentLabel.frame = CGRectMake(10, 60, kScreenWidth-20, heightSize.height);
    
    if (model.images.count == 0) {
        _publishImageView.frame = CGRectMake(10, CGRectGetMaxY(_contentLabel.frame), kScreenWidth - 20, 0);
         _bottomView.frame = CGRectMake(0, CGRectGetMaxY(_publishImageView.frame), kScreenWidth, 28);
    } else {
        GroundImageModel *imageModel = model.images[0];
        CGFloat width = [imageModel.width floatValue]/3.0;
        CGFloat height = [imageModel.height floatValue]/3.0;
        _publishImageView.frame = CGRectMake(10, CGRectGetMaxY(_contentLabel.frame)+10, width, height);
        [_publishImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.small_url]];
        _bottomView.frame = CGRectMake(0, CGRectGetMaxY(_publishImageView.frame), kScreenWidth, 28);
    }
    //_bottomView.frame = CGRectMake(0, self.frame.size.width-28, kScreenWidth, 28);
    _praiseLabel.text = model.good_count;
    _commentLabel.text = model.comment_count;
    
}


#pragma mark - 初始化UI
- (void)initUI {
    // 主要分三部分
    // 标题头部分、文本
    // 图片
    // 赞部分
    
    //头像
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    _iconImageView.clipsToBounds = YES;
    _iconImageView.layer.cornerRadius = 20;
    [self.contentView addSubview:_iconImageView];
    //author
    _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 150, 20)];
    _authorLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_authorLabel];
    //gender
    _genderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(210, 10, 20, 20)];
    [self.contentView addSubview:_genderImageView];
    //publishTime
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 100, 20)];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.contentView addSubview:_timeLabel];
    
    if (!_contentLabel) {
        //contentLabel
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, kScreenWidth-20, 20)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_contentLabel];
    }
    
//    _imageGroupView = [[UIView alloc] init];
//    _imageGroupView.backgroundColor = [UIColor yellowColor];
//    [self.contentView addSubview:_imageGroupView];
//    _imageGroupView.frame = CGRectMake(10, CGRectGetMaxY(_contentLabel.frame) + 10, kScreenWidth-20, 0);
    
    _publishImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_publishImageView];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame)-28, kScreenWidth, 28)];
    [self addSubview:_bottomView];
    //底部添加赞和评论按钮
    
    UIImageView *imageView_praise = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/4-20, 9, 10, 10)];
    imageView_praise.image = [UIImage imageNamed:@"动态-赞-常态.png"];
    [_bottomView addSubview:imageView_praise];
    _praiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView_praise.frame)+10, 9, 30, 10)];
    _praiseLabel.font = [UIFont systemFontOfSize:12];
    [_bottomView addSubview:_praiseLabel];
    
    UIImageView *imageView_comment = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth*3/4-20, 9, 10, 10)];
    imageView_comment.image = [UIImage imageNamed:@"动态-评论.png"];
    [_bottomView addSubview:imageView_comment];
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView_comment.frame)+10, 9, 30, 10)];
    _commentLabel.font = [UIFont systemFontOfSize:12];
    [_bottomView addSubview:_commentLabel];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
