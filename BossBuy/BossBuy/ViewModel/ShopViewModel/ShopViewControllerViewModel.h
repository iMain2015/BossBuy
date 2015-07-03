//
//  ShopViewControllerViewModel.h
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryModel.h"
#import <UIKit/UIKit.h>
static NSString *const kShopCellIdentifier = @"ShopCell";

@interface ShopViewControllerViewModel : NSObject
@property(nonatomic,strong)NSArray *categoryArray;
@property(nonatomic,strong)NSArray *shopCategoryArray;
@property(nonatomic,strong)NSArray *shopCategotyOther;


@property(nonatomic,strong)NSMutableArray *shopListData;

/**
 *  返回Cell
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return Cell
 */
-(UITableViewCell*)getCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 *  返回行数
 *
 *  @return 返回行数
 */
-(NSInteger)getNumberOfRowsInSection;
@end
