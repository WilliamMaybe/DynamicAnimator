//
//  DynamicView.h
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicView : UIView

@property (nonatomic, assign) UIDynamicItemCollisionBoundsType customCollisionBoundsType;

@property (nonatomic, strong) UIBezierPath *customCollisionBoundingPath;

@end
