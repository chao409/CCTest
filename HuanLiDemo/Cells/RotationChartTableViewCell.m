//
//  RotationChartTableViewCell.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/25.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "RotationChartTableViewCell.h"
#import <HLApi/HLView.h>
@implementation RotationChartTableViewCell
{
    UIScrollView *_scrollView;
}
+ (CGFloat)cellHeight
{
    return kScreenSizeWidth* 9.0/16.0;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addhlView];
        NSLog(@"----%s",__func__);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addhlView];
        NSLog(@"------%s",__func__);
    }
    return self;
}


- (void)addhlView
{
    NSArray *dataArray = @[@"banner1",@"banner2",@"banner3",@"banner4",@"banner5"];
    CGFloat imageWidth = kScreenSizeWidth;
    CGFloat imageHeight = [[self class] cellHeight];
    
    
    _scrollView = [[UIScrollView alloc] init];
 //   scrollView.scrollsToTop = NO;
//    scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.clipsToBounds = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(imageWidth*(dataArray.count+1), imageHeight);
    [self addSubview:_scrollView];
    
    
    BOOL hasData = [HLView hasDataWithType:HLViewTypeRotationBanner positionCode:@"home_top_banner_1"];
    CGFloat hlViewWidth = 0;
    
    if (hasData) {
        HLView *view = [HLView viewWithViewType:HLViewTypeRotationBanner positionCode:@"home_top_banner_1" block:nil];
        view.frame = CGRectMake(0, 0, imageWidth, imageHeight);
        [_scrollView addSubview:view];
        view.backgroundColor = [UIColor clearColor];
        hlViewWidth = imageWidth;
    }
    for (int i =0; i<dataArray.count; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dataArray[i]]];
        imageView.frame = CGRectMake(hlViewWidth + i*imageWidth, 0, imageWidth, imageHeight);
        imageView.userInteractionEnabled = YES;
        [_scrollView addSubview:imageView];
    }
    

   
}
- (void)layoutSubviews
{
    _scrollView.frame = self.bounds;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
