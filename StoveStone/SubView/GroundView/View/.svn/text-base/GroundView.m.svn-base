//
//  GroundView.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "GroundView.h"
#import "Define.h"
#import "GroundCommentModel.h"
#import "GroundDetailViewController.h"
#import "GroundCustomTableViewCell.h"

@interface GroundView ()

@end

@implementation GroundView

- (void)viewDidLoad {

    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    self.tableView.estimatedRowHeight = 44;
    
    [self.tableView registerClass:[GroundCustomTableViewCell class] forCellReuseIdentifier:@"GroundCell"];
}

- (NSString *)urlStr {
    return dynamicAPI;
}

- (NSDictionary *)param{
    if (self.isPullDown) {
        self.lastID = @"0";
    }
    
    NSDictionary *para =  @{@"api":@"dynamic.getlist", @"apiVersion":@"v1", @"game":@"lscs", @"params[sort]":self.lastID, @"params[dynamicTopicId]":@"0"};
    return para;
}

#pragma mark - 重构Datasource方法
- (void)loadDataSource{
    NSString *loadurlStr = [self urlStr];
    NSDictionary *loadparma = [self param];
    HttpEngine *engine = [HttpEngine shareEngine];
    [engine Post:loadurlStr parameter:loadparma success:^(id responseObj) {
        NSArray *dataArr = responseObj[@"data"];
        
        if (self.isPullDown) {
            self.dataSource = [GroundCommentModel arrayOfModelsFromDictionaries:dataArr];
        }else if(self.isPullUp){
            [self.dataSource addObjectsFromArray:[GroundCommentModel arrayOfModelsFromDictionaries:dataArr]];
            
        }
        GroundCommentModel *model = [self.dataSource lastObject];
        [self getlastIDWith:model.id];
        [self endRefresh];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 重写tableview的协议方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}
//行数 每组仅有一行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    GroundCommentModel *model = self.dataSource[indexPath.section];
   
    CGSize heightSize = [model.content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    if (model.images.count == 0) {
        return 60+ heightSize.height+28;
    }
    
    CGFloat height = 0;
    GroundImageModel *imageModel = model.images[0];
    height = [imageModel.height floatValue]/3.0;

    return 60+heightSize.height+38+height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroundCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroundCell"];
    if (!cell) {
        cell = [[GroundCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GroundCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    GroundCommentModel *model = self.dataSource[indexPath.section];
    [cell configData:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroundCommentModel *model = self.dataSource[indexPath.section];
    NSString *userID = model.id;
    
    GroundDetailViewController *vc = [[GroundDetailViewController alloc] initWithID:userID withGroundCommentModel:model];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
