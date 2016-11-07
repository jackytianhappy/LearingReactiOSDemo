//
//  FMDBManager.h
//  MVVMTest
//
//  Created by Jacky on 16/11/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB/FMDB.h"

@interface FMDBManager : NSObject

//返回fmdb实例
+(FMDatabase *)sharedDatabase;

//返回数据库路径
+(NSString *)getDBPath;

+(void)initDBWithTheVersion;

@end
