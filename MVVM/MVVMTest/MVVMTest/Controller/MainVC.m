//
//  MainVC.m
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainVC.h"
#import "MainTableViewDataSource.h"

@interface MainVC (){
    MainTableViewDataSource *dataSource;
}

@property (nonatomic,strong) UITableView *tableview;


@end

@implementation MainVC
#pragma mark -VC life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [[MainTableViewDataSource alloc]init];
    
    
    [self initUI];
}


#pragma mark -UI
-(void)initUI{
    dataSource.dataSourceArr = [[NSArray alloc]initWithObjects:@"123",@"234",@"1234", nil];
    
    self.tableview.dataSource = dataSource;
    self.tableview.rowHeight = 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - lazy load
-(UITableView *)tableview{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height)];
        [self.view addSubview:_tableview];
    }
    return _tableview;
}



@end
