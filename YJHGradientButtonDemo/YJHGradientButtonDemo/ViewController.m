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
    
    YJHGradientButton *button = [YJHGradientButton createVerticalGradientColors:@[UIColor.redColor, UIColor.greenColor]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button setTitle:@"1" forState:UIControlStateNormal];
    [button buttoncornerRadius:30 roundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight];
    button.frame = CGRectMake(100, 100, 200, 100);
    
    button = [[YJHGradientButton alloc] initVerticalGradientColors:@[UIColor.cyanColor, UIColor.blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 205, 100, 100);
    [button setTitle:@"2" forState:UIControlStateNormal];
    [button buttoncornerRadii:CGSizeMake(33, 50) roundingCorners:UIRectCornerAllCorners];
    
    button = [[YJHGradientButton alloc] initGradientColors:@[UIColor.cyanColor, UIColor.blueColor, UIColor.yellowColor] startPoint:CGPointZero endPoint:CGPointMake(1, 0)];
    button.locations = @[@0.2, @0.3, @0.5];
    button.frame = CGRectMake(100, 311, 200, 100);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"3" forState:UIControlStateNormal];
    [button buttoncornerRadius:30];
}

- (void)buttonAction:(YJHGradientButton *)button {
    NSLog(@"current_%@__%@___%@___%@", button.currentTitle, button.colors, NSStringFromCGPoint(button.startPoint), NSStringFromCGPoint(button.endPoint));
}


@end
