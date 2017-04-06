//
//  ViewController.m
//  test
//
//  Created by Jacky on 2017/4/6.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


__weak NSString *string_weak = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //场景1
//    NSString *string = [NSString stringWithFormat:@"%@",@"Jacky_TestAutoReleaePool"];
//    string_weak = string;
    
//    //场景2
//    @autoreleasepool {
//        NSString *string = [NSString stringWithFormat:@"Jacky_TestAutoReleaePool"];
//        string_weak = string;
//    }
    
    // 场景 3
    NSString *string = nil;
    @autoreleasepool {
        string = [NSString stringWithFormat:@"Jacky_TestAutoReleaePool"];
        string_weak = string;
    }
    
    NSLog(@"string:%@",string_weak);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    NSLog(@"string:%@",string_weak);
};

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    NSLog(@"string:%@",string_weak);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
