//
//  StoveStoneController.h
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "JHRefresh.h"
#import "JSONModel.h"
#import "HttpEngine.h"
#import "Define.h"

@interface StoveStoneController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)BOOL isPullDown;
@property(nonatomic)BOOL isPullUp;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSString *lastID;
@property (nonatomic,strong)NSMutableArray *dataSource;

/**
 *  加载数据
 */
- (void)loadDataSource;

/**
 *  返回接口
 */
- (NSString *)urlStr;

/**
 *  返回参数
 */
- (NSDictionary *)param;

/**
 *  结束刷新
 */
- (void)endRefresh;

- (void)createHeaderRefresh;
/**
 *  获得最后一页
 */
- (void)getlastIDWith:(NSString *)last;

@end
