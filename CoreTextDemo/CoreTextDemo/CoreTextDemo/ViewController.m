//
//  ViewController.m
//  CoreTextDemo
//
//  Created by Jacky on 16/10/26.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>


@interface ViewController ()

@property (nonatomic,strong) UILabel *testLbl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _testLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 300, 40)];
    [self.view addSubview:self.testLbl];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:@"这里是一条测试数据,希望这条数据尽可能的长吧，这样我们能够进行充分的展示"];
    //设置字体大小
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 3)];
    //设置字体颜色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 1)];
    //设置字体背景颜色
    [attrString addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5, 1)];
    //在第一个字后面插入图片
    NSString *imageName = @"test.png";
    NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[[NSImage imageNamed:imageName] TIFFRepresentation]];
    imageFileWrapper.filename = imageName;
    imageFileWrapper.preferredFilename = imageName;
    
    NSTextAttachment *imageAttachment = [[[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper] autorelease];
    NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    [attributedString insertAttributedString:imageAttributedString atIndex:1];
    
    
    self.testLbl.attributedText = attrString;
    
//    NSString *name = @"12";
//    
//    @autoreleasepool {
//        NSString *tmp  = @"1234";
//        name = [tmp copy];
//        NSLog(@"%@",tmp);
//    }
//    
//    NSLog(@"%@",@"234");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
