//
//  DynamicView.h
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DynamicViewType) {
    DynamicViewTypeRectangle = 0,   /// 正方形
    DynamicViewTypeHalfRound,       /// 半圆
    DynamicViewTypeRound,           /// 圆形
    DynamicViewTypePentagon,        /// 五边形
    DynamicViewTypeStar NS_DEPRECATED_IOS(3_0, 3_0, "自定义图形必须是凸面多变行，或者使用UIDynamicItemGroup实现"),            /// 星形
};

@interface DynamicView : UIView

- (instancetype)initWithDynamicType:(DynamicViewType)dynamicType NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign) UIDynamicItemCollisionBoundsType customCollisionBoundsType;
@property (nonatomic, strong) UIBezierPath *customCollisionBoundingPath;

@end
