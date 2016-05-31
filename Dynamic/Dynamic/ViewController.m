//
//  ViewController.m
//  Dynamic
//
//  Created by zhangyi on 16/5/26.
//  Copyright © 2016年 Hikvision. All rights reserved.
//

#import "ViewController.h"
#import "CustomBehavior.h"
#import "DynamicView.h"

@interface ViewController ()

@property (nonatomic, strong) CustomAnimator *animator;

@property (nonatomic, assign) BOOL isClear;

@end

@implementation ViewController

- (CustomAnimator *)animator
{
    if (!_animator)
    {
        _animator = [[CustomAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swippedGesture:)];
    [self.view addGestureRecognizer:swipGesture];
    [swipGesture requireGestureRecognizerToFail:tapGesture];
    
}

- (void)swippedGesture:(UISwipeGestureRecognizer *)gesture
{
    if (self.isClear) return;
    
    self.isClear = YES;
    __block NSInteger num = 0;
    
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        num ++;
        [UIView animateWithDuration:2.0 delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
           obj.alpha = 0.0f;
       } completion:^(BOOL finished) {
           if (--num == 0) {
               self.isClear = NO;
           }
           
           [self.animator removeItem:obj];
           [obj removeFromSuperview];
       }];
        
    }];
}

- (void)tappedGesture:(UITapGestureRecognizer *)gesture
{
    [self createDynamicView];
}

- (UIView *)createDynamicView
{
    CGPoint point = CGPointMake(arc4random() % (NSInteger)CGRectGetWidth(self.view.bounds), 25);
    
    DynamicViewType type = arc4random() % DynamicViewTypeStar;
    DynamicView *view = [[DynamicView alloc] initWithDynamicType:type];
    CGRect frame = view.frame;
    frame.origin = point;
    view.frame = frame;

    [self.view addSubview:view];
    view.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 1.0;
    }];
    
    [self.animator addItem:view];
    
    return view;
}

@end
