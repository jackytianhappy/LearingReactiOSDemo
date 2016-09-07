//
//  DelegateView.h
//  DelegateDemo
//
//  Created by Jacky on 16/9/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchDelegate <NSObject>

@required
-(void)blueBtnAction;

@optional
-(void)redBtnAction;

@end

@interface DelegateView : UIView

@property (nonatomic,assign) id<TouchDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame;

@end
