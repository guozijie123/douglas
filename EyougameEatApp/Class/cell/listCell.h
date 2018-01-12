//
//  listCell.h
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listCell : UITableViewCell

@property (nonatomic,copy)NSDictionary * listDict;
-(void)setMessageForCell:(NSDictionary *)dict;

@end
