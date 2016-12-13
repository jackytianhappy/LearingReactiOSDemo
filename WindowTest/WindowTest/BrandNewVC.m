//
//  BrandNewVC.m
//  WindowTest
//
//  Created by Jacky on 2016/12/12.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "BrandNewVC.h"

@interface BrandNewVC (){
    UIWindow *myWindow;
}

@end

@implementation BrandNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor yellowColor];

    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    myWindow = [[UIWindow alloc]initWithFrame:CGRectMake(100, 100, 200, 400)];
    myWindow.windowLevel = UIWindowLevelAlert;
    
    NSArray *a = self.navigationController.viewControllers;
    
    myWindow.rootViewController = a[0];
    
    [myWindow makeKeyAndVisible];
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
