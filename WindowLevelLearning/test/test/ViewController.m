//
//  ViewController.m
//  test
//
//  Created by Jacky on 16/11/14.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "AFURLRequestSerialization.h"


NSString * get(NSString *time){
    NSLog(@"asdf");
    return @"name";
}


@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIWindow *myWindow;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSArray *array = AFQueryStringFromParameters(@{@"sex":@"male",
//                                                   @"name":@"male",
//                                                   @"time":@"2015"});
//    
//    NSLog(@"测试时间：%@",get(@"sadf"));
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(createNewWin)]];
    [self.view addSubview:view];
    
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pinch)]];
    
}

-(void)swip{
    NSLog(@"执行了滑动");
}


-(void)pinch{
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor purpleColor];
}




-(void)createNewWin{
    NSLog(@"134");
    _myWindow = [[UIWindow alloc]initWithFrame:CGRectMake(100, 300, 100, 200)];
    _myWindow.windowLevel = UIWindowLevelAlert;
    _myWindow.backgroundColor = [UIColor blackColor];
    _myWindow.hidden = NO;
    [_myWindow makeKeyAndVisible];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
