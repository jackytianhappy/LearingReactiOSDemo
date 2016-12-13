//
//  RootVC.m
//  WindowTest
//
//  Created by Jacky on 2016/12/12.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "RootVC.h"
#import "BrandNewVC.h"
#import "Masonry.h"


@interface RootVC ()

@property (nonatomic,strong) UIImageView *imageView;


@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView = [UIImageView new];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:@"4"];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
    
    self.imageView.backgroundColor = [UIColor purpleColor];
    

    
    NSLog(@"我开始被创建了");
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 200, 30)];
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [btn setTitle:@"测试悬浮window" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToAnother) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)jumpToAnother{
    
    BrandNewVC *vc = [[BrandNewVC alloc]init];
    
    NSLog(@" kaishi jinxing ");
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
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
