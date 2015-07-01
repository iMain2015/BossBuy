//
//  MainHeaderView.h
//  BossBuy
//
//  Created by chenguandong on 15/7/1.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^ButtonClickBlock)(UIButton*);
@interface MainHeaderView : UIView
@property(nonatomic,copy)ButtonClickBlock buttonBlock;
@end
