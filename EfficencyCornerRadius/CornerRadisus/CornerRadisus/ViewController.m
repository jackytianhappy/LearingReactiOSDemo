//
//  ViewController.m
//  CornerRadisus
//
//  Created by Jacky on 16/10/28.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "CornerRadiusView.h"
#import "YYFPSLabel.h"

static NSString *kCellName = @"testCell";


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;

@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.myTableView];
    
    
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [_fpsLabel sizeToFit];
    [self.view addSubview:_fpsLabel];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellName];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellName];
    }
//    CornerRadiusView *view = [[CornerRadiusView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) theImageName:@"name" AndTheRadius:10];
//    [cell addSubview:view];
    
    
//    dispatch_async(dispatch_queue_create("com.starming.serialqueue", DISPATCH_QUEUE_SERIAL), ^{
//        CornerRadiusView *view = [[CornerRadiusView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) theImageName:@"name" AndTheRadius:10];
//        [cell addSubview:view];
//    });
    
    
    
    
//    CornerRadiusView *view1 = [[CornerRadiusView alloc]initWithFrame:CGRectMake(110, 0, 100, 100) theImageName:@"name" AndTheRadius:10];
//    [cell addSubview:view1];
//    
//    CornerRadiusView *view2 = [[CornerRadiusView alloc]initWithFrame:CGRectMake(220, 0, 100, 100) theImageName:@"name" AndTheRadius:10];
//    [cell addSubview:view2];
    
    
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.layer.cornerRadius = 10;
    view.image = [UIImage imageNamed:@"name"];
    view.layer.masksToBounds = YES;
    [cell addSubview:view];

//    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(110, 0, 100, 100)];
//    view1.layer.cornerRadius = 10;
//    view1.image = [UIImage imageNamed:@"name"];
//    view1.layer.masksToBounds = YES;
//    [cell addSubview:view1];
//    
//    UIImageView *view2 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 0, 100, 100)];
//    view2.layer.cornerRadius = 10;
//    view2.image = [UIImage imageNamed:@"name"];
//    view2.layer.masksToBounds = YES;
//    [cell addSubview:view2];
    
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableView*)myTableView{
    if (_myTableView == nil) {
        _myTableView =[[UITableView alloc]initWithFrame:self.view.frame];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.rowHeight = 100;
    }
    return _myTableView;
}


@end
