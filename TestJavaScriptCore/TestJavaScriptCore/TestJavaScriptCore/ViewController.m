//
//  ViewController.m
//  TestJavaScriptCore
//
//  Created by Jacky on 16/9/24.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>{

    JSContext *context;
}

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:@"http://focus.com.cn/"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *js = @"function show(a) {var arr = document.getElementsByTagName('script'); for(var i in arr){if(arr[i].innerHTML != 'wx.'){ return 123;}}}";
    
    [context evaluateScript:js];
    
    JSValue *n = [context[@"show"] callWithArguments:@[@1]];
    
    NSLog(@"---%@", [n toString]);//---5
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
