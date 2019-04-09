//
//  ButtonListTableViewCell.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/25.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "ButtonListTableViewCell.h"
#import <HLApi/HLView.h>

#define BtnCount 5

@implementation ButtonListTableViewCell
{
    UIScrollView *_bgScrollView;
}
+ (CGFloat)cellHeight
{
    return 110.f;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addButtons];
        NSLog(@"----%s",__func__);
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addButtons];
        NSLog(@"%s",__func__);
    }
    return self;
}


- (void)addButtons
{
    CGFloat btnWidth = 80;
    CGFloat btnY = 15;
    CGFloat space = 20;
    
    _bgScrollView = [[UIScrollView alloc] init];
    _bgScrollView.backgroundColor = HL_ColorFromRGB(0xdddddd);
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:_bgScrollView];

    BOOL hasData = [HLView hasDataWithType:HLViewTypeRotationBanner positionCode:@"home_navigation_button_1"];
    CGFloat hlViewWidth = 0;
    _bgScrollView.contentSize = CGSizeMake((BtnCount + (hasData?1:0))*(space+btnWidth), [[self class] cellHeight]);
    if (hasData) {
        HLView *hlView = [HLView viewWithViewType:HLViewTypeRotationBanner positionCode:@"home_navigation_button_1" block:nil];
        hlView.frame = CGRectMake(space, btnY, btnWidth, btnWidth);
        hlView.layer.cornerRadius = btnWidth/2.0;
        hlView.layer.masksToBounds = YES;
        [_bgScrollView addSubview:hlView];
        hlViewWidth = btnWidth;
    }
    
    for (int i=0; i<BtnCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"200.png"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(hlViewWidth +space+i*(btnWidth+space), btnY, btnWidth, btnWidth);
        btn.layer.cornerRadius = btnWidth/2.0;
        btn.layer.masksToBounds = YES;
        [_bgScrollView addSubview:btn];
    }
    
}

- (void)layoutSubviews
{
    _bgScrollView.frame = self.bounds;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
