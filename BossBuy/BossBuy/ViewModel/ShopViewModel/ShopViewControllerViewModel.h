//
//  ShopViewControllerViewModel.h
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"
@interface ShopViewControllerViewModel : NSObject
@property(nonatomic,strong)NSArray *categoryArray;
@property(nonatomic,strong)NSArray *shopCategoryArray;
@property(nonatomic,strong)NSArray *shopCategotyOther;
@end
