//
//  ViewController.m
//  EasyUseCalendar
//
//  Created by Jacky on 2017/1/5.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "JCalendar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JCalendar *calendar = [[JCalendar alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:calendar];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
