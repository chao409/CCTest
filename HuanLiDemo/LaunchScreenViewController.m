//
//  LaunchScreenViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "LaunchScreenViewController.h"
#import <HLApi/HLView.h>


@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSkipBtn];
    
    [self addLaunchView];
    
}


- (void)addLaunchView
{
    __weak typeof(self) weakSelf = self;
    HLViewType type = self.viewType == LaunchViewTypeFullScreen?HLViewTypeStartupPageFullScreen:HLViewTypeStartupPageHalfScreen;
    HLView *adView = [HLView viewWithViewType:type positionCode:@"start_up_half" block:^(BOOL isEmptyData) {
        // 启动图没有数据，直接返回
    //    [weakSelf back];
    }];
    [self.view insertSubview:adView atIndex:0];
    
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.userInteractionEnabled = YES;
    bgView.frame = self.view.bounds;
    [self.view insertSubview:bgView atIndex:0];
    
    
    if (self.viewType == LaunchViewTypeFullScreen) {
        adView.frame = self.view.bounds;
        bgView.image = [UIImage imageNamed:@"fullScreen"];
    }else
    {
        adView.frame = CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeWidth*5.0/4.0);
        
//        UIImageView *imgView = [[UIImageView alloc] init];
//        imgView.image = [UIImage imageNamed:@"banner4.png"];
//        [self.view addSubview:imgView];
//        imgView.frame = CGRectMake(0, adView.frame.size.height, kScreenSizeWidth, kScreenSizeWidth - adView.frame.size.height);
        
        bgView.image = [UIImage imageNamed:@"halfScreen"];
    }
    
    
}

- (void)addSkipBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kScreenSizeWidth - 70 - 30, 30, 70, 35);
    [btn setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 17.5;
    btn.layer.masksToBounds = YES;
    [self.view addSubview:btn];
}


- (void)back
{
    [self dismissViewControllerAnimated:NO completion:nil];
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
