//
//  GradientListCell.m
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2020/4/24.
//  Copyright © 2020 yunjinghui. All rights reserved.
//

#import "GradientListCell.h"
#import "YJHGradientButton.h"

@implementation GradientListCell {
    YJHGradientButton *_gradientButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _gradientButton = [YJHGradientButton createHorizontalGradientColors:@[UIColor.redColor, UIColor.greenColor]];
        _gradientButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_gradientButton buttoncornerRadius:8.f];
        _gradientButton.frame = CGRectMake(20, 15, 50, 20);
//            [gradientButton social_marrow_button];
        [self.contentView addSubview:_gradientButton];
    }
    return self;
}

- (void)setMod:(GradientObj *)mod {
    _mod = mod;
    
    _gradientButton.colors = mod.colors;
    [_gradientButton setTitle:mod.text forState:UIControlStateNormal];
    [_gradientButton sizeToFit];
    _gradientButton.frame = CGRectMake(20, 15, _gradientButton.frame.size.width, 20);
}



@end
