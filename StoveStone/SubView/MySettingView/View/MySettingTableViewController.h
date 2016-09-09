//
//  MySettingTableViewController.h
//  StoveStone
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *IsDaySwitch;
@property (nonatomic, strong)UIView *nightView;
@end
