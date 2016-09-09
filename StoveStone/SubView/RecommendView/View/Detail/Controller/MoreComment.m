//
//  MoreComment.m
//  StoveStone
//
//  Created by qianfeng on 16/3/13.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "MoreComment.h"
#import "DetailCommentTableViewCell.h"
#import "Define.h"
#import "HttpEngine.h"
@interface MoreComment ()

@end

@implementation MoreComment

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray new];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"MoreComment"];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    
}

- (void)loadDataSource{
    
    HttpEngine *engine = [HttpEngine shareEngine];
    NSString *url = [self urlStr];
    NSDictionary *parma = [self param];
    [engine Post:url parameter:parma success:^(id responseObj) {
     
        NSArray *dataArr = responseObj[@"data"];
        
        if (self.isPullDown) {
            self.dataSource = [DetailCommentModel arrayOfModelsFromDictionaries:dataArr];
            
        }else if(self.isPullUp){
            
            [self.dataSource addObjectsFromArray:[DetailCommentModel arrayOfModelsFromDictionaries:dataArr]];
        }
        
        DetailCommentModel *model = [self.dataSource lastObject];
        [self getlastIDWith:model.id];
        
        //结束刷新
        [self endRefresh];
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];

}


- (NSString *)urlStr {

    return recommendMarkAPI;
}

- (NSDictionary *)param{
    if (self.isPullDown) {
        self.lastID = @"";
    }
    return @{@"apiVersion":@"v1",@"api":@"news.getposts",@"params[lastId]":self.lastID,@"game":@"lscs",@"params[topicId]":_theID};

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreComment"];
    
    DetailCommentModel *model = self.dataSource[indexPath.row];
    [cell configData:model];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return  80.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
