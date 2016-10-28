//
//  UIViewController+Track.m
//  MethodSwizzing
//
//  Created by Jacky on 16/10/28.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "UIViewController+Track.h"
#import <objc/runtime.h>

@implementation UIViewController (Track)
- (void)addBackButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = item;
    
    [self.view setBackgroundColor: [UIColor redColor]];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        swizzleMethod(class, @selector(viewDidLoad), @selector(kg_viewDidLoad));
    });
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)kg_viewDidLoad
{
    [self kg_viewDidLoad];
    [self addBackButton];
}
@end

