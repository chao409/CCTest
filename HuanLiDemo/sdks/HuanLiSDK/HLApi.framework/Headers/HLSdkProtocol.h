//
//  HLSdkProtocol.h
//  HLApi
//
//  Created by cc on 2019/3/20.
//  Copyright © 2019 HuanLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLsdkdef.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HLSdkProtocol <NSObject>

/**
 web收到信息需要客户端执行一些操作
 
 @param type HLScriptMessageActionType
 @param object 附加信息
 */
- (void)didReceiveWebViewMessageType:(HLScriptMessageActionType)type object:(NSString *)object;

@end

NS_ASSUME_NONNULL_END
