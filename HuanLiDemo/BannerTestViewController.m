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
#import "TextLinkTableViewCell.h"
#import <HLApi/HLView.h>

@interface BannerTestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
static NSString *const RotationChartCellIdentifier = @"RotationChartCellIdentifier";
static NSString *const ButtonListCellIdentifier = @"ButtonListCellIdentifier";
static NSString *const ContentlistCellIdentifier = @"ContentlistCellIdentifier";
static NSString *const OterCellIdentifier = @"OterCellIdentifier";
static NSString *const TextLinkCellIdentifier = @"TextLinkCellIdentifier";
@implementation BannerTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tbView registerClass:[RotationChartTableViewCell class] forCellReuseIdentifier:RotationChartCellIdentifier];
    [tbView registerClass:[ButtonListTableViewCell class] forCellReuseIdentifier:ButtonListCellIdentifier];
    [tbView registerClass:[ContentListTableViewCell class] forCellReuseIdentifier:ContentlistCellIdentifier];
    [tbView registerClass:[TextLinkTableViewCell class] forCellReuseIdentifier:TextLinkCellIdentifier];
    [tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:OterCellIdentifier];
    tbView.delegate = self;
    tbView.dataSource = self;
    [self.view addSubview:tbView];
    self.tableView = tbView;
    
    [self.tableView reloadData];
    
    [self addview];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.alertMessage) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"运营位说明" message:self.alertMessage preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        self.alertMessage = nil;
    }
}


- (void)addview
{
    HLView *view = [HLView viewWithViewType:HLViewTypeSuspensionView positionCode:@"product_list_suspension_window" block:nil];
    view.backgroundColor = HL_ColorFromRGB(0xbbbbbb);
    view.frame = CGRectMake(self.view.frame.size.width - 60 -20,self.view.frame.size.height - 50-60 , 60, 60);
    view.layer.cornerRadius = 30;
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
            if ([HLView hasDataWithType:HLViewTypeTextLink positionCode:@"home_text_link_1"])
            {
                return [TextLinkTableViewCell cellHeight];
            }else{
                return 0;
            }
           
        case 3:
            return [ContentListTableViewCell cellHeight];
            break;
        
        default:
            break;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        if ([HLView hasDataWithType:HLViewTypeContentBanner positionCode:@"home_page_banner_1"]) {
            return 10;
        }
        return 9;
    }else if(section == 2 && ![HLView hasDataWithType:HLViewTypeTextLink positionCode:@"home_text_link_1"])
    {
        return 0;
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
            cell = [tableView dequeueReusableCellWithIdentifier:TextLinkCellIdentifier forIndexPath:indexPath];
            break;
        case 3:
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
