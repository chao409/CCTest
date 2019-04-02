//
//  AppDelegate.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/22.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "AppDelegate.h"
#import <HLApi/HLApi.h>
#import "LogininViewController.h"
#import "PaymentViewController.h"
#import "GoodsListViewController.h"
/** 微博 */
#define kThreeSinaAppKey @"3101884427"
/** QQ */
#define kThreeQQAppId @"1105076521"
/** 微信 */
#define kThreeWeiXinAppId @"wx33dbe99abd90c7d1"

/** huanli */
#define CCAPPKEY @"1ng012E9"
#define CCAPPSECRET  @"e903097407dd47bab229626a94436958"

@interface AppDelegate ()<HLSdkProtocol,HLShareResultProtocol>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [HuanLiSDK registerHLApp:CCAPPKEY appSercret:CCAPPSECRET delegate:self];
    [HuanLiSDK registerQQApp:kThreeQQAppId WXApp:kThreeWeiXinAppId WBApp:kThreeSinaAppKey delegate:self];
    
    return YES;
}
#pragma mark - delegate
- (void)didReceiveWebViewMessageType:(HLScriptMessageActionType)type object:(NSString *)object
{
    switch (type) {
        case HLScriptMessageActionTypeCloseWeb:
            // 关闭网页
            NSLog(@"%s 关闭网页",__func__);
            break;
        case HLScriptMessageActionTypeStartLogin:
        {
            // 唤起登录流程
            NSLog(@"%s 唤起登录流程",__func__);
            LogininViewController *login = [[LogininViewController alloc] init];
            login.loginResultBlock = ^(BOOL success,NSString *userId) {
                 [HuanLiSDK uploadUserInfo:userId];
            };
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:login];
            [self.window.rootViewController presentViewController:naVC animated:YES completion:nil];
            break;
        }
        case HLScriptMessageActionTypeBuyProduct:
        {
            // 唤起购买流程
            NSLog(@"%s 唤起购买流程 object = %@",__func__,object);
            PaymentViewController *paymentVC  = [[PaymentViewController alloc] init];
            paymentVC.paymentResultBlock = ^(BOOL success,NSString *result) {
                [HuanLiSDK uploadBuyProductWithActionId:@"" buyResult:@"" buyAmount:@"" subscribeId:@"" productId:@""];
            };
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:paymentVC];
            [self.window.rootViewController presentViewController:naVC animated:YES completion:nil];
            break;
        }
        case HLScriptMessageActionTypeChangeBgColor:
            // 更改颜色
            NSLog(@"%s 更改颜色 object = %@",__func__,object);
            break;
        case HLScriptMessageActionTypeGoToProductList:
        {
            // 跳转产品列表
            NSLog(@"%s 跳转产品列表 object = %@",__func__,object);
            GoodsListViewController *listVC = [[GoodsListViewController alloc] init];
            UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:listVC];
            [self.window.rootViewController presentViewController:naVC animated:YES completion:nil];
            break;
        }
            
        default:
            break;
    }
}
- (void)shareResponseStatusCode:(HLShareResponseStatusCode)statusCode errMsg:(NSString *)errMsg shareType:(HLShareType)shareType
{
    NSString *shareStatusStr = @"分享成功";
    switch (statusCode) {
        case HLShareResponseStatusCodeSuccess:
            break;
        case HLShareResponseStatusCodeFail:
            shareStatusStr = [NSString stringWithFormat:@"分享失败:%@",errMsg?:@""];
            break;
        case HLShareResponseStatusCodeCancel:
            shareStatusStr = @"取消分享";
            break;
            
        default:
            break;
    }
    NSString *shareTypeStr;
    switch (shareType) {
        case HLShareTypeQQ:
            shareTypeStr = @"QQ";
            break;
        case HLShareTypeQQZone:
            shareTypeStr = @"QQ空间";
            break;
        case HLShareTypeWX:
            shareTypeStr = @"微信好友";
            break;
        case HLShareTypeWXFriend:
            shareTypeStr = @"微信朋友圈";
            break;
        case HLShareTypeSina:
            shareTypeStr = @"微博";
            break;
            
        default:
            break;
    }
    
    NSString *shareTipMessage = [NSString stringWithFormat:@"%@%@",shareTypeStr,shareStatusStr];

    NSLog(@"%s==== %@", shareTipMessage);
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    return [HuanLiSDK handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
