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
    NSURL *url = [NSURL URLWithString:@"http://home.focus.cn/decoration/works/53654a751f7ce9b57dffc66628029c73.html?anchorId=designList.1.0"];
    
//    NSURL *url = [NSURL URLWithString:@"http://focus.com.cn/"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //可以争正确执行的js
//    NSString *js = @"function show(a) {var arr = document.getElementsByTagName('script'); for(var i in arr){if(arr[i].innerHTML == 'wx'){ return 123;}}}";

    //可以正确却道wxconfig值
//    NSString *js = @"function shoTitle(a) {var arr = document.getElementsByTagName('script'); for(var i in arr){if(arr[i].innerHTML.indexOf('wx.onMenuShareAppMessage') > 0){                      return arr[i].innerHTML;}}}";
    
    
    NSString *js = @"function shoTitle(a) {var arr = document.getElementsByTagName('script'); for(var i in arr){if(arr[i].innerHTML.indexOf('wx.onMenuShareAppMessage') > 0){                      return arr[i].innerHTML;}}}";
    
    [context evaluateScript:js];
    
    JSValue *n = [context[@"show"] callWithArguments:@[@1]];
    
    NSLog(@"---%@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", [n toString]);//---5
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
