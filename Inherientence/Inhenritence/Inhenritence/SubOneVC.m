//
//  SubOneVC.m
//  Inhenritence
//
//  Created by Jacky on 2017/2/7.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "SubOneVC.h"

@interface SubOneVC ()

@end

@implementation SubOneVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    
    NSLog(@"%d",numInH);
    NSLog(@"%d",isRight);
    NSLog(@"%@",memberOneInH);
    NSLog(@"%@",self.nameOneInH);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
