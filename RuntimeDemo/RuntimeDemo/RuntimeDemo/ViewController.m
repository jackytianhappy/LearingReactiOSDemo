//
//  ViewController.m
//  RuntimeDemo
//
//  Created by Jacky on 16/12/6.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

void (*setter)(id,SEL,BOOL);


@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Person *person = [[Person alloc]init];
    
}

-(void)test{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
