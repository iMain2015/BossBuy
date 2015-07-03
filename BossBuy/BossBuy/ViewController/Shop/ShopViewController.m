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
@interface ShopViewController ()<CategoryDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)ChooseCategoryView *chooseView;
@end

@implementation ShopViewController


-(void)dealloc{
    _viewModel = nil;
    _chooseView = nil;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _viewModel = [[ShopViewControllerViewModel alloc]init];
    
    [self setBarButton];
    

    _chooseView = [[ChooseCategoryView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+STATEBAR_HEIGH, SCREEN_WIDTH, 44)];
    
    _chooseView.delegate = self;
    
    _chooseView.categoryArray = _viewModel.categoryArray;
    
    _chooseView.shopCategotyOther = _viewModel.shopCategotyOther;
    
    _chooseView.shopCategoryArray = _viewModel.shopCategoryArray;
    
    [self.view addSubview:_chooseView];
    
    
    

    
    
    _tableView.delegate = self;
    
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


#pragma mark -- categoryButton Click delagate
-(void)buttonClick:(ChooseType)type button:(UIButton*)button{

   
    
    CGFloat nowTableHeigh ;
    switch (type) {
        case ChooseTypeCategory:
            nowTableHeigh = _viewModel.categoryArray.count*kCategoryTableViewHeigh;
            break;
        case ChooseTypeCategotyShop:
            nowTableHeigh = _viewModel.shopCategoryArray.count*kCategoryTableViewHeigh;
            break;
        case ChooseTypeCategoryOther:
            nowTableHeigh = _viewModel.shopCategotyOther.count*kCategoryTableViewHeigh;
            break;
            
        default:
            break;
    }
    
     _chooseView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height+STATEBAR_HEIGH, SCREEN_WIDTH,nowTableHeigh );//SCREEN_HEIGHT
}

-(void)categoryClick:(CategoryModel*)categoryModel chooseType:(ChooseType)type{
    
    _chooseView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height+STATEBAR_HEIGH, SCREEN_WIDTH, 44);
    
    NSLog(@"%@,%@",categoryModel.categoryName,categoryModel.categoryID);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    cell.textLabel.text =@"xxxx";
    
    
    return cell;
}


@end
