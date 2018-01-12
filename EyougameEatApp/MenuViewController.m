//
//  MenuViewController.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "MenuViewController.h"
#import "listCell.h"
#import "LoginViewController.h"
#import "UserModal.h"
#import <zhPopupController/zhPopupController.h>
#import "zhAlertView.h"
#import "UIColor+Extend.h"
#import "BuyCarViewController.h"
@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)UITableView * tableView1;
@property (nonatomic,weak)UITableView * tableView2;
@property (nonatomic,strong)NSArray * array1;
@property (nonatomic,strong)NSArray * array2;
@property (nonatomic,strong)UIView * redView;
@end

@implementation MenuViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setUpAllChildViewController];
}

-(NSArray *)array1{
    if (!_array1) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"duchengList" ofType:@"plist"];
        _array1 = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _array1;
}

-(NSArray *)array2{
    if (!_array2) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"yinxingList" ofType:@"plist"];
        _array2 = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _array2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订餐";
    
    UIView *rightButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, 30, 30)];
    UIButton *historyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButtonView addSubview:historyBtn];
    [historyBtn setImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
    [historyBtn addTarget:self action:@selector(goToTheBuyCar) forControlEvents:UIControlEventTouchUpInside];
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(35, -5, 10, 10)];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.layer.cornerRadius = 5;
    self.redView.layer.masksToBounds = YES;
    [self.redView setHidden:YES];
    [historyBtn addSubview:self.redView];
    
    UIBarButtonItem *rightCunstomButtonView = [[UIBarButtonItem alloc] initWithCustomView:rightButtonView];
    
    
    self.navigationItem.rightBarButtonItem = rightCunstomButtonView;
    
    
    self.view.tag = 3004;
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        
        *selColor = [UIColor colorWithRed:222/255.f green:145/255.f blue:193/255.f alpha:1];
        *norColor = [UIColor colorWithRed:4/255.f green:4/255.f blue:15/255.f alpha:1];
        *titleScrollViewBgColor = [UIColor colorWithRed:245/255.f green:174/255.f blue:42/255.f alpha:1];
        *isOpenShade = YES;
        *isShowPregressView = YES;
    }];
    
    [self setUpTopTitleViewAttribute:^(CGFloat *topDistance, CGFloat *titleViewHeight) {
        *topDistance = -5;
        *titleViewHeight = 40;
    }];
    
    [self setUpTitleScale:^(CGFloat *titleScale) { //titleScale范围在0到1之间  <0 或者 > 1 则默认不缩放 默认设置titleScale就开启缩放，不设置则关闭
        *titleScale = 0.3;
    }];
    
    [self scrollViewWillDidScrollViewEnd:^(CGFloat offX) {
        NSLog(@"hhahahahahaha- x : %f",offX);
    }];
}

-(void)goToTheBuyCar{
    [self.navigationController pushViewController:[BuyCarViewController new] animated:YES];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    if ([UserModal defaultHelper].TokeniD!=nil) {
//        return;
//    }
//    [self presentViewController:[LoginViewController new] animated:YES completion:^{
//
//
//    }];
}

- (void)setUpAllChildViewController
{
    NSArray *titles = @[@"都城",@"银星"];
    for (NSInteger i = 0; i < titles.count; i++) {
        __block UIViewController *vc = [UIViewController new];
        vc.title = titles[i];
        vc.view.tag = 2000+i;
        vc.view.backgroundColor = [UIColor whiteColor]; 
        UITableView * table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height-144) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        table.tag = 3000+i;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [vc.view addSubview:table];
        if (table.tag == 3000) {
            self.tableView1 = table;
        }else{
            self.tableView2 = table;
        }
        [self addChildViewController:vc];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
       [self setUpRefreshDisplay]; //刷新
    });
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 3000) {
        return self.array1.count;
    }else{
        return self.array2.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 3000) {
        listCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[listCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            [cell setMessageForCell:self.array1[indexPath.row]];
        }
        return cell;
    }else{
        listCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[listCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            [cell setMessageForCell:self.array2[indexPath.row]];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    listCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    zhAlertView *alert = [self alertView1];
    zhAlertButton *cancelButton = [zhAlertButton buttonWithTitle:@"取消" handler:NULL];
    zhAlertButton *okButton = [zhAlertButton buttonWithTitle:@"确定" handler:^(zhAlertButton * _Nonnull button) {
        [self.zh_popupController dismiss];
        [[UserModal defaultHelper] createSaveOrder_idPlistFile:cell.listDict];
        [self.redView setHidden:NO];
    }];
    cancelButton.lineColor = [UIColor colorWithHexString:@"#FC7541"];
    okButton.lineColor = cancelButton.lineColor;
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"#FC7541"] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor colorWithHexString:@"#FC7541"] forState:UIControlStateNormal];
    cancelButton.edgeInsets = UIEdgeInsetsMake(15, 0, 0, 0);
    [alert adjoinWithLeftAction:cancelButton rightAction:okButton];
    
    self.zh_popupController = [[zhPopupController alloc] init];
    [self.zh_popupController dropAnimatedWithRotateAngle:30];
    [self.zh_popupController presentContentView:alert duration:0.75 springAnimated:YES];
}
- (zhAlertView *)alertView1 {
    zhAlertView *alertView = [[zhAlertView alloc] initWithTitle:@"提示"
                                                        message:@"是否把当前货物加入购物车？"
                                                  constantWidth:290];
    return alertView;
}
@end
