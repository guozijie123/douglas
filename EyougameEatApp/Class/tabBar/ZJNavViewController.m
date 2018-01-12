//
//  ZJNavViewController.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "ZJNavViewController.h"

@interface ZJNavViewController ()

@end

@implementation ZJNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationBar setLargeTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,nil]];
//    self.navigationBar.prefersLargeTitles = YES;
//    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    [self.navigationBar setTintColor:[UIColor clearColor]];
    self.navigationBar.translucent = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:245/255.f green:174/255.f blue:42/255.f alpha:1]];
    [self.navigationBar setAlpha:1.f];
    [self.navigationBar setTintColor:[UIColor colorWithRed:245/255.f green:174/255.f blue:42/255.f alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
