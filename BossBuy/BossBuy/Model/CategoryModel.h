//
//  CategoryModel.h
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject
//分类名称
@property(nonatomic,copy)NSString *categoryName;
//分类ID
@property(nonatomic,copy)NSString *categoryID;
//分类Image图片地址
@property(nonatomic,copy)NSString *categoryImage;

/**
 *  初始化 CategoryModel
 *
 *  @param categoryName  分类名称
 *  @param categoryID    分类ID
 *  @param categoryImage 分类Image图片地址
 *
 *  @return CategoryModel
 */
- (instancetype)initWithName:(NSString*)categoryName categoryID:(NSString*)categoryID categoryImage:(NSString*)categoryImage;

@end
