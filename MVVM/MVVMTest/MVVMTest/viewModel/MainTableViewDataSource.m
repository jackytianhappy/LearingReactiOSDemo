//
//  MainTableViewDataSource.m
//  MVVMTest
//
//  Created by Jacky on 16/11/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainTableViewDataSource.h"
#import "MainViewCell.h"
#import "MainCellModel.h"

@implementation MainTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainCellModel *model = [[MainCellModel alloc]init];
    model.title = [NSString stringWithFormat:@"测试数据%ld",(long)indexPath.row];
    MainViewCell *cell = [[MainViewCell alloc]initWithMainCellMode:model];
    
    return cell;

}

@end
