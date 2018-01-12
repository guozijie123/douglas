//
//  listCell.m
//  EyougameEatApp
//
//  Created by Douglas on 2017/12/7.
//  Copyright © 2017年 Douglas. All rights reserved.
//

#import "listCell.h"
@interface listCell()
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *price;

@end
@implementation listCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"listCell" owner:self options:nil][0];
    }
    return self;
}

-(void)setMessageForCell:(NSDictionary *)dict{
    self.listDict = dict;
    self.name.text = dict[@"name"];
    self.price.text = dict[@"price"];
}


@end
