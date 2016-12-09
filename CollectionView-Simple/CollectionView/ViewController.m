/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
The primary view controller for this app.
*/

#import "ViewController.h"
#import "DetailViewController.h"
#import "Cell.h"

NSString *kDetailedViewControllerID = @"DetailView";    // view controller storyboard id
NSString *kCellID = @"cellID";                          // UICollectionViewCell storyboard id

#define kWidth [UIScreen mainScreen].bounds.size.width

@implementation ViewController


#pragma mark - DataSource 代理方法
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
//    return 16;
    return _itemsArray.count;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
    cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
    
    // load the image for this cell
    NSString *imageToLoad = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0) {
        return nil;
    }else{
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            UICollectionReusableView *headerResuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderResuableView" forIndexPath:indexPath];
            headerResuableView.backgroundColor = [UIColor yellowColor];
            return headerResuableView;
        }else{
            UICollectionReusableView *footerResuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterResuableView" forIndexPath:indexPath];
            footerResuableView.backgroundColor = [UIColor cyanColor];
            return footerResuableView;
        }
    }
}

#pragma mark - FlowLayout Delegate
// 设置 Section Header
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(kWidth, 30);
}
// 设置 Section Footer
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kWidth, 60);
}
// 设置 Section Insets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - Managing the Visual State for Selections and Hightligths
- (void) collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor  cyanColor];
}

- (void) collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}


#pragma mark - Showing the Edit Menu for a Cell
- (BOOL) collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL) collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"]) {
//        return YES;
//    }else{
//        return NO;
//    }
    return YES;
}
// 菜单点击事件的响应
- (void) collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    NSLog(@"%@===",NSStringFromSelector(action));
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
        [_itemsArray addObject:@"17"];
        [collectionView reloadData];
    }
}

#pragma mark- CollectionView的移动
//
//- (BOOL) collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void) collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//    NSLog(@"sourceIndexPath = %ld",sourceIndexPath.row);
//    NSLog(@"destinationIndexPath = %ld",destinationIndexPath.row);
//    [collectionView reloadData];
//}

#pragma mark - Life Circle
- (void) viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.delaysTouchesBegan = YES;
    tapGesture.numberOfTapsRequired = 2;
    [self.collectionView addGestureRecognizer:tapGesture];
    
    [self initUI];
}

// 初始化
- (void) initUI
{
    //  使用之前需要进行注册
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderResuableView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterResuableView"];
    
    
    self.itemsArray = [NSMutableArray arrayWithCapacity:5];
    [_itemsArray addObject:@"1"];
    [_itemsArray addObject:@"2"];
    [_itemsArray addObject:@"3"];
    [_itemsArray addObject:@"4"];
    [_itemsArray addObject:@"5"];
    [_itemsArray addObject:@"6"];
    [_itemsArray addObject:@"7"];
    [_itemsArray addObject:@"8"];
    [_itemsArray addObject:@"9"];
    [_itemsArray addObject:@"10"];
    [_itemsArray addObject:@"11"];
    [_itemsArray addObject:@"12"];
    [_itemsArray addObject:@"13"];
    [_itemsArray addObject:@"14"];
    [_itemsArray addObject:@"15"];
    [_itemsArray addObject:@"16"];
        
}



// the user tapped a collection item, load and set the image on the detail view controller
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        
        // load the image, to prevent it from being cached we use 'initWithContentsOfFile'
        NSString *imageNameToLoad = [NSString stringWithFormat:@"%ld_full", (long)selectedIndexPath.row];
        UIImage *image = [UIImage imageNamed:imageNameToLoad];
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.image = image;
    }
}

@end
