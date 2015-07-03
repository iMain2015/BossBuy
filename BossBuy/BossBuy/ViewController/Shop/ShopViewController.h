//
//  ShopViewController.h
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopViewControllerViewModel.h"
@interface ShopViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)ShopViewControllerViewModel *viewModel;
@end
