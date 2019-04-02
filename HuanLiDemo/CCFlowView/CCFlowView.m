//
//  CCFlowView.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "CCFlowView.h"
@interface CCFlowView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic,retain)  UIPageControl *pageControl;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation CCFlowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (void)initializeViews
{
    [self addSubview:self.scrollView];
}

#pragma mark - getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.clipsToBounds = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}


@end
