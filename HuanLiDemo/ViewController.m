//
//  ViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/22.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "ViewController.h"
#import <HLApi/HLApi.h>
#import <HLApi/HLWebViewController.h>
#import "BannerTestViewController.h"
#import "LaunchScreenViewController.h"
#import "AlertTestViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, strong) UITextField *userIdTextField;
@property (nonatomic, strong) UITextField *urlTextField;

@end

static NSString *const cellIdentifier = @"cellIdentifier";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = HLBgColor;
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.backgroundColor = [UIColor clearColor];
    [tbView setRowHeight:50];
    tbView.tableFooterView = [UIView new];
   // tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
   // tbView.separatorColor = [UIColor whiteColor];
    [self.view addSubview:tbView];
    self.tableView = tbView;
    
    tbView.tableHeaderView = [self tableHeaderView];
    tbView.tableFooterView = [self tableFooterView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (UIView *)tableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 160)];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 30)];
    topLabel.text = @"欢迎使用环锂科技演示Demo";
    topLabel.font = [UIFont boldSystemFontOfSize:18];
    topLabel.center = CGPointMake(headerView.center.x, headerView.center.y-20);
    topLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:topLabel];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 30)];
    label.text = @"点击以下方按钮，查看运营位效果";
    label.font = [UIFont systemFontOfSize:15];
    label.center = CGPointMake(headerView.center.x, headerView.center.y+10);
    label.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label];
    
    return headerView;
}

- (UIView *)tableFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 200)];
    
    UIButton *webBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [webBtn setTitle:@"webview" forState:UIControlStateNormal];
    [webBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    webBtn.frame = CGRectMake(100, 10, 120,40);
    webBtn.center = CGPointMake(footerView.center.x, 30);
    [webBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    webBtn.tag = 1;
    webBtn.backgroundColor = HL_ColorFromRGB(0xdddddd);
    [footerView addSubview:webBtn];
    
    UITextField *userIdTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, kScreenSizeWidth -10*3-100, 40)];
    userIdTF.borderStyle = UITextBorderStyleLine;
    [footerView addSubview:userIdTF];
    self.userIdTextField = userIdTF;
    UIButton *changeUserIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeUserIdBtn setTitle:@"修改userID" forState:UIControlStateNormal];
    changeUserIdBtn.frame = CGRectMake(userIdTF.frame.size.width+10*2, 70, 100,40);
    [changeUserIdBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    changeUserIdBtn.tag = 2;
    [changeUserIdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changeUserIdBtn.backgroundColor = HL_ColorFromRGB(0xdddddd);
    [footerView addSubview:changeUserIdBtn];
    
    UITextField *requestUrlTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, kScreenSizeWidth -10*3-130, 40)];
    requestUrlTF.borderStyle = UITextBorderStyleLine;
    [footerView addSubview:requestUrlTF];
    self.urlTextField = requestUrlTF;
    UIButton *requestUrlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [requestUrlBtn setTitle:@"跳转指定web页" forState:UIControlStateNormal];
    requestUrlBtn.frame = CGRectMake(requestUrlTF.frame.size.width+10*2, 130, 130,40);
    [requestUrlBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    requestUrlBtn.tag = 3;
    [requestUrlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    requestUrlBtn.backgroundColor = HL_ColorFromRGB(0xdddddd);
    [footerView addSubview:requestUrlBtn];
    
    return footerView;
}

- (void)btnAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 1:
        case 3:
        {
            HLWebViewController *webViewController = [[HLWebViewController alloc] init];
            webViewController.requestUrl =  sender.tag == 3?self.urlTextField.text:@"https://88if.cn/app/testPage";
            [self pushNavigationViewControllerWithRootVC:webViewController];
        }
        case 2:
        {
            [HuanLiSDK updateUserId:self.urlTextField.text];
            break;
        }
        default:
            break;
    }
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    CGFloat durition = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    CGRect keyboardRect = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    [UIView animateWithDuration:durition animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
    }];
}
- (void)keyboardWillHide:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    [UIView animateWithDuration:duration animations:^{
    self.view.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            BannerTestViewController *bannerVC = [[BannerTestViewController alloc] init];
            bannerVC.title = @"页面内banner";
            bannerVC.alertMessage = @"1.这是页面内部banner\n2.对接在哪个位置，对接几个，由商户确定。\n3.环锂运营策略可改变其是否显示/对谁显示/何时显示等";
            [self pushNavigationViewControllerWithRootVC:bannerVC];
            break;
        }
        case 3:
        {
            BannerTestViewController *bannerVC = [[BannerTestViewController alloc] init];
            bannerVC.title = @"导航按钮";
            bannerVC.alertMessage = @"1.这是导航按钮运营位\n2.对接在哪个位置，对接几个，由商户确定。\n3.支持单个或组装按钮接入\n 4.环锂运营策略可改变其是否显示/对谁显示/何时显示等";
            [self pushNavigationViewControllerWithRootVC:bannerVC];
            break;
        }
        case 4:
        {
            BannerTestViewController *bannerVC = [[BannerTestViewController alloc] init];
            bannerVC.title = @"文字链接";
            bannerVC.alertMessage = @"1.这是文字链接运营位\n2.对接在哪个位置，对接几个，由商户确定。\n3.环锂运营策略可改变其是否显示/对谁显示/何时显示等";
            [self pushNavigationViewControllerWithRootVC:bannerVC];
            break;
        }
        case 6:
        {
            BannerTestViewController *bannerVC = [[BannerTestViewController alloc] init];
            bannerVC.title = @"悬浮窗";
            bannerVC.alertMessage = @"1.这是悬浮窗运营位\n2.对接在哪个位置，对接几个，由商户确定。\n 3.通常使用在临时活动，或特定等级权益场景\n 4.环锂运营策略可改变其是否显示/对谁显示/何时显示等";
            [self pushNavigationViewControllerWithRootVC:bannerVC];
            break;
        }
        case 1:
        case 2:
        {
            LaunchScreenViewController *launchVC = [[LaunchScreenViewController alloc] init];
            launchVC.viewType = (indexPath.row == 1)?LaunchViewTypeFullScreen:LaunchViewTypeHalfScreen;
            launchVC.alertMessage = (indexPath.row == 1)? @"1.这是全屏启动广告位\n2.环锂运营策略可改变其是否显示/对谁显示/何时显示等\n3.支持点击后跳转至SDK内置H5页面，对用户进行策略引导":@"1.这是半屏启动广告位\n2.环锂运营策略可改变其是否显示/对谁显示/何时显示等\n3.支持点击后跳转至SDK内置H5页面，对用户进行策略引导";
            [self presentViewController:launchVC animated:NO completion:nil];
            break;
        }
        case 5:
        {
            AlertTestViewController *alertVC = [[AlertTestViewController alloc] init];
            alertVC.alertMessage = @"1.这是弹窗形式运营位\n2.分为图片+文字形式；纯图片形式;\n 3.一般出现在满足条件后 或 某种特定节点，如“购买完成” / “达到xx条件”\n 4.环锂运营策略可改变其是否显示/对谁显示/何时显示等";
            [self pushNavigationViewControllerWithRootVC:alertVC];
            break;
        }
            
        default:
            break;
    }
}

- (void)pushNavigationViewControllerWithRootVC:(UIViewController *)rootVC
{
    UINavigationController *naController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    [self presentViewController:naController animated:YES completion:nil];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - getter
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"页面内部banner",@"启动广告位（全屏）",@"启动广告位（半屏）",@"导航按钮",@"文字链接",@"弹窗",@"悬浮窗"];
    }
    return _dataArray;
}

@end
