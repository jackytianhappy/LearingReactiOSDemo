//
//  MainViewCell.m
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "MainViewCell.h"
#import "MainCellModel.h"

@interface MainViewCell()

@property (nonatomic,strong) UILabel *showLbl;

@end

@implementation MainViewCell

-(instancetype)initWithMainCellMode:(MainCellModel *)mainCellModel{
    if (self = [super init]) {
        self.showLbl.text = mainCellModel.title;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark -lazy load
-(UILabel *)showLbl{
    if (_showLbl == nil) {
        _showLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 44)];
        _showLbl.textColor = [UIColor blackColor];
        [self addSubview:_showLbl];
    }
    return _showLbl;
}

@end
