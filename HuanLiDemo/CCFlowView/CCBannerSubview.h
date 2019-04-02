//
//  CCBannerSubview.h
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCBannerSubview : UIView

@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, copy) void(^selectedItemBlock)(CCBannerSubview *bannerView,NSInteger tag);

@end

NS_ASSUME_NONNULL_END
