//
//  ShopInfoTableViewControllerViewModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/6.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopInfoTableViewControllerViewModel.h"

@implementation ShopInfoTableViewControllerViewModel


-(void)dealloc{
    _shopInfoDataArray = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shopInfoDataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

/**
 *  返回Cell
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return Cell
 */
-(UITableViewCell*)getCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    

    ShopCommondityCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryIdentifier];
    if (cell == nil) {
        cell = [[ShopCommondityCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCategoryIdentifier];
    }
    
    cell.shopCommondLableName.text  =[NSString stringWithFormat:@"商品分类%ld",indexPath.row];
    
    // Configure the cell...
    
    
    return cell;
    
}


/**
 *  返回行数
 *
 *  @return 返回行数
 */
-(NSInteger)getNumberOfRowsInSection{

    return _shopInfoDataArray.count;
}

@end
