//
//  ViewController.m
//  ConrnerRadius
//
//  Created by Jacky on 16/12/1.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;

@end

static NSString *tableViewCellIndetifier = @"myCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.myTableView];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIndetifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIndetifier];
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"1"]; //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale); //使用贝塞尔曲线画出一个圆形
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
    [imageView drawRect:imageView.bounds]; imageView.image = UIGraphicsGetImageFromCurrentImageContext(); //结束画图
    UIGraphicsEndImageContext();
    
//    很卡
//    imageView.layer.cornerRadius = 5;
//    imageView.layer.masksToBounds = YES;
//    imageView.image = [UIImage imageNamed:@"1"];
    
    
    [cell addSubview:imageView];
    
    
    return cell;
    
}





#pragma mark - lazy load
-(UITableView*)myTableView{
    if (_myTableView == nil) {
        _myTableView =[[UITableView alloc]init];
        _myTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}


@end
