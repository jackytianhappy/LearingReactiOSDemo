//
//  HittestBtn.m
//  test
//
//  Created by Jacky on 16/11/10.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "HittestBtn.h"

@interface HittestBtn()

@end

@implementation HittestBtn

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    return CGRectContainsPoint([self HitTestBounds:self.bounds realWidth:200 realHeight:200], point);
}

-(CGRect)HitTestBounds:(CGRect)btnBounds realWidth:(CGFloat)realWidth realHeight:(CGFloat)realHeight{
    CGRect hitViewBounds = btnBounds;
    if (btnBounds.size.width < realWidth) {
        hitViewBounds.size.width = realWidth;
        hitViewBounds.origin.x -= (realWidth - btnBounds.size.width)/2;
    }
    if (btnBounds.size.height < realHeight) {
        hitViewBounds.size.height = realHeight;
        hitViewBounds.origin.y -= (realHeight - btnBounds.size.height)/2;
    }
    return hitViewBounds;
    
}

//CRect HitTestingBounds(CGRect bounds, CGFloat minimumHitTestWidth, CGFloat minimumHitTestHeight) {
//    CGRect hitTestingBounds = bounds;
//    if (minimumHitTestWidth > bounds.size.width) {
//        hitTestingBounds.size.width = minimumHitTestWidth;
//        hitTestingBounds.origin.x -= (hitTestingBounds.size.width - bounds.size.width)/2;
//    }
//    if (minimumHitTestHeight > bounds.size.height) {
//        hitTestingBounds.size.height = minimumHitTestHeight;
//        hitTestingBounds.origin.y -= (hitTestingBounds.size.height - bounds.size.height)/2;
//    }
//    return hitTestingBounds;
//}


@end
