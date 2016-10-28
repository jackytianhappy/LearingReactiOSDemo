//
//  ViewController.m
//  CoreTextDemo
//
//  Created by Jacky on 16/10/26.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "CoreTextView.h"


@interface ViewController ()

@property (nonatomic,strong) UILabel *testLbl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _testLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 300, 40)];
//    [self.view addSubview:self.testLbl];
//    
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:@"这里是一条测试数据,希望这条数据尽可能的长吧，这样我们能够进行充分的展示"];
//    //设置字体大小
//    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 3)];
//    //设置字体颜色
//    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 1)];
//    //设置字体背景颜色
//    [attrString addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5, 1)];
//    //在第一个字后面插入图片
//    NSString *imageName = @"test.png";
//   
//    self.testLbl.attributedText = attrString;
   //＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊华丽的分割线
    
    
//    CoreTextView *view = [[CoreTextView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
