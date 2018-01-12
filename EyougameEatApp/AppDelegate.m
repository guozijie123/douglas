//
//  AppDelegate.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "AppDelegate.h"
#import "ZJViewController.h"
#import "ZJNavViewController.h"
#import "ViewController.h"
#import "MenuViewController.h"
#import "SecondViewController.h"
#import <CYTabBar/CYTabBarController.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //a.初始化一个tabBar控制器
//    ZJViewController *tb=[[ZJViewController alloc]init];
    //设置控制器为Window的根控制器
    
    
    //b.创建子控制器
    MenuViewController *c1=[[MenuViewController alloc]init];
    ZJNavViewController * nav1 = [[ZJNavViewController alloc]initWithRootViewController:c1];
    c1.view.backgroundColor=[UIColor whiteColor];
    
    SecondViewController * c2 = [SecondViewController new];
    ZJNavViewController * nav2 = [[ZJNavViewController alloc]initWithRootViewController:c2];
    c2.view.backgroundColor=[UIColor whiteColor];
    
    
    
    CYTabBarController * tabbar = [[CYTabBarController alloc]init];
    [tabbar addChildController:nav1 title:@"点餐" imageName:@"food" selectedImageName:nil];
    [tabbar addChildController:nav2 title:@"我的" imageName:@"me" selectedImageName:nil];
    [CYTabBarConfig shared].backgroundColor = [UIColor colorWithRed:245/255.f green:174/255.f blue:42/255.f alpha:1];
    [CYTabBarConfig shared].textColor = [UIColor whiteColor];
    [CYTabBarConfig shared].selectedTextColor = [UIColor blackColor];
    self.window.rootViewController=tabbar;
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
