//
//  ChooseCategoryView.h
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ChooseType) {
    ChooseTypeCategory,
    ChooseTypeCategotyShop,
    ChooseTypeCategoryOther
};

@interface ChooseCategoryView : UIView
@property(nonatomic,strong)NSArray *categoryArray;
@property(nonatomic,strong)NSArray *shopCategoryArray;
@property(nonatomic,strong)NSArray *shopCategotyOther;
@property(nonatomic,assign)ChooseType nowChooseType;
@end
