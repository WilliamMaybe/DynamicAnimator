//
//  DynamicView.m
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "DynamicView.h"

@implementation DynamicView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [self randomColor];
    }
    return self;
}
- (UIColor *)randomColor
{
    return [UIColor colorWithRed:(arc4random() % 255) / 255.0
                           green:(arc4random() % 255) / 255.0
                            blue:(arc4random() % 255) / 255.0
                           alpha:1.0];
}

@end
