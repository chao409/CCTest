//
//  HuanLiSDK.h
//  HLApi
//
//  Created by cc on 2019/3/20.
//  Copyright © 2019 HuanLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLsdkdef.h"
#import "HLShareResultProtocol.h"
#import "HLSdkProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HuanLiSDK : NSObject

/**
 注册应用

 @param appKey HuanLi网站申请的appkey
 @param sercret HuanLi网站申请的appsercret
 @param delegate 代理
 */
+ (void)registerHLApp:(NSString *)appKey
           appSercret:(NSString *)sercret
             delegate:(id<HLSdkProtocol>)delegate;

/**
 注册第三方分享

 @param qqAppId qq
 @param wxAppId wx
 @param wbAppId wb
 */
+ (void)registerQQApp:(NSString *)qqAppId
                WXApp:(NSString *)wxAppId
                WBApp:(NSString *)wbAppId
             delegate:(id<HLShareResultProtocol>)delegate;

/**
 处理第三方分享结果
 */
+ (BOOL)handleOpenURL:(NSURL *)url;


/**
 更新用户id（登录或退出登录时调用）

 @param userId 未登录时传nil
 */
+ (void)updateUserId:(nullable NSString *)userId;

/**
 获取流程中的运营位
 
 @param code 商户运营位Code
 */
+ (void)getOngoingOppInfoWithPositionCode:(NSString *)code;


/*   -------     webview      --------*/

/**
 上传用户信息给web

 @param userId userId
 */
+ (void)uploadUserInfo:(NSString *)userId;


/**
 上传购买结果

 @param aId 唤起事件的Id
 @param result 申购结果， 0 失败， 1 成功， 2 处理中/未知
 @param buyAmount 申购金额
 @param subscribeId 购买订单的Id
 @param productId 购买产品的Id
 */
+ (void)uploadBuyProductWithActionId:(NSString *)aId buyResult:(NSString *)result buyAmount:(NSString *)buyAmount subscribeId:(NSString *)subscribeId productId:(NSString *)productId;

+ (void)testAction;
@end


NS_ASSUME_NONNULL_END
