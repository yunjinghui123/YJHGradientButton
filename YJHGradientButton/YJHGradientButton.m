//
//  YJHGradientButton.m
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2019/12/11.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHGradientButton.h"

@interface YJHGradientButton ()
/// The layer of this button sub object to control color gradient.
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/* The array of CGColorRef objects defining the color of each gradient
* stop. Defaults to nil. Animatable. */
@property (nonatomic, strong) NSMutableArray  *gradientColors;

@property (nonatomic, strong) NSArray<UIColor *> *colors;
@property (nonatomic, assign) CGPoint            startPoint;
@property (nonatomic, assign) CGPoint            endPoint;

/// button desc
@property (nonatomic, assign) CGSize             cornerRadii;
@property (nonatomic, assign) UIRectCorner       rectCorner;
@property (nonatomic, assign) BOOL               isCorner;
@end

@implementation YJHGradientButton {
    CGSize _contentSize;
}

#pragma mark - init
+ (instancetype)createHorizontalGradientColors:(NSArray<UIColor *> *)colors {
    return [[self alloc] initHorizontalGradientColors:colors];
}

+ (instancetype)createVerticalGradientColors:(NSArray<UIColor *> *)colors {
    return [[self alloc] initVerticalGradientColors:colors];
}

+ (instancetype)createGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    return [[self alloc] initGradientColors:colors startPoint:startPoint endPoint:endPoint];
}

- (instancetype)initHorizontalGradientColors:(NSArray<UIColor *> *)colors {
    return [self initGradientColors:colors startPoint:CGPointZero endPoint:CGPointMake(1, 0)];
}

- (instancetype)initVerticalGradientColors:(NSArray<UIColor *> *)colors {
    return [self initGradientColors:colors startPoint:CGPointZero endPoint:CGPointMake(0, 1)];
}

- (instancetype)initGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (self = [super init]) {
        self.isCorner = NO;
        self.colors = colors;
        self.startPoint = startPoint;
        self.endPoint = endPoint;
        [self.layer addSublayer:self.gradientLayer];
        
        [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.gradientColors addObject:(__bridge id)obj.CGColor];
        }];
        
        [self setNeedsDisplay];
    }
    return self;
}

#pragma mark  - set location
- (void)setLocations:(NSArray<NSNumber *> *)locations {
    _locations = locations.copy;
    self.gradientLayer.locations = locations;
}


- (void)setFrame:(CGRect)frame {
    if (!CGRectEqualToRect(frame, self.frame)) {
        [super setFrame:frame];
        
        _contentSize = frame.size;
        [self invalidateIntrinsicContentSize];
    }
}

- (CGSize)intrinsicContentSize {
    return _contentSize;
}

#pragma mark - draw gradient color
- (void)drawRect:(CGRect)rect {
    self.gradientLayer.frame = rect;
    self.gradientLayer.colors = self.gradientColors;
    self.gradientLayer.startPoint = self.startPoint;
    self.gradientLayer.endPoint = self.endPoint;
    
    if (_isCorner) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:self.rectCorner cornerRadii:self.cornerRadii];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = rect;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

#pragma mark - setting corner
- (void)buttoncornerRadius:(CGFloat)radius {
    self.isCorner = YES;
    self.cornerRadii = CGSizeMake(radius, radius);
    self.rectCorner = UIRectCornerAllCorners;
    [self setNeedsDisplay];
}

- (void)buttoncornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)rectCorner {
    self.isCorner = YES;
    self.cornerRadii = CGSizeMake(radius, radius);
    self.rectCorner = rectCorner;
    [self setNeedsDisplay];
}

- (void)buttoncornerRadii:(CGSize)cornerRadii roundingCorners:(UIRectCorner)rectCorner {
    self.isCorner = YES;
    self.cornerRadii = cornerRadii;
    self.rectCorner = rectCorner;
    [self setNeedsDisplay];
}

#pragma mark - lazy
- (CAGradientLayer *)gradientLayer {
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}

- (NSMutableArray *)gradientColors {
    if (_gradientColors == nil) {
        _gradientColors = [NSMutableArray array];
    }
    return _gradientColors;
}

@end
