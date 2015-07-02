//
//  CommodityViewControllerViewModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "CommodityViewControllerViewModel.h"
#import "Constants.h"
@implementation CommodityViewControllerViewModel

-(void)dealloc{
    _listDataArray = nil;
    _colletionDataArray = nil;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _listDataArray  = [NSMutableArray arrayWithCapacity:10];
        _colletionDataArray = [NSMutableArray arrayWithCapacity:10];
        
        
    }
    return self;
}


-(NSInteger)getListViewNumberOfRowsInSection{
    
    return _listDataArray.count;
}

-(UITableViewCell*)getListViewCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommodityCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kListCellIdentifier forIndexPath:indexPath];
    cell.categoryLable.text = [NSString stringWithFormat:@"分类%ld",indexPath.row];
    return cell;

}



-(NSInteger)getCollectionwNumberOfRowsInSection{

    return _colletionDataArray.count;
}

-(UICollectionViewCell*)getCollectionCellForRowAtIndexPath:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommoditySubCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellIdentifier forIndexPath:indexPath];
    
    [cell.subCategoryImageView sd_setImageWithURL:[NSURL URLWithString:@"http://i3.mifile.cn/a4/T1U5WgBKAT1RXrhCrK.jpg"]];
    
    cell.subCategoryLable.text = @"平板电脑";

    return cell;
    

}






@end
