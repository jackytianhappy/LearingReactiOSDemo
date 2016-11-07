//
//  MainVC.m
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainVC.h"
#import "MainTableViewDataSource.h"
#import "MainTableViewDelegate.h"
#import "MJRefresh.h"

@interface MainVC (){
    MainTableViewDataSource *tableViewDataSource;
    MainTableViewDelegate   *tableViewDelegate;
}

@property (nonatomic,strong) UITableView *tableview;


@end

@implementation MainVC
#pragma mark -VC life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
    [self initUI];
    
    [self initUIAction];
}

#pragma mark -Init Data
#pragma mark -Data
-(void)initData{
    tableViewDataSource = [[MainTableViewDataSource alloc]init];
    tableViewDelegate = [[MainTableViewDelegate alloc]init];
}

#pragma mark -UI
-(void)initUI{
    tableViewDataSource.dataSourceArr = [[NSArray alloc]initWithObjects:@"123",@"234",@"1234", nil];
    
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    self.tableview.dataSource = tableViewDataSource;
    self.tableview.delegate = tableViewDelegate;
    self.tableview.rowHeight = 44;
    
    
}

#pragma mark -UIAction
-(void)initUIAction{
    tableViewDelegate.mainCellSelectAction = ^(NSIndexPath *indexPath,NSString *name){
        NSLog(@"输出现在的rowIndex：%ld",(long)indexPath.row);
        NSLog(@"name:%@",name);
    };
}

#pragma mark -talblview refresh
-(void)refresh{
    NSLog(@"开始刷新");
    [self.tableview.mj_header endRefreshing];
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
