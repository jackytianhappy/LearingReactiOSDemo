//
//  MainViewCell.h
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainCellModel;

@interface MainViewCell : UITableViewCell

-(instancetype)initWithMainCellMode:(MainCellModel *)mainCellModel;

@end
