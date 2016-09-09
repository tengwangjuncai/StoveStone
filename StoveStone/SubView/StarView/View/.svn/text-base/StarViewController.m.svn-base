//
//  StarViewController.m
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "StarViewController.h"
#import "AppDelegate.h"
#import "StoveStoneTabBar.h"
@interface StarViewController ()

@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *label;

@end

@implementation StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTimer];
    [self createImageView];
   
}

/**
 *  创建控件
 */
- (void)createImageView{
    
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem ];
     [self.view addSubview:_imageView];
    btn.frame = CGRectMake(CGRectGetMaxX(_imageView.bounds) - 80,20,50,20);
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressNext:) forControlEvents:UIControlEventTouchUpInside];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame), 20, CGRectGetMaxX(_imageView.frame) - CGRectGetMaxX(btn.frame) - 10 , 20)];
    
    _label.text = @"1";
    _label.textColor = [UIColor redColor];
    
    [_imageView addSubview:btn];
    [_imageView addSubview:_label];
    
    _imageView.userInteractionEnabled = YES;
    
    _imageView.image = [UIImage imageNamed:@"star2"];
    
   
}



/**
 *  按钮点击事件
 *
 *  @param sender 按钮
 */
- (void)pressNext:(UIButton *)sender{
    [_timer invalidate];
    [self jump];
    
}

/**
 *  创建事件计时器
 */
- (void)createTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(passTime:) userInfo:nil repeats:YES];
    
}

/**
 *  事件计时器事件
 */
static int myTime = 1;
- (void)passTime:(NSTimer *)timer{

    myTime -- ;
    _label.text = [NSString stringWithFormat:@"%d",myTime];
    if (myTime == 1) {
        _imageView.image = [UIImage imageNamed:@"star1"];
    }
    if (myTime == 0) {
        [_timer invalidate];
        [self jump];
    }

}


- (void)jump{
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    StoveStoneTabBar *sst = [[StoveStoneTabBar alloc] init];
    
    app.window.rootViewController = sst;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
