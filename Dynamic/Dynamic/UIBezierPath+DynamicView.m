//
//  UIBezierPath+DynamicView.m
//  Dynamic
//
//  Created by zhangyi on 16/5/31.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "UIBezierPath+DynamicView.h"

@implementation UIBezierPath (DynamicView)

+ (UIBezierPath *)starBezierPathForDynamicView:(UIView *)view
{
    return nil;
}

+ (UIBezierPath *)roundBezierPathForDynamicView:(UIView *)view
{
    CGFloat radius = CGRectGetWidth(view.bounds) / 2;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    return bezierPath;
}

+ (UIBezierPath *)halfRoundBezierPathForDynamicView:(UIView *)view
{
    CGFloat radius = CGRectGetWidth(view.bounds) / 2;
    
    CGFloat startAngle = (arc4random() % 360) / 360.0 * M_PI * 2;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:radius startAngle:startAngle endAngle:startAngle + M_PI clockwise:YES];
    return bezierPath;
}

@end
