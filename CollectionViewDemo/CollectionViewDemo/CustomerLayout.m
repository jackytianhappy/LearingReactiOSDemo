//
//  CustomerLayout.m
//  CollectionViewDemo
//
//  Created by admin on 16/12/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "CustomerLayout.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
// 每行显示几个cell
#define kNumItems 4

@interface CustomerLayout ()
@property (nonatomic, strong) NSDictionary *layoutInformation;
@property (nonatomic, assign) NSInteger maxNumRows;
@property (nonatomic, assign) UIEdgeInsets insets;


@property (nonatomic, strong) NSMutableArray *layoutInfoArr;
// 所有的记录数
@property (nonatomic, assign) NSInteger totalItems;

@end


@implementation CustomerLayout

- (id)init
{
    self = [super init];
    if (self) {
        self.insets = UIEdgeInsetsMake(20, 20, 20, 20);
        self.interitemSpacing = 10;
        self.lineSpacing = 20;
        NSInteger sizeWidth = ((kWidth - 40) - kNumItems * 3)/kNumItems;
        self.itemSize = CGSizeMake(sizeWidth, 200);
        self.totalItems = 0;
    }
    return self;
}

- (void) prepareLayout
{
    [super prepareLayout];
    
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    NSInteger maxNumberOfItems = 0;
    
    //获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:attributes];
        }
        
        self.totalItems += numberOfItems;

        if(maxNumberOfItems < numberOfItems){
            maxNumberOfItems = numberOfItems;
        }
        //添加到数组
        [layoutInfoArr addObject:[subArr copy]];
    }
    //存储布局信息
    self.layoutInfoArr = [layoutInfoArr copy];
    //保存内容尺寸
    self.contentSize = CGSizeMake(kWidth, (_totalItems/kNumItems + 1) * (self.itemSize.height+self.lineSpacing)+self.lineSpacing);
    
}


- (CGSize) collectionViewContentSize
{
    return _contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = CGRectMake((self.itemSize.width+self.interitemSpacing)*(indexPath.row%kNumItems)+self.interitemSpacing, (self.itemSize.height+self.lineSpacing)*(indexPath.row/kNumItems)+self.lineSpacing, self.itemSize.width, self.itemSize.height);
    
    if (indexPath.row == 0) {
        attributes.transform3D = CATransform3DMakeScale(0.8, 0.8, 0.8);
//        attributes.center = CGPointMake(attributes.center.x, attributes.center.y - 20);
    }else{
        attributes.transform3D = CATransform3DMakeScale(1, 1, 1);
    }
    
    NSLog(@"attributes.frame = %@",NSStringFromCGRect(attributes.frame));
    return attributes;
}


- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
    
    for (NSArray *attibuteArray in _layoutInfoArr) {
        for (UICollectionViewLayoutAttributes *attributes in attibuteArray) {
            if (CGRectIntersectsRect(attributes.frame, rect)) {
                [layoutAttributesArr addObject:attributes];
            }
        }
    }
    return layoutAttributesArr;
}

@end
