//
//  LatestViewController.h
//  StoveStone
//
//  Created by qianfeng on 16/3/10.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "StoveStoneController.h"
#import "LatestModel.h"
#import "LatestCell.h"
#import "Control.h"
#import "HeadModel.h"
#import "TheDetailViewController.h"
@interface LatestViewController : StoveStoneController
- (NSString *)urlStr;
- (NSDictionary *)param;
@end
