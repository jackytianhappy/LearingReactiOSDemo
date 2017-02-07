//
//  BaseVC.h
//  Inhenritence
//
//  Created by Jacky on 2017/2/7.
//  Copyright © 2017年 jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController<UIAlertViewDelegate>{
    NSString *memberOneInH;
    
    int numInH;
    BOOL isRight;
}

@property (nonatomic,strong) NSString *nameOneInH;

@property (nonatomic,strong) UIAlertView *myAlertView;

- (void)doSomething;
- (void)doSomethingOne;

@end
