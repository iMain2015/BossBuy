//
//  LXMainViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "LXMainViewController.h"

@interface LXMainViewController ()

@end

@implementation LXMainViewController


-(void)dealloc{
    
    _mainTableViewController = nil;
    _commodityViewController = nil;
    _shopViewController = nil;
    _newsTableViewController = nil;
    _settingViewController = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mainTableViewController = [[MainTableViewController alloc]init];
    
    _commodityViewController = [[CommodityViewController alloc]init];
    
    _shopViewController = [[ShopViewController alloc]init];
    
    _newsTableViewController = [[NewsTableViewController alloc]init];
    
    _settingViewController = [[SettingViewController alloc]init];
    
    

    //主页
    UINavigationController *mainNavigationController= [[UINavigationController alloc]initWithRootViewController:_mainTableViewController];
 
    UITabBarItem *mainTabBarItem = [[UITabBarItem alloc]initWithTitle:@"主页" image:[UIImage imageNamed:@"main_tabbar_icon"] tag:1];

    mainNavigationController.tabBarItem = mainTabBarItem;

    //商品
    UINavigationController *commodityNavigationController= [[UINavigationController alloc]initWithRootViewController:_commodityViewController];
    
    UITabBarItem *commodityTabBarItem = [[UITabBarItem alloc]initWithTitle:@"商品" image:[UIImage imageNamed:@"shangpin_tabbar_icon"] tag:2];
    
    commodityNavigationController.tabBarItem = commodityTabBarItem;
    
    //商家
    UINavigationController *shopNavigationController= [[UINavigationController alloc]initWithRootViewController:_shopViewController];
    
    UITabBarItem *shopTabBarItem = [[UITabBarItem alloc]initWithTitle:@"商家" image:[UIImage imageNamed:@"shop_tabbar_icon"] tag:3];
    
    shopNavigationController.tabBarItem = shopTabBarItem;
    
    //资讯
    
    UINavigationController *newsNavigationController= [[UINavigationController alloc]initWithRootViewController:_newsTableViewController];
    
    UITabBarItem *newsTabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯" image:[UIImage imageNamed:@"news_tabbar_icon"] tag:4];
    
    newsNavigationController.tabBarItem = newsTabBarItem;
    //个人中心
    UINavigationController *settingNavigationController= [[UINavigationController alloc]initWithRootViewController:_settingViewController];
    
    UITabBarItem *settingTabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"setting_tabbar_icon"] tag:5];
    
    settingNavigationController.tabBarItem = settingTabBarItem;
    
    
    
    [self setViewControllers:@[mainNavigationController,commodityNavigationController,shopNavigationController,newsNavigationController,settingNavigationController] animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
