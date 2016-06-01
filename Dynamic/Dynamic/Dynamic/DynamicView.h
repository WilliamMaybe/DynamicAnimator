//
//  DynamicView.h
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DynamicViewType) {
    DynamicViewTypeRectangle,
    DynamicViewTypeHalfRound,
    DynamicViewTypeRound,
    DynamicViewTypeStar,
};

@interface DynamicView : UIView

- (instancetype)initWithDynamicType:(DynamicViewType)dynamicType NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign) UIDynamicItemCollisionBoundsType customCollisionBoundsType;
@property (nonatomic, strong) UIBezierPath *customCollisionBoundingPath;

@end
