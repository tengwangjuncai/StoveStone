//
//  PayAttentionToOur.m
//  StoveStone
//
//  Created by qianfeng on 16/3/15.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "PayAttentionToOur.h"
#import "QRCodeGenerator.h"
@interface PayAttentionToOur ()

@property (nonatomic,strong)UILabel *label;

@end

@implementation PayAttentionToOur

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width - 100, 50)];
    _label.text = @"扫一扫下面二维码关注我们";
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    [self createImageView];
    
}

- (void)createImageView{
    
    UIImage *image = [QRCodeGenerator qrImageForString:@"欢迎加入我们的团队，你的支持是对我们的最大鼓励，欢迎加我的QQ:1732561423 如果您遇到什么问题，我的团队会帮你解决，感谢你的支持" imageSize:300];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 150, CGRectGetMaxY(_label.frame), 300, 300)];
    imageView.image = image;
    [self.view addSubview:imageView];
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
