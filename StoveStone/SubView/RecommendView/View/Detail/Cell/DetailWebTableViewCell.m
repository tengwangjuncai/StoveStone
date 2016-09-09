//
//  DetailWebTableViewCell.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/12.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "DetailWebTableViewCell.h"

@implementation DetailWebTableViewCell

- (void)configData:(DetailModel *)model {
    NSMutableString *text = [NSMutableString string];
    [text appendString:model.content];
    [self.webView loadHTMLString:text baseURL:nil];
    
    _webView.delegate = self;
    
    _webView.scrollView.scrollEnabled = NO;
    
   
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat webViewHeight = [_webView.scrollView contentSize].height;
    
    CGRect newFrame = _webView.frame;
    
    _webCellHeight = webViewHeight;
    
    newFrame.size.height = webViewHeight;
    
    _webView.frame = newFrame;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
