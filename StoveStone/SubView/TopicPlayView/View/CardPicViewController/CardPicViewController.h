//
//  CardPicViewController.h
//  StoveStone
//
//  Created by Qianfeng on 16/3/16.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"
#import "Define.h"
#import "DetailView.h"
@interface CardPicViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SegmentControlDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *showDataSource;
@property (nonatomic, strong) DetailView *detailView;
@end
