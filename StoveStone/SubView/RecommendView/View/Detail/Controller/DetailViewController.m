//
//  DetailViewController.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailViewController.h"
#import "HttpEngine.h"
#import "Define.h"
#import "DetailModel.h"
#import "DetailHeadTitleTableViewCell.h"
#import "DetailCommentModel.h"
#import "DetailCommentTableViewCell.h"
#import "MoreComment.h"

@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate,UIWebViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray *commentDataSource;

@property (nonatomic, strong) NSString *userID;

@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic, assign) CGFloat height_web;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    _webView.delegate = self;
    _webView.scrollView.scrollEnabled = NO;
    
    self.view.backgroundColor = kBaseBgColor;
    self.tableView.estimatedRowHeight = 44;
    
    
    [self loadDataSource];
        
}

#pragma mark - 重写init方法
- (instancetype)initWithID:(NSString*)userid {
    if (self = [super init]) {
        _userID = userid;
    }
    return self;
}

#pragma mark - 加载数据
- (void)loadDataSource {
    NSDictionary *para = @{
                           @"api":@"news.getbyid",
                           @"apiVersion":@"v1",
                           @"game":@"lscs",
                           @"params[id]":_userID,
                           @"params[webview]":@"1",
                           @"platform":@"炉石传说",
                           @"platformVersion":@"30",
                           @"sign":@"sfsfsfsfs",
                           @"userId":@""
                           };
    HttpEngine *engine = [HttpEngine shareEngine];
    [engine Post:detailAPI parameter:para success:^(id responseObj) {
        NSDictionary *data = responseObj[@"data"];
        _dataSource = [DetailModel arrayofmodelsFromCustomDic:data];
        
        [self createTableView];
        
        [self loadCommentDataSource];
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadCommentDataSource {
    NSDictionary *para = @{
                           @"api":@"news.gethotcomment",
                           @"apiVersion":@"v1",
                           @"game":@"lscs",
                           @"params[id]":_userID,
                           @"params[webview]":@"1",
                           @"platform":@"炉石传说",
                           @"platformVersion":@"30",
                           @"sign":@"sfsfsfsfs",
                           @"userId":@""
                           };
    HttpEngine *engine = [HttpEngine shareEngine];
    [engine Post:detailCommentAPI parameter:para success:^(id responseObj) {
        NSArray *dataArr = responseObj[@"data"];
        _commentDataSource = [DetailCommentModel arrayOfModelsFromDictionaries:dataArr];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 创建tableview
- (void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-108) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"DetailHeadTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"headCellID"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"DetailCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"commentCellID"];
}

#pragma mark - sections/rows number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return _commentDataSource.count;
    }
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
//    view.clipsToBounds = YES;
//    view.layer.cornerRadius = 5;
    view.frame = CGRectMake(0, 30, 100, 20);
    if (section == 2) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @" 最热评论";
        label.clipsToBounds = YES;
        label.layer.cornerRadius = 8;
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 60;
    } else if (section == 3) {
        return 0;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 67;
    } else if (indexPath.section == 1) {
        return _webView.frame.size.height;
        return 180;
    } if (indexPath.section == 2) {
        return 80;
    } if (indexPath.section == 3) {
        return 40;
    }
    return 0;
}

#pragma mark - 添加cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DetailHeadTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headCellID"];
        DetailModel *model = _dataSource[0];
        [cell configData:model];
        return cell;
    } else if (indexPath.section == 1) {
        DetailModel *model = _dataSource[0];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
          
            [self.webView loadHTMLString:model.content baseURL:nil];
         
            NSLog(@"%@",model.content);
            [cell.contentView addSubview:_webView];
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    } else if (indexPath.section == 2) {
        DetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCellID"];
        DetailCommentModel *model = _commentDataSource[indexPath.row];
        [cell configData:model];
        return cell;
    } else if (indexPath.section == 3) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
        label.center = cell.center;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor orangeColor];
        label.text = @"查看更多评论";
        label.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:label];
        
        return cell;
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 3 &&_commentDataSource.count != 0) {

        MoreComment *morecomment = [[MoreComment alloc] init];
        
        morecomment.theID = _userID;
        
        [self.navigationController pushViewController:morecomment animated:YES];

    }
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{

    //获取到webview的高度
    CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    self.webView.frame = CGRectMake(self.webView.frame.origin.x,self.webView.frame.origin.y, kScreenWidth, height+15);
    [self.tableView reloadData];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str = request.URL.description;
    if ([str hasPrefix:@"http://m.zhangyoubao.com/lscs/playvideo"]) {
        NSLog(@"lalala");
        return YES;
    }
    return YES;
}



@end
