//
//  ViewController.m
//  ChineseTOPinyin
//
//  Created by Jacky on 2017/2/8.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *image;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *chineseName = @"北京";
    NSLog(@"%@",[[self chineseTransformToPinyin:chineseName] stringByReplacingOccurrencesOfString:@" " withString:@""]);
    
    NSString *name = @"bei jing";
    NSLog(@"%@",[name stringByReplacingOccurrencesOfString:@" " withString:@""]);
    
    image = [[UIImageView alloc]init];
    image.frame = CGRectMake(50, 50, 200, 20);
    image.image = [UIImage imageNamed:@"460"];
    [self.view addSubview:image];
    
//    CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI);
//    image.transform = transform;//旋转
    
    
    
 
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rotation)]];
    
}

- (void)rotation{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 汉字转拼音
- (NSString *)chineseTransformToPinyin:(NSString *)chineseString
{
    NSMutableString *pinyin = [chineseString mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //返回最近结果
    return pinyin;
}

@end
