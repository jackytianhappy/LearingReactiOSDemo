//
//  FMDBSqlSet.m
//  MVVMTest
//
//  Created by Jacky on 16/11/7.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "FMDBCreateTableSqlSet.h"

@implementation FMDBCreateTableSqlSet

+(NSArray *)getAllCreateTableSqlInTheArray{
    return  @[
             @"create table if not exists t_versionInfo (version text)",//创建版本表 重要
             @"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY, name text NOT NULL, age integer NOT NULL,sex vachar(100),email varchar(100));"//穿件demo 表
             
             ];
}

@end
