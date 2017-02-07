//
//  BaseVC.m
//  Inhenritence
//
//  Created by Jacky on 2017/2/7.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC (){
    NSString *memberOneInM;
}

@property (nonatomic,strong) NSString *nameOneInM;

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
}


- (void)initData{
    numInH = 0;
    isRight = YES;
    memberOneInH = @"成员变量在头文件里";
    self.nameOneInH = @"name在头文件里";
    
    memberOneInM = @"成员变量在内部";
    self.nameOneInM = @"name在内部";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
