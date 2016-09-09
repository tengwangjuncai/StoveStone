//
//  CardPalyViewController.h
//  StoveStone
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "StoveStoneController.h"
#import "SegmentView.h"
@interface CardPalyViewController : StoveStoneController<SegmentControlDelegate>
@property (nonatomic, copy) NSString *dataChange;
@end
