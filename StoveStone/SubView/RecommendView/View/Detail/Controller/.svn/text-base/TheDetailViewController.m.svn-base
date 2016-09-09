//
//  TheDetailViewController.m
//  StoveStone
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "TheDetailViewController.h"
#import "MMProgressHUD.h"
#import "MMLinearProgressView.h"
#import <WebKit/WebKit.h>
@interface TheDetailViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation TheDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createWebView];
    
}

- (void)createWebView{

    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m.zhangyoubao.com/lscs/detail/%@?source=shareout",_userid]]]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    
}



@end
