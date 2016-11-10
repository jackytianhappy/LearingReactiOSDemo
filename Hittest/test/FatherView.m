//
//  FatherView.m
//  test
//
//  Created by Jacky on 16/11/10.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "FatherView.h"

@interface FatherView()

@property (nonatomic,strong) UIScrollView  *scrollView;

@end

@implementation FatherView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(90, 20, frame.size.width - 180,  frame.size.width/3)];
        [self addSubview:self.scrollView];
        
        UIImageView *iamge0 = [[UIImageView alloc]initWithFrame:CGRectMake(0*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        iamge0.backgroundColor = [UIColor yellowColor];
        [self.scrollView addSubview:iamge0];
        
        UIImageView *iamge1 = [[UIImageView alloc]initWithFrame:CGRectMake(1*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        iamge1.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:iamge1];
        
        UIImageView *iamge2 = [[UIImageView alloc]initWithFrame:CGRectMake(2*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        iamge2.backgroundColor = [UIColor orangeColor];
        [self.scrollView addSubview:iamge2];
        
        UIImageView *iamge3 = [[UIImageView alloc]initWithFrame:CGRectMake(3*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height)];
        iamge3.backgroundColor = [UIColor blueColor];
        [self.scrollView addSubview:iamge3];
        
        self.scrollView.contentSize = CGSizeMake(4*self.scrollView.bounds.size.width,self.scrollView.bounds.size.height );
        self.scrollView.pagingEnabled = YES;
        
        self.scrollView.clipsToBounds = NO;
    }
    return self;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (hitTestView) {
        hitTestView = self.scrollView;
    }
    return hitTestView;
}

@end
