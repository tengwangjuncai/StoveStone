//
//  CardPalyViewController.m
//  StoveStone
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CardPalyViewController.h"
#import "HttpEngine.h"
#import "SegmentView.h"
#import "LatestCell.h"
#import "LatestModel.h"
#import "DetailViewController.h"
@interface CardPalyViewController ()

@end

@implementation CardPalyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSegmentView];
}
- (void)createSegmentView {
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,44)];
    segmentView.delegate = self;
    [self.view addSubview:segmentView];
}
- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 108)];
    
     _dataChange = @"2";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"LatestCell" bundle:nil] forCellReuseIdentifier:@"cardPlayCell"];
}

- (void)loadDataSource {
    HttpEngine *engine = [HttpEngine shareEngine];
    [engine Post:[self urlStr] parameter:[self param] success:^(id responseObj) {
       // NSLog(@"cccc%@",responseObj);
        LatestModel *model = [[LatestModel alloc] init];
        if (self.isPullDown) {
            self.dataSource = [model arrayWithTheResponse:responseObj];
           
        }
        if (self.isPullUp) {
            [self.dataSource addObjectsFromArray:[model arrayWithTheResponse:responseObj]];
        }
        model = [self.dataSource lastObject];
        self.lastID = model.theID;
        
        //结束刷新
        [self endRefresh];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (NSString *)urlStr {
    return @"api=topic.playlistwithimage";
}
- (NSDictionary *)param {
    if (self.isPullDown) {
       self.lastID = @"0";
    }
    return @{@"api":@"topic.playlistwithimage", @"apiVersion":@"v1", @"game":@"lscs", @"params[id]":_dataChange,@"params[type]":@"10",@"api":@"topic.playlistwithimage",@"params[lastSort]":self.lastID};
}
- (void)returnDataNum:(NSInteger)num {
    _dataChange = [NSString stringWithFormat:@"%ld",num + 2];
    [self.tableView headerStartRefresh];
}
#pragma mark - 实现代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LatestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardPlayCell"];
    LatestModel * model = self.dataSource[indexPath.row];
    [cell configCardPlayWithModel:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LatestModel *model  = self.dataSource[indexPath.row];
    
    DetailViewController *detail = [[DetailViewController alloc] initWithID:model.theID];
    
    [self.navigationController pushViewController:detail animated:YES];

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
