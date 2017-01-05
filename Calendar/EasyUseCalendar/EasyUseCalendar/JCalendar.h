//
//  SHFCalendar.h
//  PickerView
//
//  Created by Jacky on 2016/12/16.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCalendar : UIView

@property (nonatomic,strong) NSString *yearStr;
@property (nonatomic,strong) NSString *monthStr;
@property (nonatomic,strong) NSString *dayStr;
@property (nonatomic,strong) NSString *hourStr;
@property (nonatomic,strong) NSString *minStr;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)getCurrentTime;

@end
