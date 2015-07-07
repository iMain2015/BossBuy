//
//  ShopInfoTableViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/6.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "ShopInfoTableViewController.h"
#import "ShopInfoHeaderView.h"
#import "Constants.h"
@interface ShopInfoTableViewController ()

@end

@implementation ShopInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[ShopInfoTableViewControllerViewModel alloc]init];
    
    self.title = @"小米手机官方旗舰店";

    ShopInfoHeaderView *headerView = [[ShopInfoHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
    
    
    self.tableView.tableHeaderView  = headerView;
    
    headerView.shopAdress = @"地址:河南省郑州市";
    headerView.shopPhone = @"电话:123123123123";
    headerView.shopImageUrl = @"http://i3.mifile.cn/a4/T1wM_TBjAT1RXrhCrK.jpg";
    
    UINib *cellnib=[UINib nibWithNibName:@"ShopCommondityCategoryTableViewCell" bundle:nil];
   
    [self.tableView registerNib:cellnib forCellReuseIdentifier:kCategoryIdentifier];
    
    self.tableView.rowHeight =44;
    
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
