//
//  ViewController.m
//  test
//
//  Created by Jacky on 16/11/9.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataSource;
}

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource =  [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        [dataSource addObject:@"i"];
    }
    
    
    

    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"草,数据源了");
    return  dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"计算我了");
    return 200;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"开始复制cell");
    static NSString *flag = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flag];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",dataSource[indexPath.row]];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -lazy load
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
