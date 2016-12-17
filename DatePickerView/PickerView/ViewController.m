//
//  ViewController.m
//  PickerView
//
//  Created by Jacky on 2016/12/16.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "JCalendar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JCalendar *calendat = [[JCalendar alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300)];
    calendat.backgroundColor = [UIColor redColor];
    [self.view addSubview:calendat];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
