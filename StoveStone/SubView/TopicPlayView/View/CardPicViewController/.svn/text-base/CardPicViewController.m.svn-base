//
//  CardPicViewController.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/16.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CardPicViewController.h"
#import "CardTacticCell.h"
#import "CardPicCell.h"
#import "DetailView.h"
@interface CardPicViewController ()

@end

@implementation CardPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollection];
    [self createSegmentControl];
    [self loadDataSource];
}
- (void)createSegmentControl {
    SegmentView *view = [[SegmentView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, 44) withNameArray:@[@"全部",@"中立",@"德鲁伊",@"猎人",@"法师",@"圣骑士",@"牧师",@"潜行者",@"萨满",@"术士",@"战士"]];
    view.delegate= self;
    [view.professionalBtn setTitle:@"职业筛选" forState:UIControlStateNormal];
    [self.view addSubview:view];
}
- (void)loadDataSource {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"total" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray * arr = dic[@"total"];
    self.dataSource = [CardDetailModel arrayOfModelsFromDictionaries:arr];
    self.showDataSource = [NSMutableArray arrayWithArray:self.dataSource];
    [self.collectionView reloadData];
}
- (void)showData:(NSString *)str {
    [self.showDataSource removeAllObjects];
    for (CardDetailModel *model in self.dataSource) {
        if ([model.role_id isEqualToString:str]) {
            [self.showDataSource addObject:model];
        }
    }
    [self.collectionView reloadData];
}
- (void)returnDataNum:(NSInteger)num {
    switch (num) {
        case 0:
        {
            [self.showDataSource removeAllObjects];
            for (CardDetailModel *model in self.dataSource) {
                [self.showDataSource addObject:model];
            }
            [self.collectionView reloadData];
        }
        break;
        case 1:
        {
            [self showData:@"0"];
        }
        break;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        {
            NSString * str = [NSString stringWithFormat:@"%ld",num];
            [self showData:str];
        }
        break;
        default:
        break;
    }
}
- (void)createCollection {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    // layout.itemSize = CGSizeMake((kScreenWidth - 32)/3, (kScreenWidth - 32)/2);
    layout.sectionInset = UIEdgeInsetsMake(4, 10, 0, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(4, 44, kScreenWidth - 8, kScreenHeight - 108) collectionViewLayout:layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"CardPicCell" bundle:nil]  forCellWithReuseIdentifier:@"cardPicCell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
}


#pragma mark - 实现代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return self.dataSource.count;
    return self.showDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardPicCell" forIndexPath:indexPath];
    CardDetailModel *model = self.showDataSource[indexPath.row];
    [cell configData:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CardDetailModel *model  = self.dataSource[indexPath.row];
    if (!self.detailView) {
        self.detailView = [[DetailView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:self.detailView];
        self.detailView.hidden = YES;
    }
    self.detailView.hidden = ! self.detailView.hidden;
    [self.detailView configData:model];
    
//    TheDetailViewController *detail = [[TheDetailViewController alloc] init];
//    detail.userid = model.ID;
//    
//    [self.navigationController pushViewController:detail animated:YES];
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenWidth -60)/3, (kScreenWidth- 60)/2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
