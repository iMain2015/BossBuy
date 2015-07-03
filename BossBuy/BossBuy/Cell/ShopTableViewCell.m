//
//  ShopTableViewCell.m
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopTableViewCell.h"

@implementation ShopTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.shopImageView.layer.cornerRadius = 5;
    self.shopImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
