//
//  HLShareResultProtocol.h
//  HLApi
//
//  Created by cc on 2019/3/20.
//  Copyright © 2019 HuanLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLsdkdef.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HLShareResultProtocol <NSObject>

@optional

/**
 分享结果回调

 @param statusCode 分享结果
 @param errMsg 分享失败详情
 @param shareType 分享平台
 */
- (void)shareResponseStatusCode:(HLShareResponseStatusCode)statusCode errMsg:(NSString *)errMsg shareType:(HLShareType)shareType;

@end

NS_ASSUME_NONNULL_END
