//
//  LaunchVC.m
//  testName
//
//  Created by Jacky on 16/8/29.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "LaunchVC.h"

@interface LaunchVC ()

@end

@implementation LaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"点哦我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)test{
    UITabBarController *tb = [[UITabBarController alloc]init];
    //设置UIWindow的rootViewController为UITabBarController
    
    //创建相应的子控制器
    UINavigationController *vc1 = [[UINavigationController alloc]init];
    vc1.view.backgroundColor = [UIColor greenColor];
    vc1.title = @"首页";
    vc1.tabBarItem.title = @"首页";
    vc1.tabBarItem.image = [[UIImage imageNamed:@"Home_normal"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor blueColor];
    vc2.tabBarItem.title = @"分类";
    vc2.tabBarItem.image = [[UIImage imageNamed:@"List_normal"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"List_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255.0/255 green:73.0/255 blue:87.0/255 alpha:1.0],NSForegroundColorAttributeName, [UIFont systemFontOfSize:10.0],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    //把子控制器添加到UITabBarController
    //[tb addChildViewController:c1];
    //[tb addChildViewController:c2];
    //或者
    tb.viewControllers = @[vc1,vc2];
    
    [self presentViewController:tb animated:YES completion:nil];
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
