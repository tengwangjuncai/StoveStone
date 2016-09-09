//
//  StoveStoneController.m
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "StoveStoneController.h"
#import "LatestModel.h"

@interface StoveStoneController ()




@end

@implementation StoveStoneController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self createTableView];
    _dataSource = [[NSMutableArray alloc] init];
    [self createHeaderRefresh];
    [self createFooterRefresh];
    [self.tableView headerStartRefresh];
  
}
/**
 *  创建TabelView
 */
- (void)createTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:kScreenFrame style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}




/**
 *  加载数据
 */
- (void)loadDataSource{
    
    
}





/**
 *  创建下拉刷新
 */
- (void)createHeaderRefresh{
    __weak StoveStoneController *weakself = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        
        _isPullDown = YES;
        weakself.lastID = @"";
        [weakself getlastIDWith:nil];
        
        [weakself loadDataSource];
        
    }];
    
}

/**
 *  上拉加载
 */
- (void)createFooterRefresh{
    __weak StoveStoneController *weakself = self;
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        _isPullUp = YES;
        [weakself getlastIDWith:weakself.lastID];
        [weakself loadDataSource];
    }];
}

/**
 *  结束刷新
 */
- (void)endRefresh{
    
    if (_isPullDown) {
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        _isPullDown = NO;
    }else if(_isPullUp){
    
        [self.tableView footerEndRefreshing];
        _isPullUp = NO;
    }

}

/**
 *  返回数据网址
 */
- (NSString *)urlStr{
    
    return nil;
    
}

/**
 *  返回数据网址所需参数
 */
- (NSDictionary *)param{
    return nil;
}


/**
 *  得到每一页最后的lastID
 *
 *  @param last lastID
 */
- (void)getlastIDWith:(NSString *)last{
    self.lastID = last;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
