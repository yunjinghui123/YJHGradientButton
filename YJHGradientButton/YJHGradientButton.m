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
@property (nonatomic, strong) NSMutableArray *gradientColors;

@property (nonatomic, strong) NSArray<UIColor *> *colors;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

@end

@implementation YJHGradientButton

#pragma mark - init
- (instancetype)initHorizontalGradientColor:(NSArray<UIColor *> *)colors {
    return [self initGradientColors:colors startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
}

- (instancetype)initVerticalGradientColor:(NSArray<UIColor *> *)colors {
    return [self initGradientColors:colors startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}

- (instancetype)initGradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (self = [super init]) {
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


#pragma mark - draw gradient color
- (void)drawRect:(CGRect)rect {
    self.gradientLayer.frame = rect;
    self.gradientLayer.colors = self.gradientColors;
    self.gradientLayer.startPoint = self.startPoint;
    self.gradientLayer.endPoint = self.endPoint;
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
