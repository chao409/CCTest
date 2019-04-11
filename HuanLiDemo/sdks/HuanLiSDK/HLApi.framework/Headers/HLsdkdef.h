//
//  HLsdkdef.h
//  HLApi
//
//  Created by cc on 2019/3/20.
//  Copyright © 2019 HuanLi. All rights reserved.
//

#ifndef HLsdkdef_h
#define HLsdkdef_h

/**
 webView回调类型
 */
typedef NS_ENUM(NSUInteger, HLScriptMessageActionType) {
    HLScriptMessageActionTypeCloseWeb = 1,   // 关闭网页
    HLScriptMessageActionTypeStartLogin,     // 唤起登录流程
    HLScriptMessageActionTypeBuyProduct,     // 唤起购买流程
    HLScriptMessageActionTypeChangeBgColor,  // 更改颜色
    HLScriptMessageActionTypeGoToProductList // 跳转产品列表
};


/**
 分享类型
 */
typedef NS_ENUM(NSUInteger, HLShareContentType) {
    HLShareContentTypeWeb = 0,  // 分享网页
    HLShareContentTypeImage,    // 分享图片
};

/**
 分享结果
 */
typedef NS_ENUM(NSUInteger, HLShareResponseStatusCode) {
    HLShareResponseStatusCodeSuccess = 1,  // 分享成功
    HLShareResponseStatusCodeFail,         // 分享失败
    HLShareResponseStatusCodeCancel        // 取消分享
};

/**
 分享平台
 */
typedef NS_ENUM(NSUInteger, HLShareType) {
    HLShareTypeQQ = 0,      // qq好友
    HLShareTypeQQZone,      // qq空间
    HLShareTypeWX,          // 微信好友
    HLShareTypeWXFriend,    // 微信朋友圈
    HLShareTypeSina,        // 微博
};
#endif /* HLsdkdef_h */
