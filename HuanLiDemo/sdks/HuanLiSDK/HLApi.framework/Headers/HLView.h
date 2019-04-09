//
//  HLView.h
//  HLApi
//
//  Created by cc on 2019/3/18.
//  Copyright © 2019 HuanLi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, HLViewType) {
    HLViewTypeNone = 0,
    HLViewTypeRotationBanner = 1, // 轮播图banner
    HLViewTypeContentBanner  = 2, // 页面内banner
    HLViewTypeTextLink       = 3, // 文字链接
    HLViewTypeSuspensionView = 4, // 悬浮窗
    HLViewTypeListButton     = 5, // 列表按钮
    HLViewTypeStartupPageHalfScreen = 7, // 启动页-半屏
    HLViewTypeStartupPageFullScreen = 8, // 启动页-全屏
    HLViewTypeNavigationButton      = 9, // 导航按钮
};
typedef void(^HLViewEmptyDataBlock)(BOOL isEmptyData);
NS_ASSUME_NONNULL_BEGIN

@interface HLView : UIView

/**
 获取要显示的View

 @param type HLViewType
 @param positionCode 运营id
 @param placeHolder 占位图
 @param emptyDataBlock 无数据时调用
 @return hlview
 */
+ (HLView *)viewWithViewType:(HLViewType)type positionCode:(NSString *)positionCode placeHolder:(NSString *)placeHolder block:(nullable HLViewEmptyDataBlock)emptyDataBlock;

+ (HLView *)viewWithViewType:(HLViewType)type positionCode:(NSString *)positionCode block:(nullable HLViewEmptyDataBlock)emptyDataBlock;

+ (HLView *)viewWithViewType:(HLViewType)type positionCode:(NSString *)positionCode;

/**
 判断有没有数据
 */
+ (BOOL)hasDataWithType:(HLViewType)type positionCode:(NSString *)positionCode;

@end

NS_ASSUME_NONNULL_END
