//
//  CommodityViewController.h
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommodityViewControllerViewModel.h"
@interface CommodityViewController : UIViewController
//一级菜单列表
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//二级菜单列表
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,strong)CommodityViewControllerViewModel *viewModel;

@end
