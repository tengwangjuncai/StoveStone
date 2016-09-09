//
//  GroundDetailViewController.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/13.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "GroundDetailViewController.h"
#import "Define.h"
#import "HttpEngine.h"
#import "DetailCommentModel.h"
#import "DetailCommentTableViewCell.h"
#import "GroundCustomTableViewCell.h"

@interface GroundDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) GroundCommentModel *model;

@property (nonatomic, strong) UIView *noneCommentView;

@end

@implementation GroundDetailViewController

/**
 *  自定义初始化方法：需要传个id
 */
- (instancetype)initWithID:(NSString*)userID withGroundCommentModel:(GroundCommentModel*)model{
    if (self = [super init]) {
        _userid = userID;
        _model = model;
        [self loadDataSource];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动态详情";
    self.view.backgroundColor = kBaseBgColor;
    [self createTableView];
    
}
/**
 *  加载网络数据
 */
- (void)loadDataSource {
    NSDictionary *para = @{
                           @"api":@"dynamic.getcommentslist",
                           @"apiVersion":@"v1",
                           @"game":@"lscs",
                           @"params[dynamicId]":_userid,
                           @"userId":@"17809496"
                           };
    HttpEngine *engine = [HttpEngine shareEngine];
    [engine Post:dynamicCommentAPI parameter:para success:^(id responseObj) {
     
        NSArray *dataArr = responseObj[@"data"];
        _dataSource = [DetailCommentModel arrayOfModelsFromDictionaries:dataArr];
        [self.tableView reloadData];
        [self createNoneView];
        if (_dataSource.count == 0) {
            self.tableView.tableFooterView = _noneCommentView;
        }
    } failure:^(NSError *error) {
        
    }];
}
/**
 *  创建tableview
 */
- (void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"commentCell"];
}


#pragma mark - tableview的代理方法
#pragma mark - row/section的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_dataSource.count == 0) {
        return 1;
    }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 ) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return _dataSource.count;
    }
    return 0;
}


#pragma mark - row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGSize heightSize = [_model.content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        if (_model.images.count == 0) {
            return 60+ heightSize.height+28;
        }
        CGFloat height = 0;
        GroundImageModel *imageModel = _model.images[0];
        height = [imageModel.height floatValue]/3.0;
        
        return 60+heightSize.height+38+height;
    } else if (indexPath.section == 1) {
        return 30;
    } else if (indexPath.section == 2) {
        return 80;
    }
    return 0;
}
#pragma mark - 自定义cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
//        GroundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GrandCellID"];
//        [cell configData:_model];
        GroundCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (!cell) {
            cell = [[GroundCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID2"];
        }
        [cell configData:_model];
        
        return cell;
    }
    if (_dataSource.count != 0) {
        if (indexPath.section == 1) {
            static NSString *cellID = @"cellID";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 5, 20)];
            redView.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:redView];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(redView.frame)+5, 0, 40, 30)];
            label.text = @"评论";
            label.font = [UIFont systemFontOfSize:12];
            [cell.contentView addSubview:label];
            
            return cell;
        } else if (indexPath.section == 2) {
            DetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
            DetailCommentModel *model = self.dataSource[indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell configData:model];
            return cell;
        }
    }
   
    return nil;
}

#pragma mark - 创建组尾

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (_dataSource == 0) {
        return 150;
    }
    return 0;
}



#pragma mark - 创建NoneView
- (void)createNoneView {
    _noneCommentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.center = _noneCommentView.center;
    imageView.image = [UIImage imageNamed:@"来一发"];
    [_noneCommentView addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2-140 , CGRectGetMaxY(imageView.frame), 280, 15)];
    label.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"还没有评论了，来一发吧!";
    label.font = [UIFont systemFontOfSize:12];
    [_noneCommentView addSubview:label];
}



@end
