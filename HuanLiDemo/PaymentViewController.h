//
//  PaymentViewController.h
//  HuanLiDemo
//
//  Created by cc on 2019/3/27.
//  Copyright © 2019 HuanLiDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaymentViewController : UIViewController
@property (nonatomic, copy) void(^paymentResultBlock)(BOOL success,NSString *result);
@end

NS_ASSUME_NONNULL_END
