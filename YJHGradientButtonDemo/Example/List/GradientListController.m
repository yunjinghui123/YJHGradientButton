//
//  GradientListController.m
//  YJHGradientButtonDemo
//
//  Created by yunjinghui on 2020/4/24.
//  Copyright © 2020 yunjinghui. All rights reserved.
//

#import "GradientListController.h"
#import "GradientListCell.h"
#import "GradientObj.h"

static NSString * const cellID = @"cellID";

@interface GradientListController ()
@property (nonatomic, strong) NSMutableArray<GradientObj *> *list;
@end

@implementation GradientListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.tableView registerClass:[GradientListCell class] forCellReuseIdentifier:cellID];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GradientListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.mod = self.list[indexPath.row];
    return cell;
}




- (NSMutableArray<GradientObj *> *)list {
    if (_list == nil) {
        _list = [NSMutableArray array];
        
        int m = 0, n = 0;
        for (int i = 0; i < 100; i ++) {
            if (isNum(i)) {
                m++;
                GradientObj *obj = [GradientObj new];
                obj.text = [NSString stringWithFormat:@"海绵宝宝红绿————————————长的%d号", m];
                obj.colors = @[UIColor.redColor, UIColor.greenColor];
                [_list addObject:obj];
            } else {
                n++;
                GradientObj *obj = [GradientObj new];
                obj.text = [NSString stringWithFormat:@"海绵宝宝粉黄%d号", n];
                obj.colors = @[UIColor.magentaColor, UIColor.yellowColor];
                [_list addObject:obj];
            }
        }
    }
    return _list;
}


BOOL isNum(int num) {
    for (int i = 2; i < num; i++) {
        if (num % i == 0) {
            return YES;
        }
    }
    return NO;
}


@end
