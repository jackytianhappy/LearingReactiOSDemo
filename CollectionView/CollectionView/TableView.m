//
//  TableView.m
//  CollectionView
//
//  Created by Jacky on 16/8/17.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "TableView.h"

@interface TableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;

@end


@implementation TableView

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _myTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_myTableView];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name"];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


@end
