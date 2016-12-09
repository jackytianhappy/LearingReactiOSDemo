
/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 View controller that sets up the table view and serves as the table view's data source and delegate.
 */

#import "APLViewController.h"

@interface APLViewController ()

@property (nonatomic, strong) NSMutableArray *timeZoneNames;
@property (nonatomic, strong) UIButton *editBtn;

@end

@implementation APLViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  Build Model
    NSArray *timeZones = [NSTimeZone knownTimeZoneNames];
    self.timeZoneNames = [NSMutableArray arrayWithArray:[timeZones sortedArrayUsingSelector:@selector(localizedStandardCompare:)]];
        
    self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake(0, 0, 60, 60);
    [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_editBtn addTarget:self action:@selector(editTableViewAction:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item  = [[UIBarButtonItem alloc] initWithCustomView:_editBtn];
    self.navigationItem.rightBarButtonItem = item;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/*
 There's no need to implement numberOfSectionsInTableView: because there's only one section and the method defaults to returning 1.
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
	return self.timeZoneNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *MyIdentifier = @"MyIdentifier";

	/*
     Retrieve a cell with the given identifier from the table view.
     The cell is defined in the main storyboard: its identifier is MyIdentifier, and  its selection style is set to None.
     */
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

	// Set up the cell.
	NSString *timeZoneName = self.timeZoneNames[indexPath.row];
	cell.textLabel.text = timeZoneName;

	return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Header";
}


#pragma mark - Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.selected = YES;
}

#pragma mark - 编辑TableView
// 指定哪些行可以编辑
- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 指定行的编辑的样式
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleDelete;
    }else if(indexPath.row == 1){
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    }
}
// 完成编辑，此时要先先完成数据源，在完成UI
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [tableView beginUpdates];
        [_timeZoneNames addObject:[_timeZoneNames firstObject]];
        NSArray *array = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
        [tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }else if (editingStyle == UITableViewCellEditingStyleDelete){
        [tableView beginUpdates];
        [_timeZoneNames removeObjectAtIndex:0];
        NSArray *array = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
        [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }else{
        
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
// 左滑Cell时显示的Action
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewRowAction* deleteAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除"  handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath1) {
            NSLog(@"删除行===action1 = %@",action);
            [tableView beginUpdates];
            [_timeZoneNames removeObjectAtIndex:0];
            NSArray *array = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
            [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
        }];
        deleteAction1.backgroundColor = [UIColor redColor];
        
        UITableViewRowAction* deleteAction2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"关注"  handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath1) {
            NSLog(@"关注行===action2 = %@",action);
        }];
        deleteAction2.backgroundColor = [UIColor grayColor];
        
        return @[deleteAction1,deleteAction2];
    }else{
        return nil;
    }
}

// 点击编辑，开始编辑tableView
- (void) editTableViewAction:(UIButton *)button
{
    if ([button.titleLabel.text isEqualToString:@"编辑"]) {
        [button setTitle:@"完成" forState:UIControlStateNormal];
        self.tableView.editing = YES;
//        self.tableView.allowsMultipleSelectionDuringEditing = YES;
    }else{
        [button setTitle:@"编辑" forState:UIControlStateNormal];
//        self.tableView.allowsMultipleSelectionDuringEditing = NO;
        self.tableView.editing = NO;
    }
}



#pragma mark - 移动TableView row 
// 哪些行可以移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 10) {
        return YES;
    }else{
        return NO;
    }
}
// 完成移动
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSTimeZone *timeZone = [_timeZoneNames objectAtIndex:sourceIndexPath.row];
    [_timeZoneNames removeObjectAtIndex:sourceIndexPath.row];
    [_timeZoneNames insertObject:timeZone atIndex:destinationIndexPath.row];
    
    [tableView reloadData];
}

@end
