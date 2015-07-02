//
//  CommodityViewControllerViewModel.h
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CommoditySubCategoryCollectionViewCell.h"
#import "CommodityCategoryTableViewCell.h"

static NSString *const kListCellIdentifier = @"CategoryCell";
static NSString *const kCollectionCellIdentifier = @"SubCategoryCell";

@interface CommodityViewControllerViewModel : NSObject


/**
 *  listView 一级菜单数据
 */
@property(nonatomic,strong)NSMutableArray *listDataArray;

/**
 *  Collection 二级菜单数据
 */
@property(nonatomic,strong)NSMutableArray *colletionDataArray;


-(NSInteger)getListViewNumberOfRowsInSection;


-(UITableViewCell*)getListViewCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)getCollectionwNumberOfRowsInSection;

-(UICollectionViewCell*)getCollectionCellForRowAtIndexPath:(UICollectionView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
