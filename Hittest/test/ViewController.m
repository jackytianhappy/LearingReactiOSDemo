//
//  ViewController.m
//  test
//
//  Created by Jacky on 16/11/9.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "view1.h"
#import "view2.h"

@interface ViewController ()

@property (nonatomic,strong) view1 *view1;
@property (nonatomic,strong) view2 *view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view1 = [[view1 alloc]initWithFrame:self.view.frame];
    
    //[self.view1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewOneAction)]];
    
    self.view2 = [[view2 alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.view2.backgroundColor =[UIColor redColor];
    
    //[self.view2 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTwoAction)]];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    
}

-(void)viewOneAction{
    NSLog(@"111111111111111111");
}
-(void)viewTwoAction{
    NSLog(@"222222222222222222");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
