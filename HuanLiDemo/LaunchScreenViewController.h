//
//  LaunchScreenViewController.h
//  HuanLiDemo
//
//  Created by cc on 2019/3/26.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LaunchViewType) {
    LaunchViewTypeFullScreen = 0, // 全屏
    LaunchViewTypeHalfScreen, // 半屏
};

NS_ASSUME_NONNULL_BEGIN

@interface LaunchScreenViewController : UIViewController

@property (nonatomic, assign) LaunchViewType viewType;
@property (nonatomic, strong) NSString *alertMessage;

@end

NS_ASSUME_NONNULL_END
