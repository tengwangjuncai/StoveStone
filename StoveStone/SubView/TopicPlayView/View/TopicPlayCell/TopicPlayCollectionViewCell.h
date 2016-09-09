//
//  TopicPlayCollectionViewCell.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicPlayCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)configData:(NSDictionary*)dic;
@end
