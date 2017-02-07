//
//  ViewController.m
//  Inhenritence
//
//  Created by Jacky on 2017/2/7.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "SubOneVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToAnotherOne)]];
    
}

- (void)jumpToAnotherOne{
    SubOneVC *subOne = [[SubOneVC alloc]init];
    
    [self presentViewController:subOne animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
