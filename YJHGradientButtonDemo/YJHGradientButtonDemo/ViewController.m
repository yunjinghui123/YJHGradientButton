//
//  ViewController.m
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2019/12/11.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"
#import "YJHGradientButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    YJHGradientButton *button = [[YJHGradientButton alloc] initHorizontalGradientColor:@[UIColor.redColor, UIColor.greenColor]];
    button.frame = CGRectMake(100, 100, 200, 100);
    [self.view addSubview:button];
    
    NSLog(@"%@___%@___%@", button.colors, NSStringFromCGPoint(button.startPoint), NSStringFromCGPoint(button.endPoint));
    
    
    button = [[YJHGradientButton alloc] initVerticalGradientColor:@[UIColor.cyanColor, UIColor.blackColor]];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 205, 200, 100);
    NSLog(@"%@___%@___%@", button.colors, NSStringFromCGPoint(button.startPoint), NSStringFromCGPoint(button.endPoint));

    
    button = [[YJHGradientButton alloc] initGradientColors:@[UIColor.cyanColor, UIColor.blueColor, UIColor.yellowColor] startPoint:CGPointZero endPoint:CGPointMake(1, 0)];
    button.locations = @[@0.2, @0.3, @0.5];
    button.frame = CGRectMake(100, 311, 200, 100);
    [self.view addSubview:button];
    NSLog(@"%@___%@___%@", button.colors, NSStringFromCGPoint(button.startPoint), NSStringFromCGPoint(button.endPoint));
}


@end
