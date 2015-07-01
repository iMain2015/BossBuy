//
//  CommodityViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "CommodityViewController.h"
#import <UIBarButtonItem+BlocksKit.h>
@interface CommodityViewController ()

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setBarButton];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
