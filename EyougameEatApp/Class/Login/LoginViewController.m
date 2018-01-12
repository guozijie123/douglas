//
//  LoginViewController.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "LoginViewController.h"
#import "LYTextField.h"
#import "LYButton.h"
#import "UserModal.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.layer addSublayer: [self backgroundLayer]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self setUp];
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

-(void)setUp{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    titleLabel.center = CGPointMake(self.view.center.x, 150);
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"Login";
    titleLabel.font = [UIFont systemFontOfSize:40.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
    UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    detail.center = CGPointMake(self.view.center.x,630);
    detail.textColor = [UIColor whiteColor];
    detail.text = @"Don`t have an account yet? Sign Up";
    detail.font = [UIFont systemFontOfSize:13.f];
    detail.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:detail];
    
    LYTextField *username = [[LYTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    username.center = CGPointMake(self.view.center.x, 350);
    username.ly_placeholder = @"Username";
    username.tag = 0;
    [self.view addSubview:username];
    
    LYTextField *password = [[LYTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    password.center = CGPointMake(self.view.center.x, username.center.y+60);
    password.ly_placeholder = @"Password";
    password.tag = 1;
    [self.view addSubview:password];
    
    LYButton *login = [[LYButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    login.center = CGPointMake(self.view.center.x, password.center.y+100);
    [self.view addSubview:login];
    
    __block LYButton *button = login;
    
    login.translateBlock = ^{
        NSLog(@"跳转了哦");
        [UserModal defaultHelper].TokeniD = @"123456789";
        button.bounds = CGRectMake(0, 0, 44, 44);
        button.layer.cornerRadius = 22;
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}


-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:242/255.f green:184/255.f blue:50/255.f alpha:1].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.65,@1];
    return gradientLayer;
}


@end
