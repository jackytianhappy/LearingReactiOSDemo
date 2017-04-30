//
//  ARCVC.m
//  MemoryDemo
//
//  Created by Jacky on 2017/4/30.
//  Copyright © 2017年 jacky. All rights reserved.
//


//主要进行释放时机的判断
#import "ARCVC.h"

@interface ARCVC ()

@end

@implementation ARCVC
__weak id reference = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    //Attention 这里的字符串要尽量的长 你可以把她换成jacky试试看，原因是因为苹果引入了TaggedPoiner来节省内存
    NSString *str = [NSString stringWithFormat:@"safsadfsdfsfsafsfsafsdfsdfdsfsfsfsdfs"];
    
    // str是一个autorelease对象，设置一个weak的引用来观察它
    reference = str;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", reference); // Console: safsadfsdfsfsafsfsafsdfsdfdsfsfsfsdfs
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", reference); // Console: (null)
}

@end
