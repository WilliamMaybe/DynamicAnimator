//
//  UIBezierPath+DynamicView.h
//  Dynamic
//
//  Created by zhangyi on 16/5/31.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (DynamicView)

+ (UIBezierPath *)starBezierPathForDynamicView:(UIView *)view;
+ (UIBezierPath *)roundBezierPathForDynamicView:(UIView *)view;
+ (UIBezierPath *)halfRoundBezierPathForDynamicView:(UIView *)view;

@end
