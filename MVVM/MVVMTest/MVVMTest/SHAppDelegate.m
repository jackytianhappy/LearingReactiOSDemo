//
//  AppDelegate.m
//  MVVMTest
//
//  Created by Jacky on 16/11/5.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "SHAppDelegate.h"
#import "MainVC.h"

@interface SHAppDelegate ()

@end

@implementation SHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:kScreenFrame];
    MainVC *mainVC = [[MainVC alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    nav.navigationBar.barTintColor=[UIColor colorWithRed:0.22f green:0.50f blue:0.78f alpha:1.00f];
    nav.navigationBar.tintColor=[UIColor whiteColor];
    nav.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    nav.title = @"首页";
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
