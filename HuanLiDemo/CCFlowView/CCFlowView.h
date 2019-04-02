//
//  CCFlowView.h
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBannerSubview.h"

@protocol CCFlowViewDelegate;
@protocol CCFlowViewDataSource;

NS_ASSUME_NONNULL_BEGIN

@interface CCFlowView : UIView
@property (nonatomic, assign) id<CCFlowViewDelegate> delegate;
@property (nonatomic, assign) id<CCFlowViewDataSource> dataSource;

@end


@protocol CCFlowViewDelegate <NSObject>

/**
 滚动到了某一页
 */
- (void)flowView:(CCFlowView *)flowView didScrollToIndex:(NSInteger)index;

/**
 点击了某一页
 */
- (void)didSelectedBannerView:(CCBannerSubview *)bannerView withIndex:(NSInteger)index;

@end

@protocol CCFlowViewDataSource <NSObject>

- (NSInteger)numberOfPagesInFlowView:(CCFlowView *)flowView;

- (CCBannerSubview *)flowView:(CCFlowView *)flowView cellForPageAtIndex:(NSInteger)index;

@end
NS_ASSUME_NONNULL_END
