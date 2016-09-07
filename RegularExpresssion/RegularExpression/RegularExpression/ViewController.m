//
//  ViewController.m
//  RegularExpression
//
//  Created by Jacky on 16/8/31.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *testStr = @"asdfsad1142899950qq.comcomcomcocmmc";
    
    NSRegularExpression *Regu =[NSRegularExpression regularExpressionWithPattern:@"" options:0 error:nil];
    NSInteger number = [Regu numberOfMatchesInString:testStr options:0 range:NSMakeRange(0,[testStr length])];
    NSRange range = [Regu rangeOfFirstMatchInString:testStr options:0 range:NSMakeRange(0,[testStr length])];
    NSLog(@"输出现在的%ld",(long)number);
    NSLog(@"输出现在的下标范围%lu",(unsigned long)range.location);
    NSLog(@"输出被选中的数组%@",[testStr substringWithRange:NSMakeRange(range.location, range.length)]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
