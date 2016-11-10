//
//  TabbarBtn.m
//  Live
//
//  Created by Jacky on 16/11/9.
//  Copyright © 2016年 sohu. All rights reserved.
//

#import "TabbarBtn.h"

@interface TabbarBtn()

@property (nonatomic,assign) CGRect globalFrame;

@property (nonatomic,strong) UIButton *LiveListBtn;
@property (nonatomic,strong) UIButton *MineBtn;
@property (nonatomic,strong) UIButton *moreBtn;

@end

@implementation TabbarBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.globalFrame = frame;
        [self.LiveListBtn setBackgroundColor:[UIColor yellowColor]];
        [self.LiveListBtn addTarget:self action:@selector(liveListAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.MineBtn setBackgroundColor:[UIColor redColor]];
        [self.MineBtn addTarget:self action:@selector(mineAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.moreBtn setBackgroundColor:[UIColor orangeColor]];
        [self.moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return self;
    return nil;
}

#pragma mark -Click Action
-(void)liveListAction{
    if (self.liveListClick) {
        self.liveListClick();
    }
}

-(void)mineAction{
    if (self.mineClick) {
        self.mineClick();
    }
}

-(void)moreBtnClick{
    if (self.moreClick) {
        self.moreClick();
    }
}


#pragma mark -lazy load
-(UIButton *)LiveListBtn{
    if (_LiveListBtn == nil) {
        _LiveListBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width/3, self.globalFrame.size.height)];
        [self addSubview:_LiveListBtn];
    }
    return _LiveListBtn;
}

-(UIButton *)MineBtn{
    if (_MineBtn == nil) {
        _MineBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenSize.width/3*2, 0, kScreenSize.width/3, self.globalFrame.size.height)];
        [self addSubview:_MineBtn];
    }
    return _MineBtn;
}


-(UIButton *)moreBtn{
    if (_moreBtn == nil) {
        _moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenSize.width/3, -20, kScreenSize.width/3, self.globalFrame.size.height +20)];
        [self addSubview:_moreBtn];
    }
    return _moreBtn;
}

@end
