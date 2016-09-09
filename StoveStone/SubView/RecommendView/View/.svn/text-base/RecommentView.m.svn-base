//
//  RecommentView.m
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "RecommentView.h"
#import "LatestViewController.h"
@interface RecommentView ()<UIScrollViewDelegate>

@end

@implementation RecommentView

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = [self getitem];
    NSMutableArray *controllers = [NSMutableArray new];
    for (int i = 0 ; i < arr.count; i ++) {
        StoveStoneController *stov = [[NSClassFromString(arr[i][@"className"]) alloc] init];
    
        stov.title = arr[i][@"title"];
        [controllers addObject:stov];
    }
    
    SCNavTabBarController *sc = [[SCNavTabBarController alloc] init];
   
    sc.subViewControllers = controllers;
    sc.showArrowButton = NO;
    [sc addParentController:self];
}


- (NSArray *)getitem {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"recommenditem.plist" ofType:nil];
    NSArray *result = [NSArray arrayWithContentsOfFile:path];
    return result;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
