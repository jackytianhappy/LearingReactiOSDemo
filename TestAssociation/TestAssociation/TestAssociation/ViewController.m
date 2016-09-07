//
//  ViewController.m
//  TestAssociation
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *TestBtn;
@property (strong, nonatomic) IBOutlet UIButton *TestBtn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.TestBtn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    
    [self.TestBtn2 addTarget:self action:@selector(showAlert2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    NSString *temp = objc_getAssociatedObject(alertView, @"TestAssociation");
    if ([temp isEqualToString:@"1"]) {
        NSLog(@"这里是第1个");
    }else{
        NSLog(@"这里是第2个");
    }

}

-(void)showAlert2{
    NSString *falg = @"1";
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"测试" message:@"测试association" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    
    
    objc_setAssociatedObject(view, @"TestAssociation", falg, OBJC_ASSOCIATION_COPY);
    
    
    [view show];

}

-(void)showAlert{
/**
 *  iOS 8.0之前才用的alertView
 */
    NSString *falg = @"2";
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"测试" message:@"测试association" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];

     objc_setAssociatedObject(view, @"TestAssociation", falg, OBJC_ASSOCIATION_COPY);
    
    [view show];
    
    
    
/**
 *  iOS 8.0之后才用的alertViewController
 */
//    UIAlertController *view = [UIAlertController alertControllerWithTitle:@"测试" message:@"测试association" preferredStyle:UIAlertControllerStyleAlert];
//    [view addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"输出确定按钮");
//    } ]];
//    [view addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"输出现在的取消");
//        [view removeFromParentViewController];
//    }]];
//    
//    [self presentViewController:view animated:YES completion:nil];
//    //[self.navigationController pushViewController:view animated:YES];
}

@end
