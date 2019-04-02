//
//  BannerTestViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/25.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "BannerTestViewController.h"
// cell
#import "RotationChartTableViewCell.h"
#import "ButtonListTableViewCell.h"
#import "ContentListTableViewCell.h"
#import <HLApi/HLView.h>

@interface BannerTestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
static NSString *const RotationChartCellIdentifier = @"RotationChartCellIdentifier";
static NSString *const ButtonListCellIdentifier = @"ButtonListCellIdentifier";
static NSString *const ContentlistCellIdentifier = @"ContentlistCellIdentifier";
static NSString *const OterCellIdentifier = @"OterCellIdentifier";
@implementation BannerTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tbView registerClass:[RotationChartTableViewCell class] forCellReuseIdentifier:RotationChartCellIdentifier];
    [tbView registerClass:[ButtonListTableViewCell class] forCellReuseIdentifier:ButtonListCellIdentifier];
    [tbView registerClass:[ContentListTableViewCell class] forCellReuseIdentifier:ContentlistCellIdentifier];
    [tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:OterCellIdentifier];
    tbView.delegate = self;
    tbView.dataSource = self;
    [self.view addSubview:tbView];
    self.tableView = tbView;
    
    [self.tableView reloadData];
    
    [self addview];
}

- (void)addview
{
    HLView *view = [HLView viewWithViewType:HLViewTypeSuspensionView positionCode:@"" block:nil];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(self.view.frame.size.width - 100 -20,self.view.frame.size.height - 50-100 , 100, 100);
    view.layer.cornerRadius = 50;
    view.layer.masksToBounds = YES;
    [self.view addSubview:view];
}
- (void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return [RotationChartTableViewCell cellHeight];
            break;
        case 1:
            return [ButtonListTableViewCell cellHeight];
            break;
        case 2:
            return [ContentListTableViewCell cellHeight];
            break;
            
        default:
            break;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            break;
        default:
            break;
    }
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 10;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:RotationChartCellIdentifier forIndexPath:indexPath];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:ButtonListCellIdentifier forIndexPath:indexPath];
            break;
        case 2:
            if (indexPath.row == 0) {
                cell = [tableView dequeueReusableCellWithIdentifier:ContentlistCellIdentifier forIndexPath:indexPath];
            }else
            {
                cell = [tableView dequeueReusableCellWithIdentifier:OterCellIdentifier forIndexPath:indexPath];
                cell.imageView.image = [UIImage imageNamed:@"200.png"];
                cell.textLabel.text = @"这是cell的title。哈哈😆";
            }
            
            break;
            
        default:
            break;
    }
    return cell;
}

@end
