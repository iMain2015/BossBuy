//
//  ShopViewControllerViewModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopViewControllerViewModel.h"

@implementation ShopViewControllerViewModel

-(void)dealloc{
    
    _shopCategotyOther = nil;
    _shopCategotyOther = nil;
    _categoryArray = nil;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         _shopCategoryArray = [[NSArray alloc]init];
         _shopCategotyOther = [[NSArray alloc]init];
         _categoryArray = [[NSArray alloc]init];
         */
        
        
        _categoryArray = @[
                           [[CategoryModel alloc]initWithName:@"电脑办公" categoryID:@"1" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"手机数码" categoryID:@"2" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"图书" categoryID:@"3" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"家居建材" categoryID:@"4" categoryImage:@""],
                           ];
        
        _shopCategoryArray= @[
                               [[CategoryModel alloc]initWithName:@"商品街" categoryID:@"11" categoryImage:@""],
                               [[CategoryModel alloc]initWithName:@"推荐街" categoryID:@"22" categoryImage:@""],
                               [[CategoryModel alloc]initWithName:@"品牌街" categoryID:@"33" categoryImage:@""],
                               [[CategoryModel alloc]initWithName:@"折扣街" categoryID:@"44" categoryImage:@""],
                               ];
        _shopCategotyOther = @[
                           [[CategoryModel alloc]initWithName:@"默认" categoryID:@"111" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"距离" categoryID:@"222" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"价格" categoryID:@"333" categoryImage:@""],
                           [[CategoryModel alloc]initWithName:@"好评" categoryID:@"444" categoryImage:@""],
                           ];
        
    }
    return self;
}
@end
