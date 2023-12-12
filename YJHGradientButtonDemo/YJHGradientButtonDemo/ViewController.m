//
//  ViewController.m
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2019/12/11.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"
#import "NormalController.h"
#import "GradientListController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *title = nil;
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            title = [(UILabel *)view text];
            break;
        }
    }
    
    switch (indexPath.row) {
        case 0: {
            NormalController *normalVC = [NormalController new];
            [self.navigationController pushViewController:normalVC animated:YES];
        }
            break;
        case 1: {
            GradientListController *listVC = [GradientListController new];
            [self.navigationController pushViewController:listVC animated:YES];
        }
    }

}


@end
