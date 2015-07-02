//
//  ShopViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopViewController.h"
#import <UIBarButtonItem+BlocksKit.h>
#import "ChooseCategoryView.h"
#import "Constants.h"
@interface ShopViewController ()

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setBarButton];
    

    ChooseCategoryView *chooseView = [[ChooseCategoryView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+STATEBAR_HEIGH, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [self.view addSubview:chooseView];
    
}


-(void)setBarButton{
    
    UISearchBar *titleSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.navigationItem.titleView.frame.size.width, self.navigationController.navigationItem.titleView.frame.size.height)];
    titleSearchBar.placeholder = @"商家，商品";
    
    self.navigationItem.titleView  =titleSearchBar;
    
    
    UIBarButtonItem *myLocationBar  = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"location_icon"] style:UIBarButtonItemStylePlain handler:^(id sender) {
        
    }];
    
    UIBarButtonItem *myLocationCityBar  = [[UIBarButtonItem alloc]bk_initWithTitle:@"郑州" style:UIBarButtonItemStylePlain handler:^(id sender) {
        
    }];
    
    self.navigationItem.rightBarButtonItem= myLocationBar;
    self.navigationItem.leftBarButtonItem = myLocationCityBar;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
