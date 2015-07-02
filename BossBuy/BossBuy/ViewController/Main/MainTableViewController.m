//
//  MainTableViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainHeaderView.h"
#import "Constants.h"
#import "AdScrollView.h"
#import <UIBarButtonItem+BlocksKit.h>
#import "CommodityRecommendTableViewCell.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

-(void)dealloc{

    _viewModel = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewModel = [[MainTableViewControllerViewModel alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
 
    [self setTableView];
    

    [self setBarButton];
}


-(void)setTableView{

    MainHeaderView *mainHeaderView= [[MainHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    mainHeaderView.buttonBlock = ^(UIButton*button){
        
        NSLog(@"%ld",button.tag);
        
    };
    
    AdScrollView *adScrollView=[[AdScrollView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 200)];
    adScrollView.imageArray = @[@"https://www.baidu.com/img/bdlogo.png",@"http://news.baidu.com/resource/img/logo_news_276_88.png?date=20150104"];
    
    adScrollView.adClick = ^(UIImageView*imageView){
        
        NSLog(@"图片=%ld",imageView.tag);
    };
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    [headView addSubview:mainHeaderView];
    
    [headView addSubview:adScrollView];
    
    self.tableView.tableHeaderView = headView;
    
    
    UINib *cellnib=[UINib nibWithNibName:@"CommodityRecommendTableViewCell" bundle:nil];
   
    [self.tableView registerNib:cellnib forCellReuseIdentifier:kCell];
    
    self.tableView.rowHeight = 80;
   
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

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
   
    return [_viewModel getCellForRowAtIndexPath:tableView cellForRowAtIndexPath:indexPath];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
