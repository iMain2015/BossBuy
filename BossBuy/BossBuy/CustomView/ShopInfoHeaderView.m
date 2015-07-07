//
//  ShopInfoHeaderView.m
//  BossBuy
//
//  Created by chenguandong on 15/7/6.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopInfoHeaderView.h"
#import <UIImageView+WebCache.h>
#import "Constants.h"

@interface ShopInfoHeaderView()

@property (strong, nonatomic)  UIImageView *shopImageView;
@property (strong, nonatomic)  UILabel *shopAdressLable;
@property (strong, nonatomic)  UILabel *shopPhoneLable;

@end

@implementation ShopInfoHeaderView


-(void)dealloc{
    _shopImageView = nil;
    _shopAdressLable = nil;
    _shopPhoneLable = nil;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _shopImageView.frame = CGRectMake(10, 10, 100, 100);
    _shopAdressLable.frame = CGRectMake(CGRectGetMaxX(_shopImageView.frame)+10, 10, SCREEN_WIDTH-130, 20);
    _shopPhoneLable.frame = CGRectMake(CGRectGetMaxX(_shopImageView.frame)+10, CGRectGetMaxY(_shopAdressLable.frame)+10, SCREEN_WIDTH-130, 20);
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _shopImageView = [[UIImageView alloc]init];
        _shopAdressLable = [[UILabel alloc]init];
        _shopPhoneLable  = [[UILabel alloc]init];
        
        [self addSubview:_shopImageView];
        [self addSubview:_shopAdressLable];
        [self addSubview:_shopPhoneLable];
    }
    return self;
}
-(void)setShopImageUrl:(NSString *)shopImageUrl{

    _shopImageUrl = shopImageUrl;
    
    [_shopImageView sd_setImageWithURL:[NSURL URLWithString:_shopImageUrl] placeholderImage:[UIImage imageNamed:@"default_icon"]];
}

-(void)setShopAdress:(NSString *)shopAdress{

    _shopAdress = shopAdress;
    _shopAdressLable.text = _shopAdress;
}

-(void)setShopPhone:(NSString *)shopPhone{
    _shopPhone = shopPhone;
    _shopPhoneLable.text = _shopPhone;
}

@end
