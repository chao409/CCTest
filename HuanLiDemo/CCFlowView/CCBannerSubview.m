//
//  CCBannerSubview.m
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import "CCBannerSubview.h"

@implementation CCBannerSubview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentImageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (UIImageView *)contentImageView
{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.userInteractionEnabled = YES;
    }
    return _contentImageView;
}

@end
