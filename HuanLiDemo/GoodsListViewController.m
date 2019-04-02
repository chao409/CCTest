//
//  GoodsListViewController.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/27.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "GoodsListViewController.h"

@interface GoodsListViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

static NSString *const cellIdentifier = @"cellIdentifier";
@implementation GoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品列表";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
}

- (void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableViewDelegate DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"200.png"];
    cell.textLabel.text = @"这是一个商品的标题";
    return cell;
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
