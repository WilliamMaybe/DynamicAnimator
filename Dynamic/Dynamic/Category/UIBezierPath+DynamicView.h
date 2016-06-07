//
//  UIBezierPath+DynamicView.h
//  Dynamic
//
//  Created by zhangyi on 16/5/31.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (DynamicView)

/// 五角星
+ (UIBezierPath *)starBezierPathForDynamicView:(UIView *)view;
/// 五边形
+ (UIBezierPath *)pentagonBezierPathForDynamicView:(UIView *)view;
/// 圆形
+ (UIBezierPath *)roundBezierPathForDynamicView:(UIView *)view;
/// 半圆形
+ (UIBezierPath *)halfRoundBezierPathForDynamicView:(UIView *)view;

@end
