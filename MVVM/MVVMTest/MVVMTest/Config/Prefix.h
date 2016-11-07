//
//  Prefix.h
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#ifndef Prefix_h
#define Prefix_h

#define kScreenFrame  [UIScreen mainScreen].bounds
#define kScreenSize  [UIScreen mainScreen].bounds.size


#ifdef DEBUG
#define SHLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define SHLog(format, ...)
#endif



#endif /* Prefix_h */
