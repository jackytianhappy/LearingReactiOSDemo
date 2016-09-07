//
//  ViewController.m
//  DelegateDemo
//
//  Created by Jacky on 16/9/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "DelegateView.h"

@interface ViewController ()<TouchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DelegateView *view = [[DelegateView alloc]initWithFrame:self.view.frame];
    view.delegate = self;
    [self.view addSubview:view];
}

-(void)redBtnAction{
    NSLog(@"sdfsdf");
}

-(void)blueBtnAction{
    NSLog(@"123123123");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -lazy load

@end
