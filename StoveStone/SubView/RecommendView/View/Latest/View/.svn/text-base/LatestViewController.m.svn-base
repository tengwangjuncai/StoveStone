//
//  LatestViewController.m
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "LatestViewController.h"
#import "DetailViewController.h"
@interface LatestViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scroll;
@property (nonatomic,strong)NSMutableArray *scrollDataSource;
@property (nonatomic,strong)UIPageControl *pagControl;
@property (nonatomic,strong)UIView *myheaderView;
@property (nonatomic,strong)NSTimer *timer;


@end

@implementation LatestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //数据源初始化
    _scrollDataSource = [[NSMutableArray alloc] init];
    
    //设置frame
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 155);
    
    //加载数据
    [self loadScrolldataSource];
    
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:@"LatestCell" bundle:nil] forCellReuseIdentifier:@"Latest"];
}


/**
 *  加载cell数据
 */
- (void)loadDataSource{
    
    NSString *loadurlStr = [self urlStr];
    NSDictionary *loadparma = [NSDictionary new];

    loadparma = [self param];
    
    HttpEngine *engine = [HttpEngine shareEngine];

    [engine Post:loadurlStr parameter:loadparma success:^(id responseObj) {
     
        LatestModel *model = [[LatestModel alloc] init];
        if (self.isPullDown) {
             self.dataSource = [model arrayWithTheResponse:responseObj];
           
        }else if(self.isPullUp){
            [self.dataSource addObjectsFromArray:[model arrayWithTheResponse:responseObj]];
        }

        model = [self.dataSource lastObject];
        [self getlastIDWith:model.theID];
     
        //结束刷新
        [self endRefresh];
        
        [self.tableView reloadData];
        
        //创建事件计时器轮播
        [self createTimer];
        
    } failure:^(NSError *error) {
        
    }];
    
}

/**
 *  加载ScrollView数据
 */
- (void)loadScrolldataSource{
    
    NSDictionary *dic = [self headerParam];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://lscs.service.zhangyoubao.com/service/rest?api=ad.list&game=lscs&platformVersion=2.2.2" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        HeadModel *model = [[HeadModel alloc] init];
        _scrollDataSource = [model arrayWithTheResponse:responseObject];
    
        [self createHeaderView];
        [self creatPageControl];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


/**
 *  返回cell数据的url
 */
- (NSString *)urlStr{
    
    return @"api=recommend.list";

}



/**
 *  返回cell数据的参数
 */
- (NSDictionary *)param{
    if (self.isPullDown) {
        self.lastID = @"";
    }
    NSDictionary *para = @{@"api":@"recommend.list", @"apiVersion":@"v1", @"game":@"lscs", @"params[lastId]":self.lastID, @"params[tagId]":@"0"};
    return para;
}



- (void)getlastIDWith:(NSString *)last{

    self.lastID = last;
}



/**
 *  返回Header数据的url;
 */

- (NSString *)headerUrlStr{
        return @"api=ad.list";
}

/**
 *  返回Header数据的参数
 */
- (NSDictionary *)headerParam{
    
    NSDictionary *para = @{@"api":@"ad.list", @"apiVersion":@"v1", @"game":@"lscs", @"params[position]":@"topic_top", @"platformVersion":@"30", @"platform":@"炉石传说"};
    return para;
}


/**
 *  创建滚动视图
 */
- (void)createHeaderView{
    _myheaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];

    _scroll.delegate = self;
    for (int i = 0 ; i < _scrollDataSource.count; i ++ ) {
        HeadModel *model = _scrollDataSource[i];
        UIImageView *imageVIew = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, _scroll.frame.size.height)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPress:)];
        imageVIew.tag = [model.redirect_data integerValue];
        imageVIew.userInteractionEnabled = YES;
        [imageVIew addGestureRecognizer:tap];
        
        [imageVIew sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
        [_scroll addSubview:imageVIew];
    }
    _scroll.pagingEnabled = YES;
    _scroll.contentSize = CGSizeMake(_scrollDataSource.count *kScreenWidth, 150);
    [_myheaderView addSubview:_scroll];
    self.tableView.tableHeaderView = _myheaderView;

}

- (void)tapPress:(UITapGestureRecognizer*)sender {
    TheDetailViewController *de = [[TheDetailViewController alloc] init];
    NSString *strID = [NSString stringWithFormat:@"%ld",sender.view.tag];
    de.userid = strID;
    
    [self.navigationController pushViewController:de animated:YES];
    
}

/**
 *  创建点PagControl
 */
- (void)creatPageControl{
    
    _pagControl = [[UIPageControl alloc] initWithFrame:CGRectMake(_scroll.frame.size.width - _scrollDataSource.count * 20, _scroll.frame.size.height - 20, _scrollDataSource.count *20, 20)];
    [_myheaderView addSubview:_pagControl];
    _pagControl.pageIndicatorTintColor = [UIColor blackColor];
    _pagControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    _pagControl.numberOfPages = _scrollDataSource.count;
    [_pagControl addTarget:self action:@selector(pressScroll:) forControlEvents:UIControlEventValueChanged];
}

/**
 *  pag事件实现
 */

- (void)pressScroll:(UIPageControl *)pagContol{
    
    _scroll.contentOffset = CGPointMake(pagContol.currentPage* kScreenWidth, 0);

}

/**
 *  创建时间计时器
 */

- (void)createTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollrun:) userInfo:nil repeats:YES];

}


/**
 *  实现时间计时器方法
 */
- (void)scrollrun:(NSTimer *)timer{

    CGPoint offset = _scroll.contentOffset;
    if (offset.x < (_scrollDataSource.count - 1 ) * kScreenWidth){
        offset.x +=kScreenWidth;
    }else{
        offset.x = 0;
    }
    
    _scroll.contentOffset = offset;

}

#pragma mark ---滚动视图协议方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    _pagControl.currentPage  = (int)scrollView.contentOffset.x/kScreenWidth;
    
    if (scrollView.contentOffset.x > _scrollDataSource.count   *kScreenWidth) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    if( scrollView.contentOffset.x < 0 ){
        
        scrollView.contentOffset = CGPointMake(_scrollDataSource.count * kScreenWidth, 0);
    }
   
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    [_timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self createTimer];
}



#pragma mark ----协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LatestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Latest"];
    
    LatestModel *model = self.dataSource[indexPath.row];
    [cell configWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 90.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LatestModel *model  = self.dataSource[indexPath.row];
    
    TheDetailViewController *de = [[TheDetailViewController alloc] init];
    de.userid = model.theID;
    
    [self.navigationController pushViewController:de animated:YES];
    

}

@end
