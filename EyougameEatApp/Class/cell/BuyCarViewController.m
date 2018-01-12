//
//  BuyCarViewController.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/12.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "BuyCarViewController.h"
#import "UserModal.h"
#import "ComfirBuyView.h"
@interface BuyCarViewController ()
@property (nonatomic,copy)NSDictionary * listDict;
@end

@implementation BuyCarViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
    [[UserModal defaultHelper] checkTheSaveOrder_idPlistFile:^(NSMutableDictionary *dict) {
        if (dict.count == 0) {
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
            label.center = self.view.center;
            label.text = @"购物车已空，请前往选购";
            label.font = [UIFont systemFontOfSize:32];
            label.textColor = [UIColor grayColor];
            label.adjustsFontSizeToFitWidth = YES;
            [self.view addSubview:label];
        }else{
            
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    UIView *rightButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, 60, 30)];
    UIButton *historyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [historyBtn setTitle:@"返回" forState:0];
    [historyBtn setTitleColor:[UIColor blackColor] forState:0];
    historyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [rightButtonView addSubview:historyBtn];
    [historyBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightCunstomButtonView = [[UIBarButtonItem alloc] initWithCustomView:rightButtonView];
    
    
    self.navigationItem.leftBarButtonItem = rightCunstomButtonView;
    
    UIView * topView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    UIView * footView = [ComfirBuyView createTheComfirViewWithSize:CGRectMake(0, topView.frame.size.height-60, topView.frame.size.width, 60)];
    [topView addSubview:footView];
}

-(void)backBtnAction{
    [ComfirBuyView removeTheSelfView];
    [self.navigationController popViewControllerAnimated:YES];
    [self.tabBarController.tabBar setHidden:NO];
}



@end
