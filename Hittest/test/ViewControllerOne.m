//
//  ViewControllerOne.m
//  test
//
//  Created by Jacky on 16/11/10.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewControllerOne.h"
#import "FatherView.h"

@interface ViewControllerOne ()

@property (nonatomic,strong) UIScrollView  *scrollView;

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    FatherView *view = [[FatherView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.width/3)];
    [self.view addSubview:view];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
