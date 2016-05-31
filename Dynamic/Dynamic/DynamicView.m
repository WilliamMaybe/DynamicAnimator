//
//  DynamicView.m
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "DynamicView.h"
#import "UIBezierPath+DynamicView.h"

#define DYNAMIC_VIEW_WIDTH  50

@interface DynamicView ()

@property (nonatomic, assign) DynamicViewType dynamicViewType;

@end

@implementation DynamicView

- (instancetype)initWithDynamicType:(DynamicViewType)dynamicType
{
    CGRect frame = CGRectMake(0, 0, DYNAMIC_VIEW_WIDTH, DYNAMIC_VIEW_WIDTH);
    if (self = [super initWithFrame:frame])
    {
        _dynamicViewType = dynamicType;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithDynamicType:DynamicViewTypeRectangle];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithDynamicType:DynamicViewTypeRectangle];
}

- (void)commonInit
{
    self.backgroundColor = [self randomColor];
    
    self.customCollisionBoundsType = self.dynamicViewType == DynamicViewTypeRectangle ? UIDynamicItemCollisionBoundsTypeRectangle : UIDynamicItemCollisionBoundsTypePath;
    [self maskLayerHandle];
}

- (void)maskLayerHandle
{
    self.customCollisionBoundingPath = [self customBezierPath];
    if (!self.customCollisionBoundingPath)
    {
        return;
    }
    UIBezierPath *shapeLayerPath = [self.customCollisionBoundingPath copy];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    shapeLayer.position = CGPointMake(DYNAMIC_VIEW_WIDTH / 2, DYNAMIC_VIEW_WIDTH / 2);
    
    self.layer.mask = shapeLayer;
    self.layer.masksToBounds = YES;
}

- (UIBezierPath *)customBezierPath
{
    switch (self.dynamicViewType)
    {
        case DynamicViewTypeRectangle: return nil;
        case DynamicViewTypeStar:      return [UIBezierPath starBezierPathForDynamicView:self];
        case DynamicViewTypeRound:     return [UIBezierPath roundBezierPathForDynamicView:self];
        case DynamicViewTypeHalfRound: return [UIBezierPath halfRoundBezierPathForDynamicView:self];
    }
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:(arc4random() % 255) / 255.0
                           green:(arc4random() % 255) / 255.0
                            blue:(arc4random() % 255) / 255.0
                           alpha:1.0];
}

#pragma mark - UIDynamicItem Delegate

- (UIDynamicItemCollisionBoundsType)collisionBoundsType
{
    return self.customCollisionBoundsType;
}

- (UIBezierPath *)collisionBoundingPath
{
    return self.customCollisionBoundingPath ?: [super collisionBoundingPath];
}

@end
