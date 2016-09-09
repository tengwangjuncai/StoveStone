//
//  CardTacticViewController.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CardTacticViewController.h"

#import "Define.h"
#import "CardTacticCell.h"
#import "AFNetworking.h"
#import "HttpEngine.h"
#import "CardTacticModel.h"
#import "DetailViewController.h"
#import "TheDetailViewController.h"
@implementation CardTacticViewController
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createCollection];
    [self createSegmentControl];
    [self loadDataSource];
}

- (void)createSegmentControl {
    SegmentView *view = [[SegmentView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 44)];
    view.delegate= self;
    [self.view addSubview:view];
}

- (void)createCollection {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
   // layout.itemSize = CGSizeMake((kScreenWidth - 32)/3, (kScreenWidth - 32)/2);
    layout.sectionInset = UIEdgeInsetsMake(4, 4, 0, 4);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(4, 44, kScreenWidth - 8, kScreenHeight - 152) collectionViewLayout:layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"CardTacticCell" bundle:nil]  forCellWithReuseIdentifier:@"tracticCell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
}

- (void)loadDataSource {
    NSDictionary *para = @{@"api":@"topic.cardsgrouptopiclist", @"apiVersion":@"v1", @"game":@"lscs", @"params[id]":@"2", @"params[type]":@"15"};
    HttpEngine * engine = [HttpEngine shareEngine];
    [engine Post:cardGroupTopicAPI parameter:para success:^(id responseObj) {
        NSArray * data = responseObj[@"data"];
        
        self.dataSource = [CardTacticModel arrayOfModelsFromDictionaries:data];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - 实现代理方法 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardTacticCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tracticCell" forIndexPath:indexPath];
    CardTacticModel *model = self.dataSource[indexPath.row];
    [cell configData:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CardTacticModel *model  = self.dataSource[indexPath.row];
    
    TheDetailViewController *detail = [[TheDetailViewController alloc] init];
    detail.userid = model.ID;
    
    [self.navigationController pushViewController:detail animated:YES];

    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth - 40)/3, (kScreenWidth)/2);
}

#pragma mark- 实现代理 SegmentControlDelegate 
- (void)returnDataNum:(NSInteger)num {
    NSString * str = [NSString stringWithFormat:@"%ld",num + 2];
    NSDictionary *para = @{@"api":@"topic.cardsgrouptopiclist", @"apiVersion":@"v1", @"game":@"lscs", @"params[id]":str, @"params[type]":@"15"};
    HttpEngine * engine = [HttpEngine shareEngine];
    [engine Post:cardGroupTopicAPI parameter:para success:^(id responseObj) {
        NSArray * data = responseObj[@"data"];
        
        self.dataSource = [CardTacticModel arrayOfModelsFromDictionaries:data];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];

}
@end
