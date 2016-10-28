//
//  CornerRadiusView.m
//  CornerRadisus
//
//  Created by Jacky on 16/10/28.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "CornerRadiusView.h"


#define QJGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define QJMainQueue dispatch_get_main_queue()


@implementation CornerRadiusView

-(instancetype)initWithFrame:(CGRect)frame theImageName:(NSString *)name AndTheRadius:(CGFloat)radius{
    if(self = [super initWithFrame:frame]){
        UIImage *image = [UIImage imageNamed:name];
        
        UIGraphicsBeginImageContextWithOptions(frame.size, NO, 1.0);
        
        [[UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:10] addClip];
        
        [image drawInRect:frame];
        
        self.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
    }
    return self;
}
@end
