//
//  AmusementViewController.m
//  StoveStone
//
//  Created by qianfeng on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "AmusementViewController.h"

@interface AmusementViewController ()

@end

@implementation AmusementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSDictionary *)param{
    if (self.isPullDown) {
        self.lastID = @"";
    }
    NSDictionary *para = @{@"api":@"recommend.list", @"apiVersion":@"v1", @"game":@"lscs", @"params[lastId]":self.lastID, @"params[tagId]":@"2"};
    
    return para;
    
    
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
