//
//  ComfirBuyView.m
//  
//
//  Created by Douglas on 2017/12/12.
//

#import "ComfirBuyView.h"

@implementation ComfirBuyView

+ (UIView *)createTheComfirViewWithSize:(CGRect)size{
    
    UIView * view = [[NSBundle mainBundle] loadNibNamed:@"ComfirBuyView" owner:self options:nil][0];
    view.frame = size;
    return view;
    
//    UIView * backView = [[UIView alloc]initWithFrame:size];
//    backView.tag = 2003453;
//    backView.backgroundColor = [UIColor yellowColor];
//    UIButton * allClick = [UIButton buttonWithType:UIButtonTypeCustom];
//    allClick.frame = CGRectMake(10, size.size.height/2-10, 50, 20);
//    [allClick setTitle:@"全选" forState:0];
//    allClick.titleLabel.font = [UIFont systemFontOfSize:14];
//    [allClick setTitleColor:[UIColor blackColor] forState:0];
//    [backView addSubview:allClick];
//
//    UIButton * buy = [UIButton buttonWithType:UIButtonTypeCustom];
//    buy.frame = CGRectMake(size.size.width-100, 0, 100, size.size.height);
//    [buy setTitle:@"购买" forState:0];
//    buy.titleLabel.font = [UIFont systemFontOfSize:24];
//    [buy setTitleColor:[UIColor blackColor] forState:0];
//    [backView addSubview:buy];
//
//    UILabel * allPrice = [[UILabel alloc]initWithFrame:CGRectMake(buy.frame.origin.x-25, size.size.height/2-13.5, 25, 25)];
//    allPrice.text = @"46";
//    allPrice.textColor = [UIColor redColor];
//    allPrice.font = [UIFont boldSystemFontOfSize:18];
//    allPrice.adjustsFontSizeToFitWidth = YES;
//    [backView addSubview:allPrice];
//
//    UILabel * name = [[UILabel alloc]initWithFrame:CGRectMake(allPrice.frame.origin.x-25, size.size.height/2-12.5, 25, 25)];
//    name.text = @"价格:";
//    name.textColor = [UIColor blackColor];
//    name.font = [UIFont boldSystemFontOfSize:18];
//    name.adjustsFontSizeToFitWidth = YES;
//    [backView addSubview:name];
//    return backView;
}

+(void)removeTheSelfView{
    UIView * topView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    [[topView viewWithTag:2003453] removeFromSuperview];
}

@end
