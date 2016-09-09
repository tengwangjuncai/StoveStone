//
//  CardTacticViewController.h
//  StoveStone
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"
@interface CardTacticViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SegmentControlDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
