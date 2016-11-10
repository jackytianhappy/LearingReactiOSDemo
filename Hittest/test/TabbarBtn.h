//
//  TabbarBtn.h
//  Live
//
//  Created by Jacky on 16/11/9.
//  Copyright © 2016年 sohu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenSize [UIScreen mainScreen].bounds.size

@interface TabbarBtn : UIView
//liveListBtn Aciton
@property (nonatomic,copy) void (^liveListClick)();

//mineBtn Action
@property (nonatomic,copy) void (^mineClick)();

//more Action
@property (nonatomic,copy) void (^moreClick)();

//initial action
-(instancetype)initWithFrame:(CGRect)frame;




@end
