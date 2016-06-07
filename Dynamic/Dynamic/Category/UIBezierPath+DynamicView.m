//
//  UIBezierPath+DynamicView.m
//  Dynamic
//
//  Created by zhangyi on 16/5/31.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "UIBezierPath+DynamicView.h"

double wz_sin(double angle)
{
    return sin(angle / 180.0 * M_PI);
}

double wz_cos(double angle)
{
    return cos(angle / 180.0 * M_PI);
}

@implementation UIBezierPath (DynamicView)

+ (UIBezierPath *)starBezierPathForDynamicView:(UIView *)view
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    CGFloat radius = CGRectGetWidth(view.bounds) / 2;
    //    假设t为内部五边形外接圆半径,
    //    t=(1+tan^2(18°))/(3-tan^2(18°)),即0.3819660112501
    CGFloat innerRadius = radius * 0.3819660112501;
    
    NSArray *pointArray = @[[NSValue valueWithCGPoint:CGPointMake( wz_sin(0),   wz_cos(0))],
                            [NSValue valueWithCGPoint:CGPointMake( wz_sin(72),  wz_cos(72))],
                            [NSValue valueWithCGPoint:CGPointMake( wz_sin(36), -wz_cos(36))],
                            [NSValue valueWithCGPoint:CGPointMake(-wz_sin(36), -wz_cos(36))],
                            [NSValue valueWithCGPoint:CGPointMake(-wz_sin(72),  wz_cos(72))]];
    
    NSArray *innerPointArray = @[[NSValue valueWithCGPoint:CGPointMake( wz_sin(36),  wz_cos(36))],
                                 [NSValue valueWithCGPoint:CGPointMake( wz_sin(72), -wz_cos(72))],
                                 [NSValue valueWithCGPoint:CGPointMake( wz_sin(0),  -wz_cos(0))],
                                 [NSValue valueWithCGPoint:CGPointMake(-wz_sin(72), -wz_cos(72))],
                                 [NSValue valueWithCGPoint:CGPointMake(-wz_sin(36),  wz_cos(36))]];

//    则五个顶点所对应的坐标为(即内部五边形的五个顶点)：
//    AA(0,-t)                  3
//    BB(-t*cos18°,-t*sin18°)   4
//    CC(-t*cos54°,t*sin54°)    5
//    DD(t*cos54°,t*sin54°)     1
//    EE(t*cos18°,-t*sin18°)    2
    CGPoint firstPoint = [[pointArray firstObject] CGPointValue];
    firstPoint.x *= radius;
    firstPoint.y *= radius;
    
    [bezierPath moveToPoint:firstPoint];
    CGPoint innerFirstPoint = [[innerPointArray firstObject] CGPointValue];
    innerFirstPoint.x *= innerRadius;
    innerFirstPoint.y *= innerRadius;
    [bezierPath addLineToPoint:innerFirstPoint];
    
    for (NSInteger i = 1; i < [pointArray count]; i ++)
    {
        CGPoint tmpPoint = [pointArray[i] CGPointValue];
        tmpPoint.x *= radius;
        tmpPoint.y *= radius;
        
        CGPoint tmpInnerPoint = [innerPointArray[i] CGPointValue];
        tmpInnerPoint.x *= innerRadius;
        tmpInnerPoint.y *= innerRadius;
        
        [bezierPath addLineToPoint:tmpPoint];
        [bezierPath addLineToPoint:tmpInnerPoint];
    }
    [bezierPath addLineToPoint:firstPoint];
    return bezierPath;
}

+ (UIBezierPath *)pentagonBezierPathForDynamicView:(UIView *)view
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    CGFloat radius = CGRectGetWidth(view.bounds) / 2;

    NSArray *pointArray = @[[NSValue valueWithCGPoint:CGPointMake( wz_sin(0),   wz_cos(0))],
                            [NSValue valueWithCGPoint:CGPointMake( wz_sin(72),  wz_cos(72))],
                            [NSValue valueWithCGPoint:CGPointMake( wz_sin(36), -wz_cos(36))],
                            [NSValue valueWithCGPoint:CGPointMake(-wz_sin(36), -wz_cos(36))],
                            [NSValue valueWithCGPoint:CGPointMake(-wz_sin(72),  wz_cos(72))]];
    
    CGPoint firstPoint = [[pointArray firstObject] CGPointValue];
    firstPoint.x *= radius;
    firstPoint.y *= radius;
    
    [bezierPath moveToPoint:firstPoint];
    for (NSInteger i = 1; i < [pointArray count]; i ++)
    {
        CGPoint tmpPoint = [pointArray[i] CGPointValue];
        tmpPoint.x *= radius;
        tmpPoint.y *= radius;
        
        [bezierPath addLineToPoint:tmpPoint];
    }
    [bezierPath addLineToPoint:firstPoint];
    return bezierPath;
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
    
    CGFloat startAngle = (arc4random() % 360) / 180.0 * M_PI;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:radius startAngle:startAngle endAngle:startAngle + M_PI clockwise:YES];
    return bezierPath;
}

@end
