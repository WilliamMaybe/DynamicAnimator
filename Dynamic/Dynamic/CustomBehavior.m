//
//  CustomBehavior.m
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "CustomBehavior.h"

@interface CustomAnimator()

@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;

@end

@implementation CustomAnimator

- (instancetype)initWithReferenceView:(UIView *)view
{
    if (self = [super initWithReferenceView:view])
    {
        [self addBehavior:self.gravityBehavior];
        [self addBehavior:self.collisionBehavior];
    }
    return self;
}

- (UIGravityBehavior *)gravityBehavior
{
    if (!_gravityBehavior)
    {
        _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[]];
    }
    return _gravityBehavior;
}

- (UICollisionBehavior *)collisionBehavior
{
    if (!_collisionBehavior)
    {
        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[]];
        _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collisionBehavior;
}

- (void)addItem:(id<UIDynamicItem>)item
{
    [self.gravityBehavior addItem:item];
    [self.collisionBehavior addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravityBehavior removeItem:item];
    [self.collisionBehavior removeItem:item];
}

@end
