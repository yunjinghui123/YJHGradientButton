//
//  YJHGradientButton.h
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2019/12/11.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

/**
    设置颜色渐变按钮，如果渐变按钮size固定，建议调用初始化方法。
    如果按钮size不固定，不建议调用此类，因为会不断重绘背景渐变色。
    如果调用，当按钮的frame发生改变的时候需要重新设置frame。
    同样，虽然本类实现了按钮设置圆角，但同样也不建议调用设置圆角方法，因为会多重绘一次。
    但是如果你调用 masksToBounds 方法，同样也会导致离屏渲染，造成性能消耗，所以此中取舍建议使用者自己掌握。
    尽可能不使用渐变这种方式，尤其是在重用视图中。
 
    Set the color gradient button. If the size of the gradient button is fixed, it is recommended to call the initialization method.
    If the button size is not fixed, it is not recommended to call this class, because the background gradient will be redrawn continuously.
    If called, the frame needs to be reset when the button's frame changes.
    Similarly, although this class implements button rounding, it is also not recommended to call the rounding method, because it will draw multiple times.
    However, if you call the masksToBounds method, it will also cause off-screen rendering, which will result in performance consumption. Therefore, it is recommended that users make this choice.
    Try not to use gradients this way, especially in reused views.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJHGradientButton : UIButton

@property (nonatomic, strong) NSArray<UIColor *> *colors;
@property (nonatomic, assign, readonly) CGPoint startPoint;
@property (nonatomic, assign, readonly) CGPoint endPoint;
/// color split location
@property (nullable, copy, nonatomic) NSArray<NSNumber *> *locations;

/// This is UIButton sub class. In theory you can call this method to initialize the sub object.
/// But if there is no color gradient requirement, it is recommended to call UIButton to initialize.
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

/// class func
/// @param colors gradient color
+ (instancetype)createHorizontalGradientColors:(NSArray<UIColor *> *)colors;
+ (instancetype)createVerticalGradientColors:(NSArray<UIColor *> *)colors;
+ (instancetype)createGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/// initialize func
/// @param colors gradient colors
- (instancetype)initHorizontalGradientColors:(NSArray<UIColor *> *)colors;
- (instancetype)initVerticalGradientColors:(NSArray<UIColor *> *)colors;
- (instancetype)initGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/// setting corner
- (void)buttoncornerRadius:(CGFloat)radius;
- (void)buttoncornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)rectCorner;
- (void)buttoncornerRadii:(CGSize)cornerRadii roundingCorners:(UIRectCorner)rectCorner;

@end

NS_ASSUME_NONNULL_END
