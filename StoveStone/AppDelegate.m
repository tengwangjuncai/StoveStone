//
//  AppDelegate.m
//  StoveStone
//
//  Created by qianfeng on 16/3/9.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "AppDelegate.h"
#import "StarViewController.h"
#import "AFNetworking.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self netWorking];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    StarViewController *star = [[StarViewController alloc] init];
    self.window.rootViewController = star;
    [self.window makeKeyAndVisible];
   // 56e3c76d67e58e23ac0013f9
    //设置友盟社会化分享的appKey
    [UMSocialData setAppKey:@"56e3c76d67e58e23ac0013f9"];
    [UMSocialWechatHandler setWXAppId:@"wx12d7ef427f350c8d" appSecret:@"45d1772599329414ee0a6c2283d04fca" url:@"http://www.umeng.com/social"];
    
    return YES;
}

- (void)netWorking {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
    }];
    
    [manager startMonitoring];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
