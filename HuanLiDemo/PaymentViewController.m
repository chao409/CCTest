//
//  PaymentViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/27.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订单支付";
    UIButton *loginSuccessBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginSuccessBtn setTitle:@"支付成功" forState:UIControlStateNormal];
    loginSuccessBtn.frame  =CGRectMake(50, 100, 100, 50);
    [loginSuccessBtn addTarget:self action:@selector(loginSuccess) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginSuccessBtn];
    
    UIButton *loginFailBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginFailBtn setTitle:@"支付失败" forState:UIControlStateNormal];
    loginFailBtn.frame  =CGRectMake(200, 100, 100, 50);
    [loginFailBtn addTarget:self action:@selector(loginFail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginFailBtn];
    
}

- (void)loginSuccess
{
    if (self.paymentResultBlock) {
        self.paymentResultBlock(YES,@"result");
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)loginFail
{
    if (self.paymentResultBlock) {
        self.paymentResultBlock(NO,@"");
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
