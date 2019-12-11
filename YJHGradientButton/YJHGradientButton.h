//
//  YJHGradientButton.h
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2019/12/11.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJHGradientButton : UIButton

@property (nonatomic, strong, readonly) NSArray<UIColor *> *colors;
@property (nonatomic, assign, readonly) CGPoint startPoint;
@property (nonatomic, assign, readonly) CGPoint endPoint;
/// color split location
@property (nullable, copy, nonatomic) NSArray<NSNumber *> *locations;

/// This is UIButton sub class. In theory you can call this method to initialize the sub object.
/// But if there is no color gradient requirement, it is recommended to call UIButton to initialize.
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

/// initialize func
/// @param colors gradient colors
- (instancetype)initHorizontalGradientColor:(NSArray<UIColor *> *)colors;
- (instancetype)initVerticalGradientColor:(NSArray<UIColor *> *)colors;
- (instancetype)initGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/// setting corner
- (void)buttoncornerRadius:(CGFloat)radius;
- (void)buttoncornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)rectCorner;
- (void)buttoncornerRadii:(CGSize)cornerRadii roundingCorners:(UIRectCorner)rectCorner;

@end

NS_ASSUME_NONNULL_END
