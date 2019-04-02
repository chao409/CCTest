//
//  AlertTestViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "AlertTestViewController.h"
#import <HLApi/HuanLiSDK.h>
#define kCellHeight 60

@interface AlertTestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;

@end
static NSString *const CellIdentifier = @"CellIdentifier";
@implementation AlertTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = HLBgColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.backgroundColor = [UIColor clearColor];
    tbView.separatorColor = [UIColor whiteColor];
    [tbView setTableFooterView:[UIView new]];
    [self.view addSubview:tbView];
    self.tableView = tbView;
}

- (void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *code;
    switch (indexPath.section) {
        case 0:
            code = @"start_Completed";
            break;
        case 1:
            code = @"Purchase_Completed";
            break;
        case 2:
            code = @"Registration_completed";
            break;
        case 3:
            code = @"Checkin_completion";
            break;
        default:
            code = @"Account_completion";
            break;
    }
    
    [HuanLiSDK getOngoingOppInfoWithPositionCode:code];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark -
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"启动后",@"申购成功后",@"注册之后",@"签到完成",@"开户完成"];
    }
    return _dataArray;
}
@end
