
//
//  UIColor+Category.m
//  Dynamic
//
//  Created by zhangyi on 16/5/31.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)randomColor
{
    return [UIColor colorWithRed:(arc4random() % 255) / 255.0
                           green:(arc4random() % 255) / 255.0
                            blue:(arc4random() % 255) / 255.0
                           alpha:1.0];
}


@end
