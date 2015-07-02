//
//  MainTableViewControllerViewModel.h
//  BossBuy
//
//  Created by chenguandong on 15/7/2.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainTableViewControllerViewModel : NSObject

@property(nonatomic,strong)NSMutableArray *dataArray;
/**
 *  返回Cell
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return Cell
 */
-(UITableViewCell*)getCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 *  返回行数
 *
 *  @return 返回行数
 */
-(NSInteger)getNumberOfRowsInSection;

@end
