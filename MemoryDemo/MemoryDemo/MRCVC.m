//
//  MRCVC.m
//  MemoryDemo
//
//  Created by Jacky on 2017/4/30.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "MRCVC.h"


@interface MRCVC ()

@property (nonatomic,retain) NSNumber *name;

@end

@implementation MRCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"alloc 后的引用计数:%lu",(unsigned long)[obj retainCount]);
    
    NSObject *obj1 = [NSObject new];
    NSLog(@"new 后的引用计数:%lu",(unsigned long)[obj1 retainCount]);
    
    NSObject *obj2 = [NSObject new];
    NSLog(@"new 后的引用计数:%lu",(unsigned long)[obj2 retainCount]);
    NSObject *objTOObj2 = [obj2 retain];
    NSLog(@"retain 后的引用计数:%lu",(unsigned long)[obj2 retainCount]);
    NSLog(@"retain 后的引用计数:%lu",(unsigned long)[objTOObj2 retainCount]);
    
    
    NSArray *obj3 = @[@"1234"];
    NSLog(@"new 后的引用计数:%lu",(unsigned long)[obj3 retainCount]);
    NSObject *objTOObj3 = [obj3 copy];
    NSLog(@"copy 后的引用计数:%lu",(unsigned long)[obj3 retainCount]);
    NSLog(@"copy 后的引用计数:%lu",(unsigned long)[objTOObj3 retainCount]);
    
    
    NSArray *obj4 = [[NSArray alloc]init];
    NSLog(@"new 后的引用计数:%lu",(unsigned long)[obj4 retainCount]);
    NSObject *objTOObj4 = [obj4 copy];
    NSLog(@"copy 后的引用计数:%lu",(unsigned long)[obj4 retainCount]);
    NSLog(@"copy 后的引用计数:%lu",(unsigned long)[objTOObj4 retainCount]);
    
    
    NSLog(@"name后的引用计数:%lu",(unsigned long)[self.name retainCount]);
    self.name = @1;
    NSLog(@"name后的引用计数:%lu",(unsigned long)[self.name retainCount]);
    
    NSString *str7 = [NSString stringWithFormat:@"1234567890"];
    NSLog(@"name后的引用计数:%lu",(unsigned long)[str7 retainCount]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setName:(NSNumber *)name{
    if (_name != name) {
        [_name release];
        _name = name;
        [_name retain];
    }
}

@end
