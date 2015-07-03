//
//  SettingViewController.m
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SettingModel.h"
#import "SettingHeaderTableViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人中心";
    
    _settingArray = [NSMutableArray arrayWithCapacity:10];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"];
    NSMutableArray *plistArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    for (NSDictionary *dic in plistArr) {
        SettingModel *settingModel  = [[SettingModel alloc]init];
        settingModel.settingName  = dic[@"settingName"];
        settingModel.settingIcon = dic[@"settingIcon"];
        
        NSLog(@"%@",dic[@"settingName"]);
        
        [_settingArray addObject:settingModel];
    }
    

    UINib *cellnib=[UINib nibWithNibName:@"SettingTableViewCell" bundle:nil];
    
    [self.tableView registerNib:cellnib forCellReuseIdentifier:@"SettingCell"];
    
    //HeadCell
    
    UINib *headerCellnib=[UINib nibWithNibName:@"SettingHeaderTableViewCell" bundle:nil];
    
    [self.tableView registerNib:headerCellnib forCellReuseIdentifier:@"HearerCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 165;
    }else{
        return 44;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            
            return 1;
            break;
            
        case 1:
            return 4;
            break;
            
        case 2:
            return 5;
            break;
            
        default:
            break;
    }
    

    return 0;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.section==0) {
        static NSString *CellIdentifier = @"HearerCell";
         SettingHeaderTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[SettingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        [cell.loginButton addTarget:self action:@selector(loginButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        return cell;
    }
    
    
    static NSString *CellIdentifier = @"SettingCell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    
    
    NSLog(@"%ld",indexPath.row);
    
    
    
    switch (indexPath.section) {
        case 0:
        {
           
        }
            
            break;
        case 1:
        {
            SettingModel *settingModel = _settingArray[indexPath.row];
            cell.settingNameLable.text =settingModel.settingName;
            
             cell.settingImageView.image  =[UIImage imageNamed:settingModel.settingIcon];
        }
           
            break;
        case 2:
        {
            SettingModel *settingModel = _settingArray[indexPath.row+4];
            cell.settingNameLable.text =settingModel.settingName;
            cell.settingImageView.image  =[UIImage imageNamed:settingModel.settingIcon];
        }
            
            break;
        default:
            break;
    }
    
    
    return cell;
}


-(void)loginButtonClickAction:(id)sender{
    
    UIButton *button = (UIButton*)sender;
    
    NSLog(@"xxxxxx");
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
