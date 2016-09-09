//
//  MySettingTableViewController.m
//  StoveStone
//
//  Created by qianfeng0 on 16/3/11.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "MySettingTableViewController.h"
#import "UMSocial.h"
#import "SDWebImageManager.h"
#import "PayAttentionToOur.h"
#import "ZCZBarViewController.h"
@interface MySettingTableViewController ()<UMSocialUIDelegate>

@end

@implementation MySettingTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [[UIStoryboard storyboardWithName:@"MySettingTableView" bundle:nil] instantiateInitialViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    56e3c76d67e58e23ac0013f9 appid
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            PayAttentionToOur *pa = [[PayAttentionToOur alloc] init];
            [self.navigationController pushViewController:pa animated:YES];
            
        }else if (indexPath.row == 1) {
            [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatTimeline, UMShareToWechatSession]];
            [UMSocialSnsService presentSnsIconSheetView:self
                                                 appKey:nil
                                              shareText:@"炉石传说"
                                             shareImage:[UIImage imageNamed:@"icon.png"]
                                        shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline, nil]
                                               delegate:self];
        }else if (indexPath.row == 2){
            __weak MySettingTableViewController *weakself = self;
            [[SDWebImageManager sharedManager].imageCache calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:[NSString stringWithFormat:@"缓存大小为%.2fM 是否清理",totalSize/1024.0/1024.0] preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [[[SDWebImageManager sharedManager] imageCache]clearDisk];
                    [[[SDWebImageManager sharedManager] imageCache] clearMemory];
                    [[NSURLCache sharedURLCache] removeAllCachedResponses];
                }]];
                [weakself presentViewController:alert animated:YES completion:^{
                    
                }];
                
            }];
        }else if(indexPath.row == 4){
            
            ZCZBarViewController *zc = [[ZCZBarViewController alloc] initWithIsQRCode:NO Block:^(NSString *result, BOOL isFinish) {
                if (isFinish) {
                    UIViewController *vc = [[UIViewController alloc] init];
                    vc.view.backgroundColor =[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
                    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(vc.view.bounds.size.width - 150, vc.view.bounds.size.height - 150, 300, 300)];
                    [vc.view addSubview:label];
                    label.text = result;
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }
 
                
                
            }];
            [self.navigationController pushViewController:zc animated:YES];
        }
    }
    
}

#pragma mark - UM 协议的方法

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}


#pragma mark - 夜间模式

- (IBAction)DaySwitch:(UISwitch *)sender {
    if (sender.on) {
        if (!self.nightView) {
            [self createNightView];
        }
        self.nightView.hidden = NO;
    }else {
        self.nightView.hidden = YES;
    }
}
- (void)createNightView {
    self.nightView = [[UIView alloc] initWithFrame:self.view.frame];
    self.nightView.backgroundColor = [UIColor blackColor];
    self.nightView.alpha = 0.5;
    self.nightView.userInteractionEnabled = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.nightView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
