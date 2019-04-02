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
    tbView.separatorColor = [UIColor whiteColor];
    [self.view addSubview:tbView];
    self.tableView = tbView;
    
    tbView.tableHeaderView = [self tableHeaderView];
    tbView.tableFooterView = [self tableFooterView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (UIView *)tableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 150)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 40)];
    label.text = @"环锂运营位演示Demo";
    label.center = headerView.center;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label];
    
    return headerView;
}

- (UIView *)tableFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSizeWidth, 200)];
    
    UIButton *webBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [webBtn setTitle:@"webview" forState:UIControlStateNormal];
    webBtn.frame = CGRectMake(100, 10, 120,40);
    [webBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    webBtn.tag = 1;
    [footerView addSubview:webBtn];
    
    UITextField *userIdTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, kScreenSizeWidth -10*3-160, 40)];
    userIdTF.borderStyle = UITextBorderStyleLine;
    [footerView addSubview:userIdTF];
    self.userIdTextField = userIdTF;
    UIButton *changeUserIdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeUserIdBtn setTitle:@"修改userID" forState:UIControlStateNormal];
    changeUserIdBtn.frame = CGRectMake(userIdTF.frame.size.width+10*2, 70, 160,40);
    [changeUserIdBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    changeUserIdBtn.tag = 2;
    [footerView addSubview:changeUserIdBtn];
    
    UITextField *requestUrlTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, kScreenSizeWidth -10*3-200, 40)];
    requestUrlTF.borderStyle = UITextBorderStyleLine;
    [footerView addSubview:requestUrlTF];
    self.urlTextField = requestUrlTF;
    UIButton *requestUrlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [requestUrlBtn setTitle:@"跳转指定web页" forState:UIControlStateNormal];
    requestUrlBtn.frame = CGRectMake(requestUrlTF.frame.size.width+10*2, 130, 200,40);
    [requestUrlBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    requestUrlBtn.tag = 3;
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
            bannerVC.title = @"页面内部banner";
            [self pushNavigationViewControllerWithRootVC:bannerVC];
            break;
        }
        case 1:
        case 2:
        {
            LaunchScreenViewController *launchVC = [[LaunchScreenViewController alloc] init];
            launchVC.viewType = (indexPath.row == 1)?LaunchViewTypeFullScreen:LaunchViewTypeHalfScreen;
            [self presentViewController:launchVC animated:NO completion:nil];
            break;
        }
        case 3:
        {
            AlertTestViewController *alertVC = [[AlertTestViewController alloc] init];
            [self pushNavigationViewControllerWithRootVC:alertVC];
            break;
        }
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
            
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
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
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
        _dataArray = @[@"banner、导航、文字链接、悬浮窗",@"启动广告位（全屏）",@"启动广告位（半屏）",@"弹窗"];
    }
    return _dataArray;
}

@end
