//
//  CustomerLayout.h
//  CollectionViewDemo
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerLayout : UICollectionViewLayout
// 显示Item的contentSize
@property (nonatomic, assign) CGSize contentSize;
// 每个item之间的间距
@property (nonatomic, assign) CGFloat interitemSpacing;
// 每个section之间的间距
@property (nonatomic, assign) CGFloat lineSpacing;
// Itemd的大小
@property (nonatomic, assign) CGSize itemSize;


@end
