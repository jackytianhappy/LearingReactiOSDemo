//
//  MainTableViewDataSource.h
//  MVVMTest
//
//  Created by Jacky on 16/11/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataSourceArr;

@end
