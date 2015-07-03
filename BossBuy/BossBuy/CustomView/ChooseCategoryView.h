//
//  ChooseCategoryView.h
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"

static CGFloat const kCategoryTableViewHeigh = 44;

typedef NS_ENUM(NSInteger, ChooseType) {
    //电脑,笔记本
    ChooseTypeCategory,
    //推荐街,回收街
    ChooseTypeCategotyShop,
    //距离 好评等
    ChooseTypeCategoryOther
};

@protocol CategoryDelegate <NSObject>
//分类button点击事件
-(void)buttonClick:(ChooseType)type button:(UIButton*)button;
/**
 *  分类点击事件
 *
 *  @param categoryModel  分类信息Model
 *  @param type          当前选中时那个分类下的分类
 */
-(void)categoryClick:(CategoryModel*)categoryModel chooseType:(ChooseType)type;

@end



@interface ChooseCategoryView : UIView
@property(nonatomic,strong)NSArray *categoryArray;
@property(nonatomic,strong)NSArray *shopCategoryArray;
@property(nonatomic,strong)NSArray *shopCategotyOther;

@property(nonatomic,strong)NSArray *nowCategoryArray;

@property(nonatomic,assign)ChooseType nowChooseType;


@property(weak,nonatomic)id<CategoryDelegate>delegate;


@end
