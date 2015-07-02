//
//  MainTableViewControllerViewModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "MainTableViewControllerViewModel.h"
#import "Constants.h"
#import "CommodityRecommendTableViewCell.h"
@implementation MainTableViewControllerViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _dataArray  = [NSMutableArray arrayWithCapacity:10];
        
        
    }
    return self;
}


-(NSInteger)getNumberOfRowsInSection{

    return _dataArray.count;
}

-(UITableViewCell*)getCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CommodityRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CRMCELL" forIndexPath:indexPath];
    
    [cell.commodityImageView sd_setImageWithURL:[NSURL URLWithString:@"http://i3.mifile.cn/a4/T1sxVvBQxT1RXrhCrK.jpg"]];

    return cell;
    

}



@end
