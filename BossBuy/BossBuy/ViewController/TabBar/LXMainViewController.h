//
//  LXMainViewController.h
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
#import "CommodityViewController.h"
#import "ShopViewController.h"
#import "NewsTableViewController.h"
#import "SettingViewController.h"
@interface LXMainViewController : UITabBarController
/**
 *  主页
 */
@property(nonatomic,strong)MainTableViewController *mainTableViewController;
/**
 *  商品
 */
@property(nonatomic,strong)CommodityViewController *commodityViewController;
/**
 *  商家
 */
@property(nonatomic,strong)ShopViewController *shopViewController;
/**
 *  资讯
 */
@property(nonatomic,strong)NewsTableViewController *newsTableViewController;

/**
 *  设置
 */
@property(nonatomic,strong)SettingViewController *settingViewController;
@end
