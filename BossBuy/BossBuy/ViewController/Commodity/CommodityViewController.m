//
//  CommodityViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "CommodityViewController.h"
#import <UIBarButtonItem+BlocksKit.h>
#import "CommodityCategoryTableViewCell.h"
#import "CommoditySubCategoryCollectionViewCell.h"
@interface CommodityViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation CommodityViewController


-(void)dealloc{
    
    _viewModel = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewModel = [[CommodityViewControllerViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    [self setBarButton];
    
    [self initTableView];
    
    [self initCollectionView];
    
    
}

#pragma mark -- 初始化tableView
-(void)initTableView{

    UINib *cellnib=[UINib nibWithNibName:@"CommodityCategoryTableViewCell" bundle:nil];
   
    [self.tableView registerNib:cellnib forCellReuseIdentifier:kListCellIdentifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 44;
}

#pragma mark --  初始化CollectionView
-(void)initCollectionView{

    UINib *cellnib=[UINib nibWithNibName:@"CommoditySubCategoryCollectionViewCell" bundle:nil];
   
    
    [_collectionView registerNib:cellnib forCellWithReuseIdentifier:kCollectionCellIdentifier];
    
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    collectionViewLayout.itemSize = CGSizeMake(80, 100);
    
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


#pragma mark -- tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [_viewModel getListViewCellForRowAtIndexPath:tableView cellForRowAtIndexPath:indexPath];
}


#pragma mark -- UICollectionView Delagate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    return [_viewModel getCollectionCellForRowAtIndexPath:collectionView cellForRowAtIndexPath:indexPath];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
