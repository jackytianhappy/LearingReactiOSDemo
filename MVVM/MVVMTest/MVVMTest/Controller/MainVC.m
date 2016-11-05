//
//  MainVC.m
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainVC.h"
@interface MainVC (){
    
}

@property (nonatomic,strong) UITableView *tableview;


@end

@implementation MainVC
#pragma mark -VC life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


#pragma mark -UI
-(void)initUI{
    
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
