//
//  DelegateView.m
//  DelegateDemo
//
//  Created by Jacky on 16/9/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "DelegateView.h"

@interface DelegateView()
@property (nonatomic,strong) UIButton *redBtn;
@property (nonatomic,strong) UIButton *blueBtn;
@end

@implementation DelegateView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self.redBtn addTarget:self action:@selector(redAction) forControlEvents:UIControlEventTouchUpInside];
    [self.blueBtn addTarget:self action:@selector(blueAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)redAction{
    if (_delegate && [_delegate respondsToSelector:@selector(redBtnAction)]) {
        [_delegate redBtnAction];
    }
}
-(void)blueAction{
    if (_delegate && [_delegate respondsToSelector:@selector(blueBtnAction)]) {
        [_delegate blueBtnAction];
    }
}


#pragma mark -init Btn 
-(UIButton *)redBtn{
    if (_redBtn == nil) {
        _redBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
        [self addSubview:_redBtn];
        _redBtn.backgroundColor = [UIColor redColor];
    }
    return _redBtn;
}

-(UIButton *)blueBtn{
    if (_blueBtn == nil) {
        _blueBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
        [self addSubview:_blueBtn];
        _blueBtn.backgroundColor = [UIColor blueColor];
    }
    return _blueBtn;
}

@end
