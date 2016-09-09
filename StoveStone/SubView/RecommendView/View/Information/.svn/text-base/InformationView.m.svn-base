//
//  InformationView.m
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "InformationView.h"

@interface InformationView ()

@end

@implementation InformationView

- (void)viewDidLoad {
    
    [super viewDidLoad];

}



- (NSDictionary *)param{
    if (self.isPullDown) {
        self.lastID = @"";
    }
    NSDictionary *para = @{@"api":@"recommend.list", @"apiVersion":@"v1", @"game":@"lscs", @"params[lastId]":self.lastID, @"params[tagId]":@"5"};
    
    return para;


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end
