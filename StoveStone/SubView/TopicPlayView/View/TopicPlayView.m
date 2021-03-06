//
//  TopicPlayView.m
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "TopicPlayView.h"
#import "Define.h"
#import "TopicPlayCollectionViewCell.h"
#import "CardTacticViewController.h"
#import "CardPalyViewController.h"
#import "CardPicViewController.h"
@interface TopicPlayView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation TopicPlayView

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [NSArray array];
    [self loadDataSource];
    [self createCollection];
}

#pragma mark - 创建collectionView
- (void)createCollection {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置边长
    CGFloat bWidth = kScreenWidth / 3;
    layout.itemSize = CGSizeMake(bWidth, bWidth);
    
    _collectionView  = [[UICollectionView alloc] initWithFrame:kScreenFrame collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"TopicPlayCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"topicPlayCell"];
}

- (void)loadDataSource {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TopicPlayIcons" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    _dataSource = arr;
}

#pragma mark - 代理方法
#pragma mark - 返回的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

#pragma mark - cell设定
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopicPlayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topicPlayCell" forIndexPath:indexPath];
    NSDictionary *dic = _dataSource[indexPath.row];
    [cell configData:dic];
    
    return cell;
}
#pragma mark - 返回cell的上下左右的布局
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark - 设置不同cell的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - 设置点击事件

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CardPalyViewController *cpVC  = [[CardPalyViewController alloc] init];
        [self.navigationController pushViewController:cpVC animated:YES];
        
    } else if (indexPath.row == 1) {
        CardTacticViewController *ctVC = [[CardTacticViewController alloc] init];
        [self.navigationController pushViewController:ctVC animated:YES];
    }else if (indexPath.row == 2) {
        CardPicViewController *cpVC = [[CardPicViewController alloc] init];
        [self.navigationController pushViewController:cpVC animated:YES];
    } 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
