//
//  NewsTableViewControllerViewModel.m
//  BossBuy
//
//  Created by chenguandong on 15/7/3.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "NewsTableViewControllerViewModel.h"

@implementation NewsTableViewControllerViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _newsArray = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

/**
 *  返回Cell
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return Cell
 */
-(UITableViewCell*)getCellForRowAtIndexPath:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    

    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewCellIdentifie];
    if (cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kNewCellIdentifie];
    }
    

    [cell.newsImageView sd_setImageWithURL:[NSURL URLWithString:@"http://s1.mi.com/images/about/about_index_01.jpg"] placeholderImage:nil];

    
    
    return cell;
    
}


/**
 *  返回行数
 *
 *  @return 返回行数
 */
-(NSInteger)getNumberOfRowsInSection{

    return _newsArray.count;
}

@end
