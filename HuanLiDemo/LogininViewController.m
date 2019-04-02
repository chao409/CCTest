//
//  LogininViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/27.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "LogininViewController.h"

@interface LogininViewController ()

@end

@implementation LogininViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"用户登录";
    
    UIButton *loginSuccessBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginSuccessBtn setTitle:@"登录成功" forState:UIControlStateNormal];
    loginSuccessBtn.frame  =CGRectMake(50, 100, 100, 50);
    [loginSuccessBtn addTarget:self action:@selector(loginSuccess) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginSuccessBtn];
    
    UIButton *loginFailBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginFailBtn setTitle:@"登录失败" forState:UIControlStateNormal];
    loginFailBtn.frame  =CGRectMake(200, 100, 100, 50);
    [loginFailBtn addTarget:self action:@selector(loginFail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginFailBtn];
    
}

- (void)loginSuccess
{
    if (self.loginResultBlock) {
        self.loginResultBlock(YES,@"1");
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)loginFail
{
    if (self.loginResultBlock) {
        self.loginResultBlock(NO,@"");
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
