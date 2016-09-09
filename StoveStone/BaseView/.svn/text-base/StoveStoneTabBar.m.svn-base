//
//  StoveStoneTabBar.m
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "StoveStoneTabBar.h"
#import "StoveStoneController.h"
#import "MySettingTableViewController.h"
#import "MyNavigationController.h"
@interface StoveStoneTabBar ()

@property (nonatomic,strong)NSArray *tabBarItemArr;

@end

@implementation StoveStoneTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabBarItemArr = [NSArray new];
    _tabBarItemArr = [self getTabBarItem];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar"]];
    [self createItem];
   
}
/**
 *  获取item数据
 *
 *  @return item数组
 */
- (NSArray *)getTabBarItem{

    NSString *path = [[NSBundle mainBundle]pathForResource:@"stovestone.plist" ofType:nil];
    
    NSArray *result = [NSArray arrayWithContentsOfFile:path];

    return result;
}

/**
 *  创建item
 */
- (void)createItem{

    NSMutableArray *item = [NSMutableArray new];
    
    for (int i = 0; i < _tabBarItemArr.count; i ++) {
        
        if (i == _tabBarItemArr.count-1) {	
            MySettingTableViewController *settingvc = [[NSClassFromString(_tabBarItemArr[i][@"className"]) alloc] init];
            MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:settingvc];
            
            NSString *title =_tabBarItemArr[i][@"title"];
            NSString *imageName =_tabBarItemArr[i][@"icon"];
            
            
            nav.title = title;
            [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navgation"] forBarMetrics:UIBarMetricsDefault];
            
            settingvc.title =title;
            settingvc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            settingvc.tabBarItem.selectedImage =[[UIImage imageNamed:[NSString stringWithFormat:@"%@_select",imageName] ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor yellowColor]};
            [self.navigationController.navigationBar setTitleTextAttributes:dict];
            
            [[UINavigationBar appearance] setTitleTextAttributes:dict];
            [item addObject:nav];
            break;
        }
        
        StoveStoneController *ssc = [[NSClassFromString(_tabBarItemArr[i][@"className"]) alloc] init];
        MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:ssc];
        
        NSString *title =_tabBarItemArr[i][@"title"];
        NSString *imageName =_tabBarItemArr[i][@"icon"];
        
        nav.title = title;
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navgation"] forBarMetrics:UIBarMetricsDefault];
        
        ssc.title =title;
        ssc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ssc.tabBarItem.selectedImage =[[UIImage imageNamed:[NSString stringWithFormat:@"%@_select",imageName] ]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        
        NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor yellowColor]};
        [self.navigationController.navigationBar setTitleTextAttributes:dict];
        
        [[UINavigationBar appearance] setTitleTextAttributes:dict];
 
        [item addObject:nav];
    
    }
    
    self.viewControllers = item;
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
