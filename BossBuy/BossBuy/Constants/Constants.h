//
//  Constants.h
//  StudyProject
//
//  Created by chenguandong on 15/6/1.
//  Copyright (c) 2015年 chenguandong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkTools.h"
#import "MBProgressHUD+LXProgressHUD.h"
#import "JsonTools.h"
#import <UIView+Toast.h>
#import <UIImageView+WebCache.h>
#import "UserTools.h"

#define ServiceAdress @"http://116.255.239.201:8080/xuezhabao/wg?json="

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define STATEBAR_HEIGH ([[UIApplication sharedApplication] statusBarFrame].size.height)

#define SharedApp ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define ISDEBUG NO

//table name

#define CD_FavouriteEntity @"FavouriteEntity"


//extern NSString *const  FavouriteBean_title;


