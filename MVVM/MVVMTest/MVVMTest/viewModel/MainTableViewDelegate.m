//
//  MainTableViewDelegate.m
//  MVVMTest
//
//  Created by Jacky on 16/11/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainTableViewDelegate.h"

@implementation MainTableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你选择了我");
    if (self.mainCellSelectAction) {
        self.mainCellSelectAction(indexPath,@"jacky test");
    }
}

@end
